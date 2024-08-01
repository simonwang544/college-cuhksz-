原始版本：
CREATE TABLE title(
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES worker(WORKER_ID)
);

INSERT INTO title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(1, 'Manager', '2023-02-20 00:00:00'),
(2, 'Executive', '2023-06-11 00:00:00'),
(8, 'Executive', '2023-06-11 00:00:00'),
(5, 'Manager', '2023-06-11 00:00:00'),
(4, 'EAsst. Manager', '2023-06-11 00:00:00'),//单词拼错了
(7, 'Executive', '2023-06-11 00:00:00'),
(6, 'Lead', '2023-06-11 00:00:00'),
(3, 'Lead', '2023-06-11 00:00:00');



chatgpt:
CREATE TABLE title (
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES worker(WORKER_ID)
);

INSERT INTO title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(1, 'Manager', '2023-02-20 00:00:00'),
(2, 'Executive', '2023-06-11 00:00:00'),
(8, 'Executive', '2023-06-11 00:00:00'),
(5, 'Manager', '2023-06-11 00:00:00'),
(4, 'Asst. Manager', '2023-06-11 00:00:00'),
(7, 'Executive', '2023-06-11 00:00:00'),
(6, 'Lead', '2023-06-11 00:00:00'),
(3, 'Lead', '2023-06-11 00:00:00');

