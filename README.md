# Development container for Visual Studio Code
Included is a build command  which you can call instead of *"ptxdistimages -q"* to start a "brute force" parallel build that repeats the compile process until the dependencies are all met. This is a workaround for the packages which have incomplete dependeny informations.


For now nested repositories are not supported by VSCode. There is already an issue on GitHub - Git: 
https://github.com/microsoft/vscode/issues/37947  

As a workaround you should add the firmware sources as a submodule.

## Sample workflow

    git clone https://github.com/WAGO/firmware-sdk-docker.git
    cd firmware-sdk-docker
    code .
    Reopen in container    
    git submodule add https://github.com/WAGO/pfc-firmware-sdk-G2.git
    cd pfc-firmware-sdk-G2
    ptxdist select configs/wago-pfcXXX/ptxconfig_pfc_g2
    build

    

