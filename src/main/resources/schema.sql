CREATE TABLE authority (
    authority_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (authority_name)
);

CREATE TABLE user_authority (
    user_id BIGINT NOT NULL,
    authority_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (user_id, authority_name)
);

CREATE TABLE users (
    user_id BIGINT GENERATED BY DEFAULT AS IDENTITY,
    activated BOOLEAN,
    nickname VARCHAR(50),
    password VARCHAR(100),
    username VARCHAR(50),
    PRIMARY KEY (user_id)
);

ALTER TABLE users 
DROP CONSTRAINT IF EXISTS UK_USERS_USERNAME;

ALTER TABLE users 
ADD CONSTRAINT UK_USERS_USERNAME UNIQUE (username);

ALTER TABLE user_authority 
ADD CONSTRAINT FK_USER_AUTHORITY_TO_AUTHORITY
FOREIGN KEY (authority_name) REFERENCES authority;

ALTER TABLE user_authority 
ADD CONSTRAINT FK_USER_AUTHORITY_TO_USERS 
FOREIGN KEY (user_id) REFERENCES users;