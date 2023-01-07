FROM ubuntu:latest

ENV ZIP=edirect-18.6.20221222.tar.gz
ENV URL=ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/versions/18.6.20221222/
ENV FOLDER=edirect
ENV DST=/tmp

RUN apt-get update && \
    apt-get install -y \
      liblwp-protocol-https-perl && \
    apt-get install -y wget && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd $DST && \
	wget $URL/$ZIP -O $DST/$ZIP && \
	tar xzfv $DST/$ZIP -C $DST && \
	mv $DST/$FOLDER/* /usr/bin/ && \
	rm -rf $DST/$FOLDER && \
	export PATH=${PATH}:/usr/bin/edirect