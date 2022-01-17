FROM scratch 
ADD src/platform-wago-pfcXXX/images/root.tgz /
RUN rm -rf /boot 
RUN rm -rf /usr/lib/modules

LABEL maintainer="sergei.ikkert@wago.com, dirk.meihoefer@wago.com"
LABEL description="WAGO Kontakttechnik firmware base image"
CMD ["/bin/bash"]