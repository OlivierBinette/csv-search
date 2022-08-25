#! /bin/bash

bin/elasticsearch -d -E xpack.security.enabled=false

# TODO: replace by checking if elasticsearch is running and accessible.
sleep 20

# Create index "main" and upload test data
curl -X PUT "localhost:9200/main?pretty"
curl -H 'Content-Type: application/x-ndjson' -XPOST 'localhost:9200/main/_bulk?pretty' --data-binary @data/testdata.json

# Launch search ui
cd ui
export NODE_OPTIONS=--openssl-legacy-provider
npm start
