#!/bin/bash

echo 'Install ChainCode'
CHAINCODE_DIR=github.com/hyperledger/fabric/examples/chaincode/go/
CORE_PEER_ADDRESS=peer0.org1.example.com:7051 peer chaincode install -n $1 -v $2 -p $CHAINCODE_DIR/$1_cc

echo 'Done'

echo 'Upgrade ChainCode'

CORE_PEER_ADDRESS=peer0.org1.example.com:7051 peer chaincode upgrade -o orderer0.example.com:7050 \
--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer0.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
-C imchannel -n $1 -v $2  -c '{"Args":["init","a","200","b","200"]}' -P "OR   ('Org1MSP.peer','Org2MSP.peer')"

echo 'Done'
