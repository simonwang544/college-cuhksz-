CREATE TABLE worker (
    WORKER_ID INT PRIMARY KEY,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25) NOT NULL,
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

INSERT INTO worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(1, 'Monika', 'Arora', 100000, '21-02-20 09.00.00', 'HR'),
(2, 'Niharika', 'Verma', 80000, '21-06-11 09.00.00', 'Admin'),
(3, 'Vishal', 'Singhal', 300000, '21-02-20 09.00.00', 'HR'),
(4, 'Amitabh', 'Singh', 500000, '21-02-20 09.00.00', 'Admin'),
(5, 'Vivek', 'Bhati', 500000, '21-06-11 09.00.00', 'Admin'),
(6, 'Vipul', 'Diwan', 200000, '21-06-11 09.00.00', 'Account'),
(7, 'Satish', 'Kumar', 75000, '21-01-20 09.00.00', 'Account'),
(8, 'Geetika', 'Chauhan', 90000, '21-04-11 09.00.00', 'Admin');
