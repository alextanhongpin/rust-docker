# Dockerizing Rust Application

## Method 1

Using the `Dockerfile` provided.


# Method 2

Based on the blog [here](https://blog.semicolonsoftware.de/building-minimal-docker-containers-for-rust-applications/).


```bash
$ alias rust-musl-builder='docker run --rm -it -v "$(pwd)":/home/rust/src ekidd/rust-musl-builder'
$ rust-musl-builder cargo build --release
```

The `Dockerfile`:

```Dockerfile
FROM scratch

ADD target/x86_64-unknown-linux-musl/release/rust-docker /

CMD ["/rust-docker"]
```

Build:
```bash
$ docker build -t alextanhongpin/rust-hello-world .
```

Output: 

```
Sending build context to Docker daemon  9.465MB
Step 1/3 : FROM scratch
 --->
Step 2/3 : ADD target/x86_64-unknown-linux-musl/release/rust-docker /
 ---> 6f9ecb1de8da
Step 3/3 : CMD ["/rust-docker"]
 ---> Running in b0f47292bcc5
Removing intermediate container b0f47292bcc5
 ---> fc35abffdda2
Successfully built fc35abffdda2
Successfully tagged alextanhongpin/rust-hello-world:latest
```

Validate:

```bash
$ docker images | grep rust
```

Output:

```
alextanhongpin/rust-hello-world          latest              fc35abffdda2        14 seconds ago      5.3MB
ekidd/rust-musl-builder                  latest              47f1dcb39d29        13 hours ago        1.3GB
```
