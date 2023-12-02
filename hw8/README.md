# Build and run hello server

#### Note: make sure docker desktop is installed on your host system

## Checkout source code

In the current folder, checkout source code to the parent folder

```sh
git clone https://github.com/drines-uc/hello_http.git ../hello_http
```

If you checkout the source code to a different location or under a different name, make sure to modify the "docker run" below to reflect the source code folder.

## Create ubuntu_dev docker image (this only needs to be done once)

```docker
docker build -t ubuntu_dev .
```

## Use the ubuntu_dev image to build and run hello server

```sh
docker run -dp 127.0.0.1:12344:8080 --name=hello -w /app --mount \
 type=bind,src="$(pwd)/../hello_http",target=/app \
 ubuntu_dev sh -c "gcc -o dummyserv dummy_serv.c && ./dummyserv"
```

or

```
docker run -dp 127.0.0.1:12344:8080 --name=hello -w /app -v "$(pwd)/../hello_http":/app \
 ubuntu_dev sh -c "gcc -o dummyserv dummy_serv.c && ./dummyserv"
```

## Access hello webserver

Once container is running, go to your browser and access the hello server
[http://127.0.0.1:12344/] or [http://localhost:12344/]

## Shutdown Container

When done, stop and delete the container

```sh
docker stop hello
docker rm hello
```
