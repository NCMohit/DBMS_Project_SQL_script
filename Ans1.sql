USE dbms_project;

--INSERT INTO Prescribes VALUES (1,20,63,100);
--INSERT INTO Prescribes VALUES (2,21,80,105);

SELECT * FROM Prescribes;
SELECT * FROM Medicine;

SELECT a.medicine_no
FROM Medicine AS a
LEFT JOIN Prescribes AS b
ON a.medicine_no = b.medicine_no
WHERE b.medicine_no IS null
