cpp_dockerfile() {
  if [ -z "$1" ]; then
    echo "Usage: cpp_dockerfile <filename>"
    return 1
  fi

  FILE_NAME="$1"

  cat <<EOF >Dockerfile
FROM gcc:latest

COPY ${FILE_NAME}.cpp /${FILE_NAME}.cpp

RUN g++ -o ${FILE_NAME} ${FILE_NAME}.cpp

CMD ["sh", "-c", "./${FILE_NAME} > /app/output.txt"]
EOF
}
