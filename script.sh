#!/bin/bash

#import the functions to generate the Docker files
source js.sh
source rb.sh
source java.sh
source cpp.sh
source py.sh

# Cleaning last execution
rm -rf py/
rm -rf js/
rm -rf java/
rm -rf cpp/
rm -rf rb/

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

# Extract the file name from the path
file_name=$(basename "$file_path" | cut -d. -f1)

# Check if the extension is supported and generate the Dockerfile
case "$extension" in
py)
  py_dockerfile "$file_name"
  ;;
js)
  js_dockerfile "$file_name"
  ;;
java)
  java_dockerfile "$file_name"
  ;;
rb)
  rb_dockerfile "$file_name"
  ;;
cpp | cc)
  # in order to avoid problems, if the file is .cc, then rename it to .cpp
  if [[ "$extension" == "cc" ]]; then
    mv "$file_path" "$(dirname "$file_path")/${file_name}.cpp"
    file_path="$(dirname "$file_path")/${file_name}.cpp"
  fi
  extension="cpp"
  cpp_dockerfile "$file_name"
  ;;

*)
  echo "Extension not supported."
  exit 1
  ;;
esac

# create the dir and copy the required files (Dockerfile and program)
mkdir "$extension"
cp "$file_path" "${extension}/"
mv Dockerfile "${extension}/"

# Go to the dir
cd "$extension"
# remove the image and container if they exist
docker rm -f "${extension}-container" >/dev/null 2>&1
docker rmi -f "${extension}-image" >/dev/null 2>&1

# create the image and run the container
docker build --no-cache -t "${extension}-image" .
echo "image built, now running the container..."
docker run --name "${extension}-container" -v "$(pwd)":/app "${extension}-image"

# print the results
echo -e "\e[33mThe output of the program can be found at ${extension}/output.txt\e[0m"
echo -e "\e[34mThe program was successfully executed in $(cat output.txt) ms\e[0m"
cd ..
