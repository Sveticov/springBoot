-- auto-generated definition
CREATE TABLE new_user
(
  user_id  BIGINT NOT NULL
    CONSTRAINT new_user_pkey
    PRIMARY KEY,
  name     VARCHAR(255),
  password VARCHAR(255)
);
