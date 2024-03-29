FROM node:lts-slim

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
    svm install 0.8.20 && \
    svm use 0.8.20 && \
    cargo install solstat

RUN curl -L https://foundry.paradigm.xyz | bash
RUN source ~/.bashrc && foundryup

# Update PATH to include foundry
ENV PATH="/root/.cargo/bin:/root/.foundry/bin:${PATH}"

# Start in the shell
ENTRYPOINT [ "/bin/bash" ]