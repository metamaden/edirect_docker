# edirect_docker

An updated edirect docker image

# Description

An updated Entrez Direct Utilities Dockerfile, currently based on BioContainers v1.2.0_cv2 and running edirect v18.6.20221222. The original 
source for this Dockerfile is from the ![BioContainers repo](https://github.com/BioContainers/containers/tree/master/entrez-direct/7.50.20171103).

# Tutorial:

## Clone the main repo with

You can clone the main GitHub repo with the image Dockerfile, using:
```
git clone https://github.com/metamaden/edirect_docker
```

## Build the image locally

Build the docker image from the cloned Dockerfile, setting the `--tag` argument to some informative name:
```
docker build edirect_docker --tag edirect:latest
```

## Try some queries

You can now pass a query to the Docker image in one line like so:
```
docker run -it edirect esearch -db gds -query 'GPL13534[ACCN] AND gse[ETYP] AND Homo sapiens[ORGN]'
```

You could also run queries from an interactive session, like so:
```
sudo docker run -it edirect bash # run interactive session
esearch -db gds -query 'GPL13534[ACCN] AND gse[ETYP] AND Homo sapiens[ORGN]' # try a new query
```