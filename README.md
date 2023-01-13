
# Foundry builder image

Run this container image locally:

```zsh
docker run --rm -it --mount src=`pwd`,target=/source,type=bind ghcr.io/nayms/contracts-builder:latest
```

### Publishing the new container image

In case you need to make any updates to this image, push changes to `master` (or any other) branch and manually trigger the `Build and Publish Docker` workflow in github actions, for the respective branch. This will be tagged as the latest image and picked up automatically by the workflow in the [contracts-v3](https://github.com/nayms/contracts-v3) repository.
