CREATE KEYSPACE accesslogs WITH replication ={'class':'SimpleStrategy','replication_factor':1};
CREATE TABLE accesslogs.logs(
  id UUID PRIMARY KEY,
  ipaddr text,
  client text,
  unameclient text,
  date text,
  timezone text,
  req text,
  hitpath text,
  code text,
  status text,
  bytesOut text,
  bytesIn text,
  referrer text,
  Useragent text,
  UserAgentURL text,
  RemoteUser text);
USE accesslogs;
COPY accesslogs.logs FROM '/home/ubuntu/resized_log' WITH DELIMITER=' ' AND HEADER=FALSE
