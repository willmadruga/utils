#!/usr/bin/env zsh
 

# Deletes local and remote branches already merged into Development and owned by user configured in git config.
# Script ignores HEAD and master refnames to avoid improper deletion
 
# TODO
# ----
#
# Bugs:
#
# 1. Need to better differentiate local from remote.
# 2. Double confirmation when deleting from remote.
#
# Improvements:
#
# 1. Add flag to skip confirmation (by supporting multiple flags instead of one at the time)
# 2. Move dry-run to be another option using multiple flags, instead of having its own function implementation
 
function show_usage() {
  echo "Usage:"
  echo "  $0 [flag] [merged_to]"
  echo
  echo "flags:"
  echo "  -d : dry-run"
  echo "  -l : local branches only"
  echo "  -r : remote branches only"
  echo "  -a : all branches (local and remote)"
  echo
  echo "merged_to:"
  echo "  name of remote branch to find merge commit - default is 'Development'"
  echo
  echo "Note: at the moment, only one flag is supported."
}
 
function confirm() {
  read -p "Delete $1 branch $2? (y/n)" choice
  echo $choice
}
 
function dry_run() {
  ret=$(confirm "dry-run" $1)
  if [[ "$ret" == "y" ]] || [[ "$ret" == "Y" ]]
  then
    echo "DRY-RUN: $1 would be deleted if already merged"
  else
    echo "DRY-RUN: $1 skipped deletion"
  fi
}
 
function delete_local() {
  ret=$(confirm "local" $1)
  if [[ "$ret" == "y" ]] || [[ "$ret" == "Y" ]]
  then
    echo "Deleting local branch $1"
    git branch -D $1
  else
    echo "$1 skipped deletion"
  fi
}
 
function delete_remote() {
  # check if merged to Development (or branch given in command line)
  is_merged=$(git log --merges | grep "Merge branch '$1' into $2")
  if [[ $is_merged =~ "$branch" ]]; then
    # Git already asks for confirmation. Should remove my confirmation here.
    ret=$(confirm "remote" $1)
    if [[ "$ret" == "y" ]] || [[ "$ret" == "Y" ]]
    then
      echo "Deleting remote branch $branch"
      git push -d origin $branch
    else
      echo "$1 skipped deletion"
    fi
  else
    echo 'Skipping unmerged branch' $branch
  fi
}
 
function main() {
 
  if [[ -z $1 ]] || [[ ${#1} -ne 2 ]]
  then
    show_usage
    exit 1
  fi
 
  git_user=$(git config --get user.name)
  merged_to_branch='Development'
  if [ -z $2 ]; then
    merged_to_branch=$2
  fi
 
  if [ -d '.git' ]; then
 
    # Fetch all branch modifications
    git checkout Development
    git fetch --all -p
 
    # For all branches I am the last author:
    branches=$(git for-each-ref --format='%(committername) %(refname:short)' | egrep -v 'master|HEAD' | egrep "$git_user" | sed -e "s/$git_user//" | sed -e "s/origin\///" | sort | uniq)
    if [ -n "$branches" ]; then
      for branch in $branches
      do
        case "$1" in
          "-d")
            dry_run $branch
            ;;
          "-l")
            delete_local $branch
            ;;
          "-r")
              delete_remote $branch $merged_to_branch
            ;;
          "-a")
            delete_local $branch && delete_remote $branch $merged_to_branch
            ;;
          *)
            show_usage
            ;;
        esac
      done
    fi
  else
    echo 'Must be on a git repository. Try changing directories'
  fi
}
 
main $1 $2
