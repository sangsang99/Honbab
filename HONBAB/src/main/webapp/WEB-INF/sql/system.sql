create USER honbab IDENTIFIED by honbab;

SELECT * FROM ALL_USERS;

GRANT CREATE SESSION TO HONBAB;

GRANT RESOURCE, CONNECT, DBA TO honbab;