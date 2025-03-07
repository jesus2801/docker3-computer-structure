java_dockerfile() {
  if [ -z "$1" ]; then
    echo "Usage: java_dockerfile <filename>"
    return 1
  fi

  FILE_NAME="$1"

  cat <<EOF >Dockerfile
FROM openjdk:17-slim

COPY ${FILE_NAME}.java /${FILE_NAME}.java

RUN javac ${FILE_NAME}.java

CMD ["sh", "-c", "java ${FILE_NAME} > /app/output.txt"]
EOF
}
