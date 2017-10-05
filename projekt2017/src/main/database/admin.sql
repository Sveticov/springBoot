-- auto-generated definition
CREATE TABLE admin
(
  admin_id       BIGINT NOT NULL
    CONSTRAINT admin_pkey
    PRIMARY KEY,
  admin_name     VARCHAR(255),
  admin_password VARCHAR(255)
);
