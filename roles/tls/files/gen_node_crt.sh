#!/bin/sh
openssl genrsa -out ${WORKER_FQDN}-worker-key.pem 2048

WORKER_IP=${WORKER_IP} openssl req -new -key ${WORKER_FQDN}-worker-key.pem -out ${WORKER_FQDN}-worker.csr -subj "/CN=${WORKER_FQDN}" -config worker-openssl.cnf

WORKER_IP=${WORKER_IP} openssl x509 -req -in ${WORKER_FQDN}-worker.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out ${WORKER_FQDN}-worker.pem -days 365 -extensions v3_req -extfile worker-openssl.cnf