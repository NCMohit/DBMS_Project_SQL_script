CREATE DATABASE dbms_project;
USE dbms_project;

CREATE TABLE Employee(
	emp_id int PRIMARY KEY,
	name VARCHAR(255),
	phone_number BIGINT,
	address VARCHAR(255),
	salary BIGINT
)

CREATE TABLE Doctor(
	emp_id int PRIMARY KEY,
	qualification VARCHAR(255),
	patients_treated int,
	FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
)

CREATE TABLE Nurse(
	emp_id int PRIMARY KEY,
	years_exp int,
	FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
)

CREATE TABLE Driver(
	emp_id int PRIMARY KEY,
	license_no int,
	years_exp int,
	FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)	
)

CREATE TABLE Receptionist(
	emp_id int PRIMARY KEY,
	desk_hours int,
	FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
)

CREATE TABLE Pharmacist(
	emp_id int PRIMARY KEY,
	years_exp int,
	FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
)

CREATE TABLE Patient(
	patient_no int PRIMARY KEY,
	name VARCHAR(255),
	phone_no int,
	address VARCHAR(255),
	problem VARCHAR(255)
)

CREATE TABLE Room(
	room_id int PRIMARY KEY,
	room_type VARCHAR(255)
)

CREATE TABLE Ambulance(
	ambulance_id int PRIMARY KEY,
	seats_available int
)

CREATE TABLE Records(
	r_no int PRIMARY KEY,
	patient_no int,
	problem VARCHAR(255),
	FOREIGN KEY (patient_no) REFERENCES Patient(patient_no)
)

CREATE TABLE Pharmacy(
	pharmacy_no int PRIMARY KEY,
	pharmacy_name VARCHAR(255)
)

CREATE TABLE Medicine(
	medicine_no int PRIMARY KEY,
	medicine_name VARCHAR(255),
	cost int
)

CREATE TABLE Attends(
	emp_id int FOREIGN KEY REFERENCES Doctor(emp_id),
	patient_no int FOREIGN KEY REFERENCES Patient(patient_no),
	PRIMARY KEY (emp_id,patient_no)
)

CREATE TABLE Looks_Over(
	emp_id int FOREIGN KEY REFERENCES Nurse(emp_id),
	room_id int FOREIGN KEY REFERENCES Room(room_id),
	PRIMARY KEY (emp_id,room_id)
)

CREATE TABLE Stays_In(
	patient_no int FOREIGN KEY REFERENCES Patient(patient_no),
	room_id int FOREIGN KEY REFERENCES Room(room_id),
	PRIMARY KEY (patient_no,room_id)
)

CREATE TABLE Manages(
	emp_id int FOREIGN KEY REFERENCES Receptionist(emp_id),
	r_no int FOREIGN KEY REFERENCES Records(r_no),
	PRIMARY KEY (emp_id,r_no)
)

CREATE TABLE Drives(
	emp_id int FOREIGN KEY REFERENCES Driver(emp_id),
	ambulance_id int FOREIGN KEY REFERENCES Ambulance(ambulance_id),
	PRIMARY KEY (emp_id,ambulance_id)
)

CREATE TABLE Sells_at(
	emp_id int FOREIGN KEY REFERENCES Pharmacist(emp_id),
	pharmacy_no int FOREIGN KEY REFERENCES Pharmacy(pharmacy_no),
	PRIMARY KEY (emp_id,pharmacy_no)
)	

CREATE TABLE Contains_Med(
	pharmacy_no int FOREIGN KEY REFERENCES Pharmacy(pharmacy_no),
	medicine_no int FOREIGN KEY REFERENCES Medicine(medicine_no),
	PRIMARY KEY (pharmacy_no,medicine_no)
)

CREATE TABLE Takes(
	patient_no int FOREIGN KEY REFERENCES Patient(patient_no),
	medicine_no int FOREIGN KEY REFERENCES Medicine(medicine_no),
	PRIMARY KEY (patient_no,medicine_no)
)

CREATE TABLE PRESCRIBES(
	doctor_emp_id int,
	patient_no int,
	medicine_no int,
	dosage int,
	PRIMARY KEY (doctor_emp_id,patient_no),
	FOREIGN KEY (doctor_emp_id) REFERENCES DOCTOR(doctor_emp_id),
	FOREIGN KEY (patient_no) REFERENCES PATIENT(patient_no)
)

CREATE TABLE Rides(
	patient_no int FOREIGN KEY REFERENCES Patient(patient_no),
	ambulance_id int FOREIGN KEY REFERENCES Ambulance(ambulance_id)
)
