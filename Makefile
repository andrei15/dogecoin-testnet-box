DOGECOIND=dogecoind
DOGECOINGUI=dogecoin-qt
DOGECOINCLI=dogecoin-cli
B1_FLAGS=
B2_FLAGS=
B1=-datadir=1 $(B1_FLAGS)
B2=-datadir=2 $(B2_FLAGS)
BLOCKS=1
ADDRESS=
AMOUNT=
ACCOUNT=

start:
	$(DOGECOIND) $(B1) -daemon
	$(DOGECOIND) $(B2) -daemon

start-gui:
	$(DOGECOINGUI) $(B1) &
	$(DOGECOINGUI) $(B2) &

generate:
	$(DOGECOINCLI) $(B1) generate $(BLOCKS)

getinfo:
	$(DOGECOINCLI) $(B1) getinfo
	$(DOGECOINCLI) $(B2) getinfo

sendfrom1:
	$(DOGECOINCLI) $(B1) sendtoaddress $(ADDRESS) $(AMOUNT)

sendfrom2:
	$(DOGECOINCLI) $(B2) sendtoaddress $(ADDRESS) $(AMOUNT)

address1:
	$(DOGECOINCLI) $(B1) getnewaddress $(ACCOUNT)

address2:
	$(DOGECOINCLI) $(B2) getnewaddress $(ACCOUNT)

stop:
	$(DOGECOINCLI) $(B1) stop
	$(DOGECOINCLI) $(B2) stop

clean:
	rm -rf 1/regtest/*
	rm -rf 2/regtest/*
