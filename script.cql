CREATE KEYSPACE accesslogs WITH replication ={'class':'SimpleStrategy','replication_factor':1};
CREATE KEYSPACE accesslogs WITH replication = {
  'class': 'NetworkTopologyStrategy',
  'datacenter1': 3
};

CREATE TABLE accesslogs.logs (
  id text,
  ip text,
  datetime text,
  method text,
  url text,
  protocol text,
  status_code text,
  response_size text,
  user_agent text,
  PRIMARY KEY (id)
);
USE accesslogs;
COPY accesslogs.logs FROM '/home/ubuntu/resized_log.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY accesslogs.logs (id, ip, datetime, method, url, protocol, status_code, response_size, user_agent)
FROM '/home/ubuntu/resized_log.csv' WITH HEADER = TRUE;
