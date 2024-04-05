CREATE KEYSPACE accesslogs WITH replication ={'class':'SimpleStrategy','replication_factor':1};
CREATE KEYSPACE accesslogs WITH replication = {
  'class': 'NetworkTopologyStrategy',
  'datacenter1': 3
};

CREATE TABLE accesslogs.logs (
  attbr1 text,
  attbr2 text,
  attbr3 text,
  attbr4 text,
  attbr5 text,
  attbr6 text,
  attbr7 text,
  attbr8 text,
  attbr9 text,
  attbr10 text,
  attbr11 text,
  PRIMARY KEY ((attbr1, attbr2, attbr3, attbr4, attbr5, attbr6, attbr7, attbr8))
);
USE accesslogs;
COPY accesslogs.logs FROM '/home/ubuntu/resized_log' WITH DELIMITER=' ' AND HEADER=FALSE;
