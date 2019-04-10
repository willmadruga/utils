#!/usr/bin/env python3
import glob
import sys
import os
import shutil
import random

# DESCRIPTION:
# Moves files to folders named after a file extension
#
# Use on-demand or listen for changes with watchdog
# pip3 install watchdog
# watchmedo shell-command --command='folder_organizer.py' 

# Constants
FILE_TYPES = "*.*"
DEFAULT_DIR = "/home/wmadruga/Downloads/"
TARGET_DIR = sys.argv[1]+"/"+FILE_TYPES if len(sys.argv) > 1 else DEFAULT_DIR + FILE_TYPES
DIRECTORY = TARGET_DIR.rpartition('/')[0]


# Creates the destination folder if non-exitent
def create_destination(folder):
  path = DIRECTORY + '/' + folder
  try:
    os.listdir(path)
  except FileNotFoundError as fnfe:
    os.mkdir(path)

# Moves the file to folder.
# If file exists in destination folder then add a random number at the end of filename
def move_to(folder, file):
  path = DIRECTORY + '/' + folder
  try:
    print('Moving ' + file + ' to ' + path)
    shutil.move(file, path)
  except shutil.Error as err:
    # Handle duplicated files
    rand = "_" + str(random.randint(0,1000)) + "."
    dest_file = file.replace('.', rand)
    shutil.move(file, dest_file)
    shutil.move(dest_file, path)

if __name__ == "__main__":
  files = glob.glob(TARGET_DIR)
  for f in files:
    filename = f.rsplit('/')[-1]
    folder = filename.split('.')[-1]
    create_destination(folder)
    move_to(folder, f)

