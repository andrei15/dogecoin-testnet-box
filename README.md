# dash-testnet-box

Create your own private DOGECOIN testnet


You must have `dashd` and `dash-cli` installed on your system and modify the top of the
Makefile, or you can run the `make download` option. You need to have `make`
installed. (`apt-get install make`)

## Starting the testnet-box

This will start up two nodes using the two datadirs `1` and `2`. They
will only connect to each other in order to remain an isolated private testnet.
Two nodes are provided, as one is used to generate blocks and it's balance
will be increased as this occurs (imitating a miner). You may want a second node
where this behavior is not observed.

Node `1` will listen on port `20361`, allowing node `2` to connect to it.

Node `1` will listen on port `20362` and node `2` will listen on port `20553`
for the JSON-RPC server.


## To start the DOGECOIN processes
```
$ make start
```

## Check the status of the nodes

```
dogecoin-cli -datadir=1  getinfo
{
    "version" : 1100000,
    "protocolversion" : 70004,
    "blocks" : 0,
    "timeoffset" : 0,
    "connections" : 1,
    "proxy" : "",
    "difficulty" : 0.00000000,
    "testnet" : false,
    "relayfee" : 1.00000000,
    "errors" : ""
}
dogecoin-cli -datadir=2  getinfo
{
    "version" : 1100000,
    "protocolversion" : 70004,
    "blocks" : 0,
    "timeoffset" : 0,
    "connections" : 1,
    "proxy" : "",
    "difficulty" : 0.00000000,
    "testnet" : false,
    "relayfee" : 1.00000000,
    "errors" : ""
}
```

## Generating blocks

Normally on the live, real, DOGECOIN network, blocks are generated, on average,
every 2.5 minutes. Since this testnet-in-box uses DOGECOIN Core's (dashd)
regtest mode, we are able to generate a block on a private network
instantly using a simple command.

To generate a block:

```
$ make generate
```

To generate more than 1 block:

```
$ make generate BLOCKS=10
```

## Need to generate at least 200 blocks before there will be a balance in the first wallet
```
$ make generate BLOCKS=200
```

## Verify that there is a balance on the first wallet
```
$ make getinfo
```

## Generate a wallet address for the second wallet
```
$ make address2
```

## Sending DOGECOIN
To send DOGECOIN that you've generated to the second wallet: (be sure to change the ADDRESS value below to wallet address generated in the prior command)

```
$ make sendfrom1 ADDRESS=ygWoB2qkP3SKrdSWUeWVirhd5uN8bAHYax AMOUNT=10
```

## Does the balance show up?
Run the getinfo command again. Does the balance show up? Why not?
```
$ make getinfo
```

## Generate another block
```
$ make generate
```

## Stopping the testnet-box

```
$ make stop
```

To clean up any files created while running the testnet and restore to the
original state:

```
$ make clean
```
