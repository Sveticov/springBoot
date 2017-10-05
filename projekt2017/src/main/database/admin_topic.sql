-- auto-generated definition
CREATE TABLE admin_topic
(
  admin_id BIGINT NOT NULL
    CONSTRAINT fkioc72h0w23ml3ywd4gcpafd1u
    REFERENCES admin,
  topic_id BIGINT NOT NULL
    CONSTRAINT fkqgpfx7uxku61sypmmpn4hgyxk
    REFERENCES topic,
  CONSTRAINT admin_topic_pkey
  PRIMARY KEY (admin_id, topic_id)
);