CREATE TABLE Patient
(
PatientID INTEGER,
PatientName VARCHAR2(50)
CONSTRAINT PatientNameNotEmpty NOT NULL,
PatientAddress VARCHAR2(200)
CONSTRAINT PatientAddressNotEmpty NOT NULL,
AdmitDate DATE,
HospitalStayDays INTEGER,
RoomNo INTEGER,
PhysID INTEGER,
CONSTRAINT pk_PrimaryPatientIDs PRIMARY KEY (PatientID),
CONSTRAINT fk_RoomNoForeigns FOREIGN KEY (RoomNo) REFERENCES Room(RoomNo),
CONSTRAINT fk_PhysIDForeigns FOREIGN KEY (PhysID) REFERENCES Physician(PhysID),
CONSTRAINT checkRoomNos CHECK ((RoomNo >=100) AND (RoomNo <=999)),
CONSTRAINT checkHospitalStayDays CHECK (HospitalStayDays >=0)
);

CREATE TABLE Physician
(
PhysID INTEGER,
PhysName VARCHAR2(50)
CONSTRAINT PhysNameNotEmpty NOT NULL,
PhysDept INTEGER,
TreatID INTEGER,
CONSTRAINT pk_PhysIDPrimary PRIMARY KEY (PhysID),
CONSTRAINT fk_TreatIDForeign FOREIGN KEY (TreatID) REFERENCES Treatment(TreatID),
CONSTRAINT fk_PhysIDForeign FOREIGN KEY (PhysDept) REFERENCES Department(PhysDeptId)
);

CREATE TABLE Department
(
PhysDeptId INTEGER,
DeptSupervisorId INTEGER,
CONSTRAINT pk_PhysDeptIDPrimary PRIMARY KEY (PhysDeptId)
);

CREATE TABLE Room
(
RoomNo INTEGER,	
RoomPhone VARCHAR2(8),
RoomRate NUMBER(10,2),
CONSTRAINT pk_RoomNoPrimarys PRIMARY KEY (RoomNo),
CONSTRAINT checkRoomNo CHECK ((RoomNo >=100) AND (RoomNo <=999)),
CONSTRAINT RoomRateRange CHECK ((RoomRate >=30.00) AND (RoomRate <=100.00))
);

CREATE TABLE Treatment
(
TreatID INTEGER,
TreatDescription VARCHAR2(200),
TreatCost NUMBER(10,2),
CONSTRAINT pk_TreatIDPrimarys PRIMARY KEY (TreatID),
CONSTRAINT TreatCostChecking CHECK (TreatCost >=50.00)
);


ALTER TABLE DEPARTMENT ADD CONSTRAINT fk_PhysDeptIDForeign FOREIGN KEY (DeptSupervisorId) REFERENCES Physician(PhysID)