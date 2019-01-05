#!/bin/bash

echo 'Create Channel..'

peer channel create -o orderer.fastcampus.com:7050 -c mychannel -f ./channel-artifacts/channel.tx \
--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/fastcampus.com/orderers/orderer.fastcampus.com/msp/tlscacerts/tlsca.fastcampus.com-cert.pem

echo 'Done'

echo 'Update Org1 Anchor Peer..'

peer channel update -o orderer.fastcampus.com:7050 -c mychannel -f ./channel-artifacts/${CORE_PEER_LOCALMSPID}anchors.tx  \
--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/fastcampus.com/orderers/orderer.fastcampus.com/msp/tlscacerts/tlsca.fastcampus.com-cert.pem

echo 'Done'

echo 'Join Channel..'

CORE_PEER_ADDRESS=peer0.org1.fastcampus.com:7051 peer channel join -b mychannel.block
CORE_PEER_ADDRESS=peer1.org1.fastcampus.com:7051 peer channel join -b mychannel.block

echo 'Done'
