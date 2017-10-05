-- auto-generated definition
CREATE TABLE messages
(
  mesages_id    BIGINT NOT NULL
    CONSTRAINT messages_pkey
    PRIMARY KEY,
  mesage_text   VARCHAR(500),
  us_mess_id    BIGINT
    CONSTRAINT fklsm0dbcmk023fwc3uoms0uuo2
    REFERENCES new_user,
  topic_mess_id BIGINT
    CONSTRAINT fke7d4kgv1gn8ikiym9mwp7edyh
    REFERENCES topic
);