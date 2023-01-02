# 
# Author: Sean Maden
#
# * Description:
# 
# An updated Entrez Direct Utilities Dockerfile, currently based on BioContainers v1.2.0_cv2 and running
# edirect v18.6.20221222. The original source for this Dockerfile is from the BioContainers repo 
# (URL: https://github.com/BioContainers/containers/tree/master/entrez-direct/7.50.20171103).
#
# * Tutorial:
# 
# ** Clone the main repo with
#
# You can clone the main GitHub repo with the image Dockerfile, using:
# > git clone https://github.com/metamaden/edirect_docker
#
# ** Build the image locally
#
# Build the docker image from the cloned Dockerfile, setting the `--tag` argument to some informative name:
# > docker build edirect_docker --tag edirect:latest
#
# ** Try some queries
#
# You can now pass a query to the Docker image in one line like so:
# > docker run -it edirect esearch -db gds -query 'GPL13534[ACCN] AND gse[ETYP] AND Homo sapiens[ORGN]'
# 
# You could also run queries from an interactive session, like so:
# > sudo docker run -it edirect bash # run interactive session
# > esearch -db gds -query 'GPL13534[ACCN] AND gse[ETYP] AND Homo sapiens[ORGN]' # try a new query
#
#

################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.2.0_cv2

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