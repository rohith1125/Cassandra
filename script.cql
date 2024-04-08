CREATE KEYSPACE accesslogs WITH replication ={'class':'SimpleStrategy','replication_factor':1};
CREATE KEYSPACE accesslogs WITH replication = {'class': 'NetworkTopologyStrategy','datacenter1': 3};

CREATE TABLE accesslogs.logs (
  id text,
  ip_address text,
  datetime text,
  method text,
  url text,
  protocol text,
  status_code text,
  response_size bigint,
  user_agent text,
  PRIMARY KEY (id)
);
USE accesslogs;
COPY accesslogs.logs FROM '/home/ubuntu/resized_log.csv' WITH DELIMITER=',' AND HEADER=TRUE;
COPY accesslogs.logs FROM '/home/ubuntu/resized_log.csv' WITH HEADER=TRUE;
COPY accesslogs.logs (id, ip, datetime, method, url, protocol, status_code, response_size, user_agent)
FROM '/home/ubuntu/resized_log.csv' WITH HEADER = TRUE;

dsbulk load -url /home/ubuntu/resized_log.csv -k accesslogs -t accesslogs.logs -header true
```bash
dsbulk load -url /home/ubuntu/resized_log1.csv -k accesslogs -t logs -header true -h 10.254.0.248 --port 9042 --connector.csv.maxCharsPerColumn 15000
```
