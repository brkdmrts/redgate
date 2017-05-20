CREATE TABLE scott.emp (
  empno NUMBER(4) NOT NULL,
  ename VARCHAR2(10 BYTE),
  "JOB" VARCHAR2(9 BYTE) CONSTRAINT emp_valid_job CHECK ("JOB" in ('CLERK','SALESMAN','MANAGER','ANALYST','PRESIDENT')),
  mgr NUMBER(4),
  hiredate DATE,
  sal NUMBER(7,2),
  comm NUMBER(7,2),
  deptno NUMBER(2),
  PRIMARY KEY (empno)
);