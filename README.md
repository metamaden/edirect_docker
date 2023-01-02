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

Either of the above queries should return something like the following:
```
<ENTREZ_DIRECT>
  <Db>gds</Db>
  <WebEnv>MCID_63b33b4784d8ee4a3124bbff</WebEnv>
  <QueryKey>1</QueryKey>
  <Count>1594</Count>
  <Step>1</Step>
</ENTREZ_DIRECT>
```

# Additional resources

* Consult the main tertiary databases ([GEO](https://www.ncbi.nlm.nih.gov/geo/), [SRA](https://www.ncbi.nlm.nih.gov/sra), and [Bioconductor](https://bioconductor.org/packages/release/data/experiment/)) 
for full metadata, supplemental files, and more.

* [`geoarraydigest`](https://github.com/metamaden/geoarraydigest) : A project to compile and publish GEO array metadata by platform. Also contains helpful information about platforms compiled.

* [`pubomics`](https://github.com/metamaden/pubomics) : A resource for raising awareness of public omics data.