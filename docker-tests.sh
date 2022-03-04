#!/bin/bash
az login --service-principal -u a195e161-6db8-44b9-a305-3964d9747b05 -p PGW4P4m0NvNtr-hd.9JyIVBaLjKXpLSQS4 --tenant b3ad2679-9a3b-41ed-a05b-03cfd9a4d4b6

cd test
go test -v 