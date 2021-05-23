--CREARE
CREATE TABLE Client
(
  ID_Client INT NOT NULL,
  Nume VARCHAR(20) NOT NULL,
  Prenume VARCHAR(20),
  Telefon VARCHAR(20),
  Mail VARCHAR(20),
  PRIMARY KEY (ID_Client)
);

CREATE TABLE Regiune
(
  ID_Regiune VARCHAR(20) NOT NULL,
  Nume VARCHAR(20) NOT NULL,
  PRIMARY KEY (ID_Regiune)
);

CREATE TABLE Tara
(
  ID_Tara VARCHAR(10) NOT NULL,
  Nume VARCHAR(20) NOT NULL,
  ID_Regiune VARCHAR(20) NOT NULL,
  PRIMARY KEY (ID_Tara),
  FOREIGN KEY (ID_Regiune) REFERENCES Regiune(ID_Regiune)
);

CREATE TABLE Locatie
(
  ID_Locatie VARCHAR(10) NOT NULL,
  Cod_postal VARCHAR(10) NOT NULL,
  Strada VARCHAR(30),
  ID_Tara VARCHAR(10),
  Oras VARCHAR(20) NOT NULL,
  PRIMARY KEY (ID_Locatie),
  FOREIGN KEY (ID_Tara) REFERENCES Tara(ID_Tara)
);

CREATE TABLE Magazin
(
  ID_Magazin VARCHAR(10) NOT NULL,
  Telefon VARCHAR(20),
  Nume VARCHAR(20) NOT NULL,
  ID_Locatie VARCHAR(10) NOT NULL,
  PRIMARY KEY (ID_Magazin),
  FOREIGN KEY (ID_Locatie) REFERENCES Locatie(ID_Locatie)
);

CREATE TABLE Angajat_magazin
(
  ID_Angajat INT NOT NULL,
  Nume VARCHAR(20) NOT NULL,
  Prenume VARCHAR(20) NOT NULL,
  Salariu INT NOT NULL,
  Data_angajarii DATE NOT NULL,
  Ocupatie VARCHAR(20),
  ID_Magazin VARCHAR(10) NOT NULL,
  PRIMARY KEY (ID_Angajat),
  FOREIGN KEY (ID_Magazin) REFERENCES Magazin(ID_Magazin)
);

CREATE TABLE Fabrica
(
  ID_Fabrica VARCHAR(10) NOT NULL,
  Productie INT NOT NULL,
  Data_infintare DATE NOT NULL,
  ID_Locatie VARCHAR(10) NOT NULL,
  PRIMARY KEY (ID_Fabrica),
  FOREIGN KEY (ID_Locatie) REFERENCES Locatie(ID_Locatie)
);

CREATE TABLE Muncitor
(
  ID_Muncitor INT NOT NULL,
  Nume VARCHAR(20) NOT NULL,
  Prenume VARCHAR(20) NOT NULL,
  Salariu INT NOT NULL,
  Data_angajarii DATE NOT NULL,
  Specializare VARCHAR(20),
  ID_Fabrica VARCHAR(10),
  PRIMARY KEY (ID_Muncitor),
  FOREIGN KEY (ID_Fabrica) REFERENCES Fabrica(ID_Fabrica)
);

CREATE TABLE Depozit
(
  ID_Depozit VARCHAR(10) NOT NULL,
  Marime INT NOT NULL,
  ID_Locatie VARCHAR(10) NOT NULL,
  PRIMARY KEY (ID_Depozit),
  FOREIGN KEY (ID_Locatie) REFERENCES Locatie(ID_Locatie)
);

CREATE TABLE Contract
(
  ID_Contract INT NOT NULL,
  Suma INT NOT NULL,
  ID_Depozit VARCHAR(10) NOT NULL,
  ID_Magazin VARCHAR(10) NOT NULL,
  PRIMARY KEY (ID_Contract),
  FOREIGN KEY (ID_Depozit) REFERENCES Depozit(ID_Depozit),
  FOREIGN KEY (ID_Magazin) REFERENCES Magazin(ID_Magazin)
);

CREATE TABLE Parfum
(
  ID_Parfum VARCHAR(10) NOT NULL,
  Nume VARCHAR(20) NOT NULL,
  Miros VARCHAR(20) NOT NULL,
  ID_Fabrica VARCHAR(10) NOT NULL,
  ID_Depozit VARCHAR(10) NOT NULL,
  PRIMARY KEY (ID_Parfum),
  FOREIGN KEY (ID_Fabrica) REFERENCES Fabrica(ID_Fabrica),
  FOREIGN KEY (ID_Depozit) REFERENCES Depozit(ID_Depozit)
);

CREATE TABLE Comanda
(
  ID_Comanda INT NOT NULL,
  Cantitate INT NOT NULL,
  Suma INT NOT NULL,
  ID_Parfum VARCHAR(10) NOT NULL,
  ID_Magazin VARCHAR(10) NOT NULL,
  ID_Client INT NOT NULL,
  PRIMARY KEY (ID_Comanda),
  FOREIGN KEY (ID_Parfum) REFERENCES Parfum(ID_Parfum),
  FOREIGN KEY (ID_Magazin) REFERENCES Magazin(ID_Magazin),
  FOREIGN KEY (ID_Client) REFERENCES Client(ID_Client)
);


--INSERARE
INSERT INTO Client(ID_Client,Nume,Prenume,Telefon,Mail) VALUES(100, 'Georgica', 'Ion', '0736363636', 'cxc@gmail.com');
INSERT INTO Client(ID_Client,Nume,Prenume,Telefon,Mail) VALUES(101, 'Popescu', 'Vasile', '0736322222', 'pop@gmail.com');
INSERT INTO Client(ID_Client,Nume,Prenume,Telefon,Mail) VALUES(102, 'Georgescu', 'Ion', NULL, 'iom@gmail.com');
INSERT INTO Client(ID_Client,Nume,Prenume,Telefon,Mail) VALUES(103, 'Williams', 'Georgeta', '0736112211', 'wll@gmail.com');
INSERT INTO Client(ID_Client,Nume,Prenume,Telefon,Mail) VALUES(104, 'Grecu', 'Ionela', '0736363600', null);
select * from client;

INSERT INTO Regiune(ID_Regiune, Nume) VALUES('EUR', 'Europa');
INSERT INTO Regiune(ID_Regiune, Nume) VALUES('AUS', 'Australia');
INSERT INTO Regiune(ID_Regiune, Nume) VALUES('ASI', 'Asia');
INSERT INTO Regiune(ID_Regiune, Nume) VALUES('ANO', 'America de Nord');
INSERT INTO Regiune(ID_Regiune, Nume) VALUES('ASU', 'America de Sud');
select * from regiune;

INSERT INTO Tara(ID_Tara, Nume, ID_Regiune) VALUES('RO', 'Romania', 'EUR');
INSERT INTO Tara(ID_Tara, Nume, ID_Regiune) VALUES('DE', 'Germania', 'EUR');
INSERT INTO Tara(ID_Tara, Nume, ID_Regiune) VALUES('US', 'Statele Unite', 'ANO');
INSERT INTO Tara(ID_Tara, Nume, ID_Regiune) VALUES('CH', 'China', 'ASI');
INSERT INTO Tara(ID_Tara, Nume, ID_Regiune) VALUES('BZ', 'Brazilia', 'ASU');
select* from tara;

INSERT INTO Locatie(ID_Locatie, Cod_postal, Strada, ID_Tara, Oras) VALUES('SHN1', '002233', 'Serban Huinu 1', 'RO', 'Bucuresti');
INSERT INTO Locatie(ID_Locatie, Cod_postal, Strada, ID_Tara, Oras) VALUES('RCC34', '056493', 'Rech Cron 34', 'DE', 'Hamburg');
INSERT INTO Locatie(ID_Locatie, Cod_postal, Strada, ID_Tara, Oras) VALUES('Q13', '53221', 'Qianmen 13', 'CH', 'Beijing');
INSERT INTO Locatie(ID_Locatie, Cod_postal, Strada, ID_Tara, Oras) VALUES('S64', '430222', 'Sloath 41', 'US', 'San Francisco');
INSERT INTO Locatie(ID_Locatie, Cod_postal, Strada, ID_Tara, Oras) VALUES('BPH6', null, 'Bogdan P. Hasdeu 6', 'RO', 'Craiova');
INSERT INTO Locatie(ID_Locatie, Cod_postal, Strada, ID_Tara, Oras) VALUES('BZE3', '212333', 'Bezeor 3', 'BZ', 'Brasilia');
INSERT INTO Locatie(ID_Locatie, Cod_postal, Strada, ID_Tara, Oras) VALUES('SNC2', '346783', 'Sincai 15', 'RO', 'Bucuresti');
INSERT INTO Locatie(ID_Locatie, Cod_postal, Strada, ID_Tara, Oras) VALUES('AVI20', '388543', 'Aviatorilor 20', 'RO', 'Iasi');
select * from locatie;

INSERT INTO Magazin(ID_Magazin, Telefon, Nume, ID_Locatie ) VALUES('MG1', '+8616742264298', 'Beijing parfumes', 'Q13');
INSERT INTO Magazin(ID_Magazin, Telefon, Nume, ID_Locatie ) VALUES('MG2', '+40736073135', 'Luxury shop', 'SHN1');
INSERT INTO Magazin(ID_Magazin, Telefon, Nume, ID_Locatie ) VALUES('MG3', '+491515553057', 'German quality', 'RCC34');
INSERT INTO Magazin(ID_Magazin, Telefon, Nume, ID_Locatie ) VALUES('MG4', '+14842634732', 'San parfume', 'S64');
INSERT INTO Magazin(ID_Magazin, Telefon, Nume, ID_Locatie ) VALUES('MG5', '+40722222222', 'Parfumuri de top', 'BPH6');
select * from magazin;

INSERT INTO Angajat_magazin(ID_Angajat, Nume, Prenume, Salariu, Data_angajarii, Ocupatie, ID_Magazin) VALUES(1000, 'Ion', 'Croco', 2000, TO_DATE('17/12/2015', 'DD/MM/YYYY'), 'Vanzator', 'MG1');
INSERT INTO Angajat_magazin(ID_Angajat, Nume, Prenume, Salariu, Data_angajarii, Ocupatie, ID_Magazin) VALUES(1001, 'Vasile', 'Popescu', 2000, TO_DATE('12/10/2012', 'DD/MM/YYYY'), 'Vanzator', 'MG2');
INSERT INTO Angajat_magazin(ID_Angajat, Nume, Prenume, Salariu, Data_angajarii, Ocupatie, ID_Magazin) VALUES(1002, 'Vasile', 'Campineanu', 4000, TO_DATE('24/03/2001', 'DD/MM/YYYY'), 'Manager', 'MG3');
INSERT INTO Angajat_magazin(ID_Angajat, Nume, Prenume, Salariu, Data_angajarii, Ocupatie, ID_Magazin) VALUES(1003, 'Herbert', 'Bobbins', 2500, TO_DATE('11/11/2011', 'DD/MM/YYYY'), 'Vanzator', 'MG4');
INSERT INTO Angajat_magazin(ID_Angajat, Nume, Prenume, Salariu, Data_angajarii, Ocupatie, ID_Magazin) VALUES(1004, 'George', 'Ionel', 1000, TO_DATE('10/12/2012', 'DD/MM/YYYY'), 'Ingrijitor', 'MG5');
select * from angajat_magazin;

INSERT INTO Fabrica(ID_Fabrica, Data_infintare, Productie, ID_Locatie) VALUES('FAB1', TO_DATE('10/12/2001', 'DD/MM/YYYY'), 2000, 'AVI20');
INSERT INTO Fabrica(ID_Fabrica, Data_infintare, Productie, ID_Locatie) VALUES('FAB2', TO_DATE('01/02/1990', 'DD/MM/YYYY'), 1200, 'BZE3');
INSERT INTO Fabrica(ID_Fabrica, Data_infintare, Productie, ID_Locatie) VALUES('FAB3', TO_DATE('05/06/1984', 'DD/MM/YYYY'), 1000, 'SNC2');
INSERT INTO Fabrica(ID_Fabrica, Data_infintare, Productie, ID_Locatie) VALUES('FAB4', TO_DATE('12/12/2016', 'DD/MM/YYYY'), 4000, 'Q13');
INSERT INTO Fabrica(ID_Fabrica, Data_infintare, Productie, ID_Locatie) VALUES('FAB5', TO_DATE('07/09/2012', 'DD/MM/YYYY'), 3200, 'S64');
select * from fabrica;

