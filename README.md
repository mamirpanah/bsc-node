# Binance Smart Chain Full Node (Mainnet and Testnet)

https://docs.binance.org/smart-chain/developer/fullnode.html

### Initializing the chain

You need to follow this step only once, make sure you get the [latest](https://github.com/binance-chain/bsc/releases/tag/v1.0.7) release of `geth_linux` 

```
wget  https://github.com/binance-chain/bsc/releases/download/v1.0.7/geth_linux

chmod 775 geth_linux

Mainnet

./geth_linux --datadir ./data/mainnet/ init config/mainnet/genesis.json


Testnet

./geth_linux --datadir ./data/testnet/ init config/testnet/genesis.json
```

### Startup

```
docker-compose up -d bsc_mainnet netstats
```

## Check sync status

```
docker exec bsc_mainnet geth attach --exec eth.syncing

docker exec bsc_testnet geth attach --exec eth.syncing
```


## Check logs

```
docker logs bsc_mainnet --tail 10 --follow

docker logs bsc_testnet --tail 10 --follow
```


## Download snapshot from bnb48club

follow the instructions on https://github.com/48Club/bsc-snapshots

```
sudo apt install -y aria2 lz4

aria2c -s14 -x14 -k100M https://snapshots.48.club/geth.24975978.tar.lz4 -o geth.tar.lz4

lz4 -cd geth.tar.lz4 | tar xf -

bsc_node_dir=<your-cloned-dir>

snapshot_dir=<you-snapshot-dir>

sudo mv ${bsc_node_dir}/data/mainnet/geth/chaindata ${bsc_node_dir}/data/mainnet/geth/chaindata_backup

sudo mv ${snapshot_dir}/geth/chaindata ${bsc_node_dir}/data/mainnet/geth/chaindata

sudo chown -R root:root ${bsc_node_dir}/data/mainnet/geth/chaindata

sudo chmod -R 751 ${bsc_node_dir}/data/mainnet/geth/chaindata
```
flags that should be used as options for running full node
--txlookuplimit=0 --syncmode=full --tries-verify-mode=none --pruneancient=true --diffblock=5000
