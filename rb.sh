rb_dockerfile() {
  if [ -z "$1" ]; then
    echo "Usage: rb_dockerfile <filename>"
    return 1
  fi

  FILE_NAME="$1"

  cat <<EOF >Dockerfile
FROM ruby:3.0-slim

COPY ${FILE_NAME}.rb /app/${FILE_NAME}.rb

WORKDIR /app

CMD ["sh", "-c", "ruby ${FILE_NAME}.rb > output.txt"]
EOF
}
