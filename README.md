[![test](https://github.com/kubagalecki/my-cpp-starter/workflows/test/badge.svg)](https://github.com/kubagalecki/my-cpp-starter/actions)
[![codecov](https://codecov.io/gh/kubagalecki/my-cpp-starter/branch/master/graph/badge.svg)](https://codecov.io/gh/kubagalecki/my-cpp-starter)

# my-cpp-starter
Starter template for header-only C++ libraries. Currently still under construction.
Note: the tests should be failing, and code coverage should be <100%

### Current features
- Unit tests using [Catch](https://github.com/catchorg/Catch2)
- Build dependencies are cached on you Docker Hub account - no more waiting for all those 3rd party libraries to build each time you push!
- Code coverage with export to Codecov
- Pretty badges in the readme
- A clang-format file (my personally preferred style, don't @ me)

### Quickstart
To get started with this template make sure you have the following:
- GitHub account (obviously)
- Docker Hub account
- Codecov account integrated with GitHub

Next, use this repository as a template, and define the following GitHub secrets (Settings -> Secrets):
- DOCKER_HUB_USERNAME your username on Docker Hub
- DOCKER_HUB_PASSWORD authentification token for DockerHub
- DOCKER_HUB_IMAGE    name of Docker image used for caching build dependencies
- CODECOV_TOKEN       codecov authentification token

Now add your newly created repository to Codecov, and that's it! Push your first commit and watch the CI do its thing. If you need to any additional dependencies, simply edit tests/ci/Dockerfile.base. Each time you do, the base Docker image is rebuilt and cached on you Docker Hub account. Note that since your Docker Hub info is kept as repository secrets, your docker persona remains hidden.
