-- auto-generated definition
CREATE TABLE topic
(
  topic_id    BIGINT NOT NULL
    CONSTRAINT topic_pkey
    PRIMARY KEY,
  description VARCHAR(255),
  topic_name  VARCHAR(255)
);
