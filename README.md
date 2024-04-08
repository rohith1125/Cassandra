# Cassandra
Start Cassandra
```bash
sudo cassandra -Rf
```
Check status of nodes
```bash
nodetool status
```
Start Cassandra SQL console
```bash
cqlsh CC2
```
Stop Cassandra
```bash
sudo service cassandra stop
```
Remove all the data and tables
```bash
sudo rm -rf /var/lib/cassandra/*
```
```bash
cqlsh --request-timeout=100000
```
