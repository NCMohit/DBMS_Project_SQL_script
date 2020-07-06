USE dbms_project;

-- FOR Q2, we had no relation between Patient and Ambulance

--CREATE TABLE Rides(
--	patient_no int FOREIGN KEY REFERENCES Patient(patient_no),
--	ambulance_id int FOREIGN KEY REFERENCES Ambulance(ambulance_id)
--)

--INSERT INTO Rides VALUES (20,7777)
--INSERT INTO Rides VALUES (21,7778)

--SELECT * FROM Patient;
--SELECT * FROM Ambulance;

SELECT a.patient_no, a.name, b.ambulance_id
FROM Patient AS a
INNER JOIN
Rides AS b
ON a.patient_no = b.patient_no
