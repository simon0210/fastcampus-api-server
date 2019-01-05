#!/usr/bin/env bash

#채널
docker exec org1-cli /opt/gopath/src/github.com/hyperledger/fabric/peer/cli/setup-channel-org1.sh

if [[ "$?" -eq 0 ]]
  then docker exec org2-cli /opt/gopath/src/github.com/hyperledger/fabric/peer/cli/setup-channel-org2.sh
  else echo "Error occur during run setup-channel-org1.sh"
fi