INSERT INTO Muncitor(ID_Muncitor, Nume, Prenume, Salariu, Data_angajarii, Specializare, ID_Fabrica) VALUES(2000, 'Alexandru', 'Vasilaru', 800, TO_DATE('17/12/2015', 'DD/MM/YYYY'), 'Sticlar', 'FAB1');
INSERT INTO Muncitor(ID_Muncitor, Nume, Prenume, Salariu, Data_angajarii, Specializare, ID_Fabrica) VALUES(2001, 'Bob', 'Stocks', 900, TO_DATE('10/06/2012', 'DD/MM/YYYY'), 'Sticlar', 'FAB2');
INSERT INTO Muncitor(ID_Muncitor, Nume, Prenume, Salariu, Data_angajarii, Specializare, ID_Fabrica) VALUES(2002, 'Shi', 'San Ping', 1700, TO_DATE('17/12/2018', 'DD/MM/YYYY'), 'Parfumier', 'FAB3');
INSERT INTO Muncitor(ID_Muncitor, Nume, Prenume, Salariu, Data_angajarii, Specializare, ID_Fabrica) VALUES(2003, 'Matei', 'Olteanu', 1700, TO_DATE('24/03/2014', 'DD/MM/YYYY'), 'Parfumier', 'FAB4');
INSERT INTO Muncitor(ID_Muncitor, Nume, Prenume, Salariu, Data_angajarii, Specializare, ID_Fabrica) VALUES(2004, 'Florin', 'Filimon', 1500, TO_DATE('30/10/2019', 'DD/MM/YYYY'), 'Parfumier', 'FAB5');
INSERT INTO Muncitor(ID_Muncitor, Nume, Prenume, Salariu, Data_angajarii, Specializare, ID_Fabrica) VALUES(2005, 'Adrian', 'Florinache', 3300, TO_DATE('05/12/1999', 'DD/MM/YYYY'), 'Maistru', 'FAB1');
INSERT INTO Muncitor(ID_Muncitor, Nume, Prenume, Salariu, Data_angajarii, Specializare, ID_Fabrica) VALUES(2006, 'George', 'Cal', 3300, TO_DATE('05/10/2006', 'DD/MM/YYYY'), 'Maistru', 'FAB1');
INSERT INTO Muncitor(ID_Muncitor, Nume, Prenume, Salariu, Data_angajarii, Specializare, ID_Fabrica) VALUES(2007, 'Alin', 'Zlotea', 1000, TO_DATE('28/12/2009', 'DD/MM/YYYY'), 'Sticlar', 'FAB2');
INSERT INTO Muncitor(ID_Muncitor, Nume, Prenume, Salariu, Data_angajarii, Specializare, ID_Fabrica) VALUES(2008, 'Alexandru', 'Marcu', 1600, TO_DATE('25/04/2009', 'DD/MM/YYYY'), 'Parfumier', 'FAB3');
INSERT INTO Muncitor(ID_Muncitor, Nume, Prenume, Salariu, Data_angajarii, Specializare, ID_Fabrica) VALUES(2009, 'Alexandru', 'Ionel', 1000, TO_DATE('23/05/2020', 'DD/MM/YYYY'), 'Parfumier', null);
select * from muncitor;

INSERT INTO Depozit(ID_Depozit, Marime, ID_Locatie) VALUES('DEP1', 2000, 'AVI20');
INSERT INTO Depozit(ID_Depozit, Marime, ID_Locatie) VALUES('DEP2', 3000, 'SNC2');
INSERT INTO Depozit(ID_Depozit, Marime, ID_Locatie) VALUES('DEP3', 4000, 'BPH6');
INSERT INTO Depozit(ID_Depozit, Marime, ID_Locatie) VALUES('DEP4', 1000, 'Q13');
INSERT INTO Depozit(ID_Depozit, Marime, ID_Locatie) VALUES('DEP5', 3000, 'S64');
select * from depozit;

INSERT INTO Contract(ID_Contract, Suma, ID_Depozit, ID_Magazin) VALUES(1, 20000, 'DEP1', 'MG1');
INSERT INTO Contract(ID_Contract, Suma, ID_Depozit, ID_Magazin) VALUES(2, 10000, 'DEP1', 'MG2');
INSERT INTO Contract(ID_Contract, Suma, ID_Depozit, ID_Magazin) VALUES(3, 20000, 'DEP4', 'MG3');
INSERT INTO Contract(ID_Contract, Suma, ID_Depozit, ID_Magazin) VALUES(4, 20000, 'DEP2', 'MG1');
INSERT INTO Contract(ID_Contract, Suma, ID_Depozit, ID_Magazin) VALUES(5, 23300, 'DEP2', 'MG5');
INSERT INTO Contract(ID_Contract, Suma, ID_Depozit, ID_Magazin) VALUES(6, 100000, 'DEP3', 'MG4');
INSERT INTO Contract(ID_Contract, Suma, ID_Depozit, ID_Magazin) VALUES(7, 230000, 'DEP2', 'MG4');
INSERT INTO Contract(ID_Contract, Suma, ID_Depozit, ID_Magazin) VALUES(8, 9000, 'DEP4', 'MG5');
INSERT INTO Contract(ID_Contract, Suma, ID_Depozit, ID_Magazin) VALUES(9, 12000, 'DEP5', 'MG2');
INSERT INTO Contract(ID_Contract, Suma, ID_Depozit, ID_Magazin) VALUES(10, 2000, 'DEP3', 'MG1');
INSERT INTO Contract(ID_Contract, Suma, ID_Depozit, ID_Magazin) VALUES(11, 17000, 'DEP5', 'MG1');
select * from contract;
DELETE FROM Contract WHERE id_contract=11;
commit;

INSERT INTO Parfum(ID_Parfum, Nume, Miros, ID_Fabrica, ID_Depozit) VALUES('GCI', 'Gucci', 'Citrice', 'FAB1', 'DEP1');
INSERT INTO Parfum(ID_Parfum, Nume, Miros, ID_Fabrica, ID_Depozit) VALUES('CHN', 'Chanel', 'Fructate', 'FAB2', 'DEP3');
INSERT INTO Parfum(ID_Parfum, Nume, Miros, ID_Fabrica, ID_Depozit) VALUES('DIOR', 'Dior', 'Citrice', 'FAB3', 'DEP2');
INSERT INTO Parfum(ID_Parfum, Nume, Miros, ID_Fabrica, ID_Depozit) VALUES('ARM', 'Armani', 'Oriental', 'FAB1', 'DEP2');
INSERT INTO Parfum(ID_Parfum, Nume, Miros, ID_Fabrica, ID_Depozit) VALUES('LCN', 'Lancome', 'Fructate', 'FAB2', 'DEP2');
INSERT INTO Parfum(ID_Parfum, Nume, Miros, ID_Fabrica, ID_Depozit) VALUES('FORD', 'Tom Ford', 'Floral', 'FAB4', 'DEP5');
INSERT INTO Parfum(ID_Parfum, Nume, Miros, ID_Fabrica, ID_Depozit) VALUES('DVD', 'Davidoff', 'Oriental', 'FAB5', 'DEP4');
INSERT INTO Parfum(ID_Parfum, Nume, Miros, ID_Fabrica, ID_Depozit) VALUES('KORS', 'Michael Kors', 'Tabac', 'FAB5', 'DEP5');
INSERT INTO Parfum(ID_Parfum, Nume, Miros, ID_Fabrica, ID_Depozit) VALUES('PRD', 'Prada', 'Floral', 'FAB4', 'DEP3');
INSERT INTO Parfum(ID_Parfum, Nume, Miros, ID_Fabrica, ID_Depozit) VALUES('FND', 'Fendi', 'Floral', 'FAB3', 'DEP2');
INSERT INTO Parfum(ID_Parfum, Nume, Miros, ID_Fabrica, ID_Depozit) VALUES('LV', 'Louis Vuitton', 'Tabac', 'FAB5', 'DEP1');
select * from parfum;

INSERT INTO Comanda(ID_Comanda, Cantitate, Suma, ID_Parfum, ID_Magazin, ID_Client) VALUES(1, 2, 200, 'FORD', 'MG4', 100);
INSERT INTO Comanda(ID_Comanda, Cantitate, Suma, ID_Parfum, ID_Magazin, ID_Client) VALUES(2, 4, 440, 'FND', 'MG5', 101);
INSERT INTO Comanda(ID_Comanda, Cantitate, Suma, ID_Parfum, ID_Magazin, ID_Client) VALUES(3, 5, 500, 'FORD', 'MG4', 102);
INSERT INTO Comanda(ID_Comanda, Cantitate, Suma, ID_Parfum, ID_Magazin, ID_Client) VALUES(4, 1, 200, 'GCI', 'MG1', 102);
INSERT INTO Comanda(ID_Comanda, Cantitate, Suma, ID_Parfum, ID_Magazin, ID_Client) VALUES(5, 2, 240, 'KORS', 'MG2', 100);
INSERT INTO Comanda(ID_Comanda, Cantitate, Suma, ID_Parfum, ID_Magazin, ID_Client) VALUES(6, 3, 800, 'DIOR', 'MG5', 101);
INSERT INTO Comanda(ID_Comanda, Cantitate, Suma, ID_Parfum, ID_Magazin, ID_Client) VALUES(7, 1, 140, 'LCN', 'MG5', 100);
INSERT INTO Comanda(ID_Comanda, Cantitate, Suma, ID_Parfum, ID_Magazin, ID_Client) VALUES(8, 6, 1400, 'ARM', 'MG5', 104);
INSERT INTO Comanda(ID_Comanda, Cantitate, Suma, ID_Parfum, ID_Magazin, ID_Client) VALUES(9, 24, 2000, 'DVD', 'MG3', 104);
INSERT INTO Comanda(ID_Comanda, Cantitate, Suma, ID_Parfum, ID_Magazin, ID_Client) VALUES(10, 5, 500, 'FND', 'MG4', 102);
INSERT INTO Comanda(ID_Comanda, Cantitate, Suma, ID_Parfum, ID_Magazin, ID_Client) VALUES(11, 2, 200, 'FND', 'MG4', 103);
select * from comanda;