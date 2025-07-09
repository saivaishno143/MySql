CREATE DATABASE TRANSACTIONDB;

USE TRANSACTIONDB;

CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    account_holder VARCHAR(100) NOT NULL,
    balance DECIMAL(15, 2) NOT NULL
);

DESC ACCOUNTS;

INSERT INTO accounts (account_holder, balance)
VALUES 
    ('Alice Johnson', 25000.50),
    ('Bob Smith', 18000.75);
    
SELECT * FROM ACCOUNTS;

START TRANSACTION;

UPDATE accounts SET balance = balance - 5000 WHERE account_id = 1;
rollback;
UPDATE accounts SET balance = balance + 5000 WHERE account_id = 2;

COMMIT;

DROP TABLE ACCOUNTS;

DELIMITER $$
CREATE procedure TRANSFER()
begin
	IF (select BALANCE FROM ACCOUNTS WHERE ACCOUNT_ID=1) <=0 THEN
    ROLLBACK;
    ELSE
		UPDATE accounts SET balance = balance - 5000 WHERE account_id = 1;
		UPDATE accounts SET balance = balance + 5000 WHERE account_id = 2;
        select * FROM ACCOUNTS;
        COMMIT;
	END IF;
END$$

DROP procedure TRANSFER;

CALL TRANSFER;
