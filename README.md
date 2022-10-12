# Semantic Adaptor and Federated Query Engine Test

This document contains information about how to run RDFizer (Semantic Adaptor) and DeTrusty (FQE) as docker containers for testing the performance.


## Folder Structure

This repository contains the following files and folder:


| File/Folder Name    | Description                                                        |
|---------------------|--------------------------------------------------------------------|
| engiedata           | Raw CSV Data                                                       |
| scripts             | Python scripts to upload RDF to Virtouso, parse mapping, ...       |
| config.ini          | DeTrusty Configuration                                             |
| config_rdfizer1.ini | RDFizer Configuration for the first part of data (occupancydata1)  |
| config_rdfizer2.ini | RDFizer Configuration for the second part of data (occupancydata2) |
| docker-compose.yml  | Docker compose file                                                |
| Makefile            | Makefile containing all the commands                               |
| README.md           | ReadMe file                                                        |

## Data

The data which is used for testing is Engie CSV dataset which can be found in the `engiedata` folder. The data information is as follows:

| File Name           | Description                                           | #Rows  |
|---------------------|-------------------------------------------------------|--------|
| occupancydata       | Engie Original Data                                   | 31066  |
| occupancydata1_30K  | Engie Original Data divided vertically 1              | 31066  |
| occupancydata2_30K  | Engie Original Data divided vertically 2              | 31066  |
| occupancydata1_300K | Syntactic Engie Data divided vertically 1             | 341716 |
| occupancydata2_300K | Syntactic Engie Data divided vertically 2             | 341716 |
| occupancydata1_1M   | Syntactic Engie Data divided vertically 1             | 963016 |
| occupancydata2_1M   | Syntactic Engie Data divided vertically 2             | 963016 |
| occupancydata1      | This file will be used in the semantification process |        |
| occupancydata2      | This file will be used in the semantification process |        |
| mapping1.ttl        | RML file for occupancydata1                           |        |
| mapping2.ttl        | RML file for occupancydata2                           |        |

If you want to use other files in the process, you need to just rename your desired files to `occupancydata1` and `occupancydata2`.


## How to run

For running the workflow, I have provided a `Makefile` to make the procedure easier. You need to clone the repository and use the commands provided in the `Makefile`.

To start, after cloning and switching to the root directory of the repository you can run:

```
make up
```

This will download all the necessary docker images and start the containers. This command will start 1 RDFizer, 2 Virtuoso, and 1 DeTrusty.

To run the whole semantification process at once, you can do:

```
make semantify
```

This will convert data to RDF dumps, load them in the virtuosos, and start DeTrusty. Moreover, I have provided separate commands for each step as well:

```
make semantify1
make semantify2
make load2virtuoso
make fqe
make sparqlresult
```