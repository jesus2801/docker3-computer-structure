#!/bin/bash

# Prompt the user for a file path
echo -n "Enter the path to the file: "
read file_path

# Check if the file exists
if [[ ! -f "$file_path" ]]; then
  echo "File does not exist."
  exit 1
fi

# Extract the file extension
extension="${file_path##*.}"

# Check if the extension is supported
case "$extension" in
py | java | cpp | js | rb)
  echo "File extension .$extension is supported."
  ;;
*)
  echo "Extension not supported."
  ;;
esac
