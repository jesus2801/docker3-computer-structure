js_dockerfile() {
  if [ -z "$1" ]; then
    echo "Usage: js_dockerfile <filename>"
    return 1
  fi

  FILE_NAME="$1"

  cat <<EOF >Dockerfile
FROM node:16-slim

COPY ${FILE_NAME}.js /app/${FILE_NAME}.js

WORKDIR /app

CMD ["sh", "-c", "node ${FILE_NAME}.js > output.txt"]
EOF
}
