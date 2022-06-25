FROM liuchong/rustup:latest

# Install deps
RUN apt update -y
RUN apt install curl wget unzip -y
RUN apt install -y libext2fs-dev
RUN apt install -y git

# Build Akula
RUN git clone https://github.com/akula-bft/akula
RUN cd akula \
    && cargo build --all --profile=production

# Run node
WORKDIR /akula
CMD ["./run-akula.sh"]