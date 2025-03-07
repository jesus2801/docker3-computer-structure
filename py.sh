py_dockerfile() {
  if [ -z "$1" ]; then
    echo "Usage: py_dockerfile <filename>"
    return 1
  fi

  FILE_NAME="$1"

  cat <<EOF >Dockerfile
FROM python:3.9-slim

COPY ${FILE_NAME}.py /app/${FILE_NAME}.py

WORKDIR /app

CMD ["sh", "-c", "python ${FILE_NAME}.py > output.txt"]
EOF
}
