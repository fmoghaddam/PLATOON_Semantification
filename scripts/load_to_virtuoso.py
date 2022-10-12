#!/usr/bin/env python3

import os

try:
    virtuosoIP_1 = os.environ["SPARQL_ENDPOINT_IP_1"]    
    virtuosoIP_2 = os.environ["SPARQL_ENDPOINT_IP_2"]
    virtuosoUser = os.environ["SPARQL_ENDPOINT_USER"]
    virtuosoPass = os.environ["SPARQL_ENDPOINT_PASSWD"]
    virtuosoPort_1 = os.environ["SPARQL_ENDPOINT_PORT_1"]
    virtuosoPort_2 = os.environ["SPARQL_ENDPOINT_PORT_2"]
    virtuosoGraph = os.environ["SPARQL_ENDPOINT_GRAPH"]
    outputfolder = os.environ["RDF_DUMP_FOLDER_PATH"]
except Exception as e:
    print("Exception while loading RDF data to viruoso  endpoint: ", e)
    exit(-1)

os.system("/data/scripts/virtuoso-script.sh " + virtuosoIP_1 + " " + virtuosoUser +
          " " + virtuosoPass + " " + virtuosoPort_1 + " " + virtuosoGraph + " " + outputfolder)
os.system("/data/scripts/virtuoso-script.sh " + virtuosoIP_2 + " " + virtuosoUser +
          " " + virtuosoPass + " " + virtuosoPort_2 + " " + virtuosoGraph + " " + outputfolder)
