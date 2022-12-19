FROM node:18-slim

# install deps
RUN apt update
RUN apt install -y g++ make curl git
SHELL ["/bin/bash", "-c"]
RUN curl -sSf https://sh.rustup.rs | bash -s -- -y
RUN echo "source ~/.cargo/env" > ~/.bashrc
RUN source ~/.bashrc && cargo install svm-rs && svm install 0.7.6 && svm install 0.8.17 && svm use 0.8.17
RUN curl -L https://foundry.paradigm.xyz | bash
RUN source ~/.bashrc && foundryup

# start in the shell
ENTRYPOINT [ "/bin/bash" ]