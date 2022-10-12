up:
	docker-compose down	
	docker-compose up -d --remove-orphans	

down:
	docker-compose down		


semantify:
	time docker exec -it sdmrdfizer python3 -m rdfizer -c /data/config_rdfizer1.ini
	time docker exec -it sdmrdfizer python3 -m rdfizer -c /data/config_rdfizer2.ini
	time docker exec -it sdmrdfizer python3 /data/scripts/load_to_virtuoso.py
	time docker exec -it sdmrdfizer python3 /data/scripts/mapping_parser.py /data/config.ini
	docker exec -it detrusty /DeTrusty/Scripts/restart_workers.sh


semantify1:
	time docker exec -it sdmrdfizer python3 -m rdfizer -c /data/config_rdfizer1.ini

semantify2:
	time docker exec -it sdmrdfizer python3 -m rdfizer -c /data/config_rdfizer2.ini

load2virtuoso:
	time docker exec -it sdmrdfizer python3 /data/scripts/load_to_virtuoso.py

fqe:
	time docker exec -it sdmrdfizer python3 /data/scripts/mapping_parser.py /data/config.ini
	docker exec -it detrusty /DeTrusty/Scripts/restart_workers.sh

sparqlresult:
	docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' detrusty | xargs -I{} curl -X POST -d "query=SELECT ?s ?p ?o WHERE { ?s ?r <http://engie/vocab/Building>. ?s ?p ?o. } LIMIT 100" {}:5000/sparql	
