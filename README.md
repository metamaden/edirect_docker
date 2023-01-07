# edirect_docker

Dockerizations for Entrez Programming Utilities (a.k.a. `edirect`)  

# Description

This repo exists to support dockerizations (e.g. `Dockerfiles`) that allow users to run `edirect`. Currently, you can run `edirect` v18.6.. 
either using a Biocontainers-compatible image with the file at `./biocontainers/`, or using a more compact minimal image with the file located at `./minimal/`.

# Tutorial:

This section describes how to set up new Docker images with the provided `Dockerfiles`, and how to get started with using `edirect` from the images.

## Clone the main repo with

You can clone the main GitHub repo with the image Dockerfile, using:
```sh
git clone https://github.com/metamaden/edirect_docker
```

## Build the image locally

Docker images are built using `docker build <location>`, which calls the file called `Dockerfile` which should be stored at `<location>`. Two `Dockerfile`s are provided, one
that uses the Biocontainers environment as a base, and one that uses only the minimal dependencies to be able to run Entrez Utilities. The former has added convenience if
you are going to run other programs in Biocontainers environments, but the latter is slightly smaller and quicker to install.

Build the Biocontainers-compatible Docker image from the cloned Dockerfile, setting the `--tag` argument to some informative name:
```sh
docker build edirect_docker/biocontainers/ --tag edirect-biocontainers:latest
```

Build the minimal image with:
```sh
docker build edirect_docker/minimal/ --tag edirect-minimal:latest
```

View information about the final images with `docker image ls`, which should return something like:

```sh
(base) root@User-PC:/mnt/c/Users/User/Documents/GitHub/edirect_docker# docker image ls
REPOSITORY              TAG       IMAGE ID       CREATED          SIZE
edirect-biocontainers   latest    53efcb0ee109   3 minutes ago    1.12GB
edirect-minimal         latest    cdea17e223f4   8 minutes ago    136MB
```

Notice the Biocontainers image is a little over 1Gb, whereas the minimal image is just 136Mb.

## Try some queries

You can now pass a query to the Docker image in one line like so, replacing `< IMAGE_NAME >` with either `"edirect-biocontainers"` or `"edirect-minimal"`:
```sh
docker run -it < IMAGE_NAME > esearch -db gds -query 'GPL13534[ACCN] AND gse[ETYP] AND Homo sapiens[ORGN]'
```

You could also run queries from an interactive session, like so:
```sh
sudo docker run -it < IMAGE_NAME > bash # run interactive session
esearch -db gds -query 'GPL13534[ACCN] AND gse[ETYP] AND Homo sapiens[ORGN]' # try a new query
```

Either of the above queries should return something like the following:
```sh
<ENTREZ_DIRECT>
  <Db>gds</Db>
  <WebEnv>MCID_63b33b4784d8ee4a3124bbff</WebEnv>
  <QueryKey>1</QueryKey>
  <Count>1594</Count>
  <Step>1</Step>
</ENTREZ_DIRECT>
```

# Troubleshooting

## OpenSSL

I encountered an error involving OpenSSL which was fixed when I updated my base image and `edirect` to their latest versions. Actually, this error inspired this post to make 
sure others can run a dockerized `edirect` error-free. Note that some existing `Dockerfile`s (e.g. [here](https://github.com/BioContainers/containers/blob/master/entrez-direct/7.50.20171103/Dockerfile)) use static versions for their base image (e.g. `FROM biocontainers/biocontainers:v1.0.0_cv4`). By changing this to `FROM biocontainers/biocontainers:latest` we can ensure the latest version of the base image is always installed.

The latest version of `edirect` can be found at its [FTP address (ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/versions/)](ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/versions/). This needs to be updated in the `Dockerfile`, which you can do manually or which can feasibly be scripted as a version check in the `Dockerfile`. The lines in question are:

```sh
ENV ZIP=edirect-< LATEST_VERSION >.tar.gz
ENV URL=ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/versions/< LATEST_VERSION >/
```

# Resources

* **BioContainers** : Consult the [Docker](https://hub.docker.com/r/biocontainers/biocontainers) and [GitHub](https://github.com/BioContainers/containers) pages for information about this project and available images.

* **Tertiary databases** : Consult the main tertiary databases for public omics data (e.g. [GEO](https://www.ncbi.nlm.nih.gov/geo/), [SRA](https://www.ncbi.nlm.nih.gov/sra), 
[Bioconductor](https://bioconductor.org/packages/release/data/experiment/), etc.) for full datasets, metadata, supplemental files, and more.

* [**`geoarraydigest`**](https://github.com/metamaden/geoarraydigest) : A project to compile and publish GEO array metadata by platform. Also contains helpful information about platforms compiled.

* [**`pubomics`**](https://github.com/metamaden/pubomics) : A resource for raising awareness of public omics data.