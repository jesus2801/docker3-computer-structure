# Docker-Benchmark-Base

This repository executes a given program and measures its consumed time. Only the five most popular programming languages are supported.

## Instructions for use (Play with Docker)

Add a new instance and clone the repository:

```
git clone https://github.com/jesus2801/docker3-computer-structure.git
```

Then, move to the folder:

```
cd docker3-computer-structure/
```

Once in the folder, create the image:

```
docker build --no-cache -t dind .
```

After creating the image, start the docker DinD container:

```
docker run --privileged --name dind-container -d dind
```

Finally, run the bash script:

```
docker exec -it dind-container sh -c "bash /app/script.sh"
```

The script will ask you for a file, you can use one of the following files:

```
samples/sample.rb
samples/sample.js
samples/Sample.java
samples/sample.py
samples/sample.cpp
```
These sample files generate a vector of 16000 random elements and then apply bubble sort.

After running the script, you may want to see the output of the program, so you can use any of the following commands depending on the case:

```
docker exec -it dind-container sh -c "cat /app/js/output.txt"
docker exec -it dind-container sh -c "cat /app/rb/output.txt"
docker exec -it dind-container sh -c "cat /app/java/output.txt"
docker exec -it dind-container sh -c "cat /app/py/output.txt"
docker exec -it dind-container sh -c "cat /app/cpp/output.txt"
```

NOTE: If you want to use your own file, you should place it IN the repository folder BEFORE building the DinD image, and then pass to the script the relative path (from the repository folder) of the file.

## Authors

- [@jesus2801](https://github.com/jesus2801) Jesús David García Vargas
- [@angelicampp](https://github.com/angelicampp) Angélica Michelle Pupo Pallares

## License

[MIT](https://choosealicense.com/licenses/mit/)
