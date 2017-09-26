FROM jimmycuadra/rust

ADD . /src

RUN cd /src && cargo build -v --release

CMD ["/src/target/release/hello"]