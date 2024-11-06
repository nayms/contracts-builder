FROM node:lts-slim

LABEL org.opencontainers.image.source=https://github.com/nayms/contracts-builder

# setup system dependencies
RUN apt update && apt install -y g++ make curl git jq python3 python3-pip build-essential
RUN pip3 install slither-analyzer --break-system-packages

# setup rust
SHELL ["/bin/bash", "-c"]
RUN curl -sSf https://sh.rustup.rs | bash -s -- -y
RUN echo "source ~/.cargo/env" > ~/.bashrc

# setup foundry
RUN source ~/.bashrc && \
    cargo install svm-rs && \
    svm install 0.7.6 && \
    svm install 0.8.24 && \
    svm use 0.8.24 && \
    cargo install solstat

RUN curl -L https://foundry.paradigm.xyz | bash
RUN source ~/.bashrc && foundryup -v nightly-7f0f5b4c1aa75dc4fd2eb15aca9757491d885902

# Update PATH to include foundry
ENV PATH="/root/.cargo/bin:/root/.foundry/bin:${PATH}"

# Start in the shell
ENTRYPOINT [ "/bin/bash" ]
