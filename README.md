<div align="center" width="100%">


# No Fuss Computing - Docker Buildx with QEMU

<br>

![Project Status - Active](https://img.shields.io/badge/Project%20Status-Active-green?logo=gitlab&style=plastic) 

<br>

![Gitlab forks count](https://img.shields.io/badge/dynamic/json?label=Forks&query=%24.forks_count&url=https%3A%2F%2Fgitlab.com%2Fapi%2Fv4%2Fprojects%2F45926238%2F&color=ff782e&logo=gitlab&style=plastic) ![Gitlab stars](https://img.shields.io/badge/dynamic/json?label=Stars&query=%24.star_count&url=https%3A%2F%2Fgitlab.com%2Fapi%2Fv4%2Fprojects%2F45926238%2F&color=ff782e&logo=gitlab&style=plastic) [![Open Issues](https://img.shields.io/badge/dynamic/json?color=ff782e&logo=gitlab&style=plastic&label=Open%20Issues&query=%24.statistics.counts.opened&url=https%3A%2F%2Fgitlab.com%2Fapi%2Fv4%2Fprojects%2F45926238%2Fissues_statistics)](https://gitlab.com/nofusscomputing/projects/docker-buildx-qemu/-/issues)



![GitHub forks](https://img.shields.io/github/forks/NofussComputing/docker-buildx-qemu?logo=github&style=plastic&color=000000&labell=Forks) ![GitHub stars](https://img.shields.io/github/stars/NofussComputing/docker-buildx-qemu?color=000000&logo=github&style=plastic) ![Github Watchers](https://img.shields.io/github/watchers/NofussComputing/docker-buildx-qemu?color=000000&label=Watchers&logo=github&style=plastic)
<br>

This project is hosted on [gitlab](https://gitlab.com/nofusscomputing/projects/docker-buildx-qemu) and has a read-only copy hosted on [Github](https://github.com/NofussComputing/docker-buildx-qemu).

----

**Stable Branch**

![Gitlab build status - stable](https://img.shields.io/badge/dynamic/json?color=ff782e&label=Build&query=0.status&url=https%3A%2F%2Fgitlab.com%2Fapi%2Fv4%2Fprojects%2F45926238%2Fpipelines%3Fref%3Dmaster&logo=gitlab&style=plastic) ![branch release version](https://img.shields.io/badge/dynamic/yaml?color=ff782e&logo=gitlab&style=plastic&label=Release&query=%24.commitizen.version&url=https%3A//gitlab.com/nofusscomputing/projects/docker-buildx-qemu%2F-%2Fraw%2Fmaster%2F.cz.yaml) 

----

**Development Branch** 

![Gitlab build status - development](https://img.shields.io/badge/dynamic/json?color=ff782e&label=Build&query=0.status&url=https%3A%2F%2Fgitlab.com%2Fapi%2Fv4%2Fprojects%2F45926238%2Fpipelines%3Fref%3Ddevelopment&logo=gitlab&style=plastic) ![branch release version](https://img.shields.io/badge/dynamic/yaml?color=ff782e&logo=gitlab&style=plastic&label=Release&query=%24.commitizen.version&url=https%3A//gitlab.com/nofusscomputing/projects/docker-buildx-qemu%2F-%2Fraw%2Fdevelopment%2F.cz.yaml)

----
<br>

</div>

links:

- [Issues](https://gitlab.com/nofusscomputing/projects/docker-buildx-qemu/-/issues)

- [Merge Requests (Pull Requests)](https://gitlab.com/nofusscomputing/projects/docker-buildx-qemu/-/merge_requests)



> This is a fork of https://gitlab.com/gdunstone/docker-buildx-qemu, which appears to be a fork of a fork. anyhow, updates are required. Credit to original and derivitive devs/contributors for getting it to the stage they had!!

This docker image enables building of multi-architecture docker builds. It's designed to run within a CI environment.

To use this image within Gitlab CI/CD Pipelines the following as a minimum is required within your `gitlab-ci.yaml` file, specifically the `before_script` section of your `docker buildx build` job:

``` yaml
before_script:
  # see: https://gitlab.com/gitlab-org/gitlab-runner/-/merge_requests/1861 
  # on why this `docker run` is required. without it multiarch support doesnt work.
  - docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
  - update-binfmts --display
  - update-binfmts --enable # Important: Ensures execution of other binary formats is enabled in the kernel
  - docker buildx create --driver=docker-container --driver-opt image=moby/buildkit:v0.11.6 --use
  - docker buildx inspect --bootstrap
```

When the above is added to the `before_script` section of the docker container build job, Gitlab CI has been initialized for multi-architecture builds.


## Contributing
All contributions for this project must conducted from [Gitlab](https://gitlab.com/nofusscomputing/projects/docker-buildx-qemu).

For further details on contributing please refer to the [contribution guide](CONTRIBUTING.md).


## Other

This repo is release under this [license](LICENSE)
