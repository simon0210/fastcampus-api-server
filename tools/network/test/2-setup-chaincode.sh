#!/usr/bin/env bash

#체인코드
docker exec org1-cli /opt/gopath/src/github.com/hyperledger/fabric/peer/cli/setup-chaincode-org1.sh $1 $2

if [[ "$?" -eq 0 ]]
  then docker exec org2-cli /opt/gopath/src/github.com/hyperledger/fabric/peer/cli/setup-chaincode-org2.sh $1 $2
  else echo "Error occur during run setup-chaincode-org1.sh"
fi
