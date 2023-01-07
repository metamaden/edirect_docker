################## BASE IMAGE ######################
FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base_image="biocontainers:v1.2.0_cv2"
LABEL software="entrez-direct"
LABEL software.version="18.6.20221222"
LABEL about.summary="Entrez Direct (EDirect) is an advanced method for accessing the NCBI's set of interconnected Entrez databases"

################## INSTALLATION ######################
USER root

ENV ZIP=edirect-18.6.20221222.tar.gz
ENV URL=ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/versions/18.6.20221222/
ENV FOLDER=edirect
ENV INSTALL_FOLDER=/home/biodocker/
ENV DST=/tmp

RUN apt-get update && \
    apt-get install -y \
      liblwp-protocol-https-perl && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER biodocker

RUN cd $DST && \
	wget $URL/$ZIP -O $DST/$ZIP && \
	tar xzfv $DST/$ZIP -C $DST && \
	mv $DST/$FOLDER/* /home/biodocker/bin/ && \
	rm -rf $DST/$FOLDER

WORKDIR /data/

# CMD ["esearch"]