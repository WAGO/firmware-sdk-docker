# Visual Studio Code Development container for PTXDIST
A **development container** is a running [Docker](https://www.docker.com) container with a well-defined tool/runtime stack and its prerequisites. You can try out development containers with **[GitHub Codespaces](https://github.com/features/codespaces)** or **[Visual Studio Code Remote - Containers](https://aka.ms/vscode-remote/containers)**.

## Setting up the development container

### VS Code Remote - Containers
Follow these steps to open this ptxdist environment in a container using the VS Code Remote - Containers extension:

1. If this is your first time using a development container, please ensure your system meets the pre-reqs (i.e. have Docker installed) in the [getting started steps](https://aka.ms/vscode-remote/containers/getting-started).

2. - Clone this repository to your local filesystem.
   - Press <kbd>F1</kbd> and select the **Remote-Containers: Open Folder in Container...** command.
   - Select the cloned copy of this folder and wait for the container to start.

## Things to try

Once you have this container running, you'll be able to work with **ptxdist** like you would locally.

Some things to try:

1. **Clone firmware sources:**  
For now nested repositories are not supported by VSCode. There is already an issue on GitHub - Git: 
https://github.com/microsoft/vscode/issues/37947  
As a workaround you should add the firmware sources as a submodule:

    ```
    git submodule add https://github.com/WAGO/pfc-firmware-sdk-G2.git src
    ```
2. **Build firmware image:**  
Included is a build command  which you can call instead of *"ptxdistimages -q"* to start a "brute force" parallel build that repeats the compile process until the dependencies are all met. This is a workaround for the packages which have incomplete dependeny informations.
    ```
    cd src
    ptxdist select configs/wago-pfcXXX/ptxconfig_pfc_g2
    build
    ```


For more information on how to develop with ptxdist please refer to one of the firmware source repos e.g.:  
https://github.com/WAGO/pfc-firmware-sdk  
and the PFC Howtos:  
https://github.com/WAGO/pfc-howtos
