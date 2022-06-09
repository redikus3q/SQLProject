SET SERVEROUTPUT ON;
-- 4 CREARE
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


-- 5 INSERARE
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
INSERT INTO Muncitor(ID_Muncitor, Nume, Prenume, Salariu, Data_angajarii, Specializare, ID_Fabrica) VALUES(2010, 'Grigore', 'Alexandrescu', 1000, TO_DATE('03/02/2000', 'DD/MM/YYYY'), 'Parfumier', 'FAB4');
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

-- 6
-- Creati o functie care gaseste numarul angajatilor care au fost angajati printre primii n oameni la firma, si lucreaza intr-una din cele mai noi deschise m fabrici.
CREATE OR REPLACE FUNCTION Numar_muncitori_adt(n in number, m in number) return number is rezultat number(10); 
  TYPE tablou_muncitori IS TABLE OF muncitor%ROWTYPE INDEX BY BINARY_INTEGER;
  TYPE vector_fabrici IS VARRAY(100) OF fabrica%ROWTYPE;
  muncitori tablou_muncitori;
  fabrici vector_fabrici;
  i binary_integer;
  j binary_integer;

BEGIN
  select *
  bulk collect into muncitori
  from( select * from muncitor order by data_angajarii )
  where rownum <= n;
  
  select *
  bulk collect into fabrici
  from( select * from fabrica order by data_infintare desc )
  where rownum <= m;
  
  i := muncitori.first;
  rezultat := 0;
  
  while (i is not null) loop
    j := fabrici.first;
    while (j is not null) loop
      if muncitori(i).id_fabrica = fabrici(j).id_fabrica then
        rezultat := rezultat + 1;
      end if;
      j := fabrici.next(j);
    end loop;
    i := muncitori.next(i);
  end loop;
  
  return rezultat;
END Numar_muncitori_adt;
/

DECLARE 
BEGIN 
  DBMS_OUTPUT.PUT_LINE('Numarul de angajati este '|| Numar_muncitori_adt(5, 2));
  DBMS_OUTPUT.PUT_LINE('Numarul de angajati este '|| Numar_muncitori_adt(5, 3));
END; 
/

-- 7
-- Afisati pentru fiecare magazin toti angajatii care lucreaza la el.
CREATE OR REPLACE PROCEDURE Angajati_magazin_adt is
  CURSOR magazine IS SELECT id_magazin, nume FROM magazin;
  CURSOR angajati IS SELECT id_magazin, nume, prenume FROM angajat_magazin;
  id_m magazin.id_magazin%type;
  nume_m magazin.nume%type;
  id_a angajat_magazin.id_magazin%type;
  nume_a angajat_magazin.nume%type;
  prenume_a angajat_magazin.prenume%type;
BEGIN
  OPEN magazine;
    LOOP
      FETCH magazine INTO id_m, nume_m;
      EXIT WHEN magazine%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE ('Nume magazin: '|| nume_m);
      OPEN angajati;
        LOOP
          FETCH angajati INTO id_a, nume_a, prenume_a;
          EXIT WHEN angajati%NOTFOUND;
          IF id_m = id_a THEN
            DBMS_OUTPUT.PUT_LINE(nume_a || ' ' || prenume_a);
          END IF;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('');
      CLOSE angajati;
    END LOOP;
  CLOSE magazine;
END Angajati_magazin_adt;
/

DECLARE 
BEGIN 
  Angajati_magazin_adt;
END; 
/

-- 8
-- Afisati numarul de muncitori care au lucrat la fabricarea unui parfum dat ca parametru.
CREATE OR REPLACE FUNCTION Muncitori_parfumuri_adt(nume_parfum in parfum.nume%type) return number is rezultat number(10); 
  nume_invalid exception;
  nume_check number;
BEGIN
  select count(*)
  into nume_check
  from parfum
  where nume_parfum = parfum.nume;
  
  if nume_check = 0 then
    raise nume_invalid;
  end if;
  
  select count(*)
  into rezultat
  from parfum p
  join fabrica f on p.id_fabrica = f.id_fabrica
  join muncitor m on f.id_fabrica = m.id_fabrica
  where lower(p.nume) = lower(nume_parfum);
  return rezultat;
EXCEPTION -- nu prea pot aparea exceptii pentru ca countul mereu va pune ceva in variabile, si daca nu se gaseste nimic in tabele, countul va fi 0, ceea ce e ok
  when nume_invalid then
    DBMS_OUTPUT.PUT_LINE('Nu exista parfumuri cu numele dat.');
  when others then
    DBMS_OUTPUT.PUT_LINE('Alta eroare: ' || SQLCODE || ' - ' || SQLERRM);
END Muncitori_parfumuri_adt;
/

DECLARE
BEGIN
  -- alte exceptii nu pot fi obtinute
  DBMS_OUTPUT.PUT_LINE('Numarul de muncitori este '|| Muncitori_parfumuri_adt('Gucci'));
  DBMS_OUTPUT.PUT_LINE('Numarul de muncitori este '|| Muncitori_parfumuri_adt('Guscci'));
END;
/

-- 9
-- Dandu-se id-ul unei comenzi si numele unui parfum aflati din ce tara provine parfumul comandat (din ce tara este magazinul de unde a fost comandat).

CREATE OR REPLACE PROCEDURE Tara_parfum_adt(nume_parfum in parfum.nume%type, idul_comenzii in comanda.id_comanda%type) is
  nume_tara tara.nume%type;
BEGIN
  select t.nume
  into nume_tara
  from tara t 
  join locatie l on t.id_tara = l.id_tara
  join magazin m on m.id_locatie = l.id_locatie
  join comanda c on c.id_magazin = m.id_magazin
  join parfum p on p.id_parfum = c.id_parfum
  where lower(p.nume) = lower(nume_parfum) and c.id_comanda = idul_comenzii;
  DBMS_OUTPUT.PUT_LINE('Tara este ' || nume_tara);
EXCEPTION
  when NO_DATA_FOUND then
    DBMS_OUTPUT.PUT_LINE('Nu exista parfumul pe comanda data sau nu exista comanda: ' || SQLCODE || ' - ' || SQLERRM);
  when TOO_MANY_ROWS then
    DBMS_OUTPUT.PUT_LINE('Parfumul are mai multe tari de provenienta: ' || SQLCODE || ' - ' || SQLERRM);
  when others then
    DBMS_OUTPUT.PUT_LINE('Alta eroare: ' || SQLCODE || ' - ' || SQLERRM);
END Tara_parfum_adt;
/

DECLARE
BEGIN
  -- cred ca doar NO_DATA_FOUND poate fi obtinuta cu ce am facut mai sus
  Tara_parfum_adt('Armani', 8);
  Tara_parfum_adt('Armani', 7);
  Tara_parfum_adt('Armani', 37);
END;
/

-- 10
-- Creati un trigger care sa permita modificarea tabelului muncitor doar in prima zi a lunii, caci numai atunci se vrea sa se faca angajari/concedieri/schimbari salariale.

CREATE OR REPLACE TRIGGER salariu_check_adt
  BEFORE INSERT OR UPDATE OR DELETE ON muncitor
BEGIN 
  IF (TO_CHAR(SYSDATE,'DD') != '01') THEN 
    RAISE_APPLICATION_ERROR(-20001, 'Tabelul muncitor poate fi modificat doar in prima zi a lunii!'); 
  END IF; 
END; 
/

DROP TRIGGER salariu_check_adt;
-- verificare
INSERT INTO Muncitor(ID_Muncitor, Nume, Prenume, Salariu, Data_angajarii, Specializare, ID_Fabrica) VALUES(3000, 'Alexandru', 'Vasilaru', 800, TO_DATE('17/12/2015', 'DD/MM/YYYY'), 'Sticlar', 'FAB1');

-- 11
-- Creati un trigger care nu permite micsorarea sumei unei comenzi odata ce a fost plasata.
CREATE OR REPLACE TRIGGER comanda_check_adt
  BEFORE UPDATE OF suma ON comanda FOR EACH ROW
BEGIN 
  IF (:OLD.suma > :NEW.suma) THEN 
    RAISE_APPLICATION_ERROR(-20002, 'Suma unei comenzi nu poate fi micsorata!'); 
  END IF; 
END; 
/

DROP TRIGGER comanda_check_adt;
-- verificare
UPDATE comanda
SET suma = 4
WHERE id_comanda = 8;

-- 12
-- Creati un tabel care va retine date despre comenzile date de utilizator (numele utilizatorului, data, actiunea si tabelul). Apoi creati un trigger care adauga in tabel fiecare comanda de creare
-- stergere sau alterare de tabel impreuna cu informatiile aferente.

CREATE TABLE istorie_comenzi(utilizator varchar2(30), data date, actiune varchar2(30), tabel varchar2(30));

CREATE OR REPLACE TRIGGER Completare_tabel
  BEFORE CREATE or ALTER or DROP ON DATABASE
BEGIN
  IF ora_sysevent = 'CREATE' THEN
    INSERT INTO istorie_comenzi VALUES(user, sysdate, 'CREARE', ora_dict_obj_name);
  ELSIF ora_sysevent = 'ALTER' THEN
    INSERT INTO istorie_comenzi VALUES(user, sysdate, 'MODIFICARE', ora_dict_obj_name);
  ELSIF ora_sysevent = 'DROP' THEN
    INSERT INTO istorie_comenzi VALUES(user, sysdate, 'STERGERE' ,ora_dict_obj_name);
  END IF;
END;
/

drop trigger completare_tabel;

create table persoana(nume varchar2(20), prenume varchar2(20));
alter table persoana add varsta number(10);
drop table persoana;

select * from istorie_comenzi;

-- 13
-- Creati un pachet care sa contina toate functiile declarate anterior

CREATE OR REPLACE PACKAGE pachet_adt AS 
  FUNCTION Numar_muncitori_adt(n in number, m in number) return number;
  PROCEDURE Angajati_magazin_adt;
  FUNCTION Muncitori_parfumuri_adt(nume_parfum in parfum.nume%type) return number;
  PROCEDURE Tara_parfum_adt(nume_parfum in parfum.nume%type, idul_comenzii in comanda.id_comanda%type);
END pachet_adt;
/

CREATE OR REPLACE PACKAGE BODY pachet_adt AS 
--
  FUNCTION Numar_muncitori_adt(n in number, m in number) return number is rezultat number(10); 
    TYPE tablou_muncitori IS TABLE OF muncitor%ROWTYPE INDEX BY BINARY_INTEGER;
    TYPE vector_fabrici IS VARRAY(100) OF fabrica%ROWTYPE;
    muncitori tablou_muncitori;
    fabrici vector_fabrici;
    i binary_integer;
    j binary_integer;
  
  BEGIN
    select *
    bulk collect into muncitori
    from( select * from muncitor order by data_angajarii )
    where rownum <= n;
    
    select *
    bulk collect into fabrici
    from( select * from fabrica order by data_infintare desc )
    where rownum <= m;
    
    i := muncitori.first;
    rezultat := 0;
    
    while (i is not null) loop
      j := fabrici.first;
      while (j is not null) loop
        if muncitori(i).id_fabrica = fabrici(j).id_fabrica then
          rezultat := rezultat + 1;
        end if;
        j := fabrici.next(j);
      end loop;
      i := muncitori.next(i);
    end loop;
    
    return rezultat;
  END;
  
--
  PROCEDURE Angajati_magazin_adt is
    CURSOR magazine IS SELECT id_magazin, nume FROM magazin;
    CURSOR angajati IS SELECT id_magazin, nume, prenume FROM angajat_magazin;
    id_m magazin.id_magazin%type;
    nume_m magazin.nume%type;
    id_a angajat_magazin.id_magazin%type;
    nume_a angajat_magazin.nume%type;
    prenume_a angajat_magazin.prenume%type;
  BEGIN
    OPEN magazine;
      LOOP
        FETCH magazine INTO id_m, nume_m;
        EXIT WHEN magazine%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE ('Nume magazin: '|| nume_m);
        OPEN angajati;
          LOOP
            FETCH angajati INTO id_a, nume_a, prenume_a;
            EXIT WHEN angajati%NOTFOUND;
            IF id_m = id_a THEN
              DBMS_OUTPUT.PUT_LINE(nume_a || ' ' || prenume_a);
            END IF;
          END LOOP;
          DBMS_OUTPUT.PUT_LINE('');
        CLOSE angajati;
      END LOOP;
    CLOSE magazine;
  END;
  
--
  FUNCTION Muncitori_parfumuri_adt(nume_parfum in parfum.nume%type) return number is rezultat number(10); 
    nume_invalid exception;
    nume_check number;
  BEGIN
    select count(*)
    into nume_check
    from parfum
    where nume_parfum = parfum.nume;
    
    if nume_check = 0 then
      raise nume_invalid;
    end if;
    
    select count(*)
    into rezultat
    from parfum p
    join fabrica f on p.id_fabrica = f.id_fabrica
    join muncitor m on f.id_fabrica = m.id_fabrica
    where lower(p.nume) = lower(nume_parfum);
    return rezultat;
  EXCEPTION -- nu prea pot aparea exceptii pentru ca countul mereu va pune ceva in variabile
    when nume_invalid then
      DBMS_OUTPUT.PUT_LINE('Nu exista parfumuri cu numele dat.');
    when others then
      DBMS_OUTPUT.PUT_LINE('Alta eroare: ' || SQLCODE || ' - ' || SQLERRM);
  END;

--
  PROCEDURE Tara_parfum_adt(nume_parfum in parfum.nume%type, idul_comenzii in comanda.id_comanda%type) is
    nume_tara tara.nume%type;
  BEGIN
    select t.nume
    into nume_tara
    from tara t 
    join locatie l on t.id_tara = l.id_tara
    join magazin m on m.id_locatie = l.id_locatie
    join comanda c on c.id_magazin = m.id_magazin
    join parfum p on p.id_parfum = c.id_parfum
    where lower(p.nume) = lower(nume_parfum) and c.id_comanda = idul_comenzii;
    DBMS_OUTPUT.PUT_LINE('Tara este ' || nume_tara);
  EXCEPTION
    when NO_DATA_FOUND then
      DBMS_OUTPUT.PUT_LINE('Nu exista parfumul pe comanda data sau nu exista comanda: ' || SQLCODE || ' - ' || SQLERRM);
    when TOO_MANY_ROWS then
      DBMS_OUTPUT.PUT_LINE('Parfumul are mai multe tari de provenienta: ' || SQLCODE || ' - ' || SQLERRM);
    when others then
      DBMS_OUTPUT.PUT_LINE('Alta eroare: ' || SQLCODE || ' - ' || SQLERRM);
  END;
END pachet_adt;
/

-- 14
CREATE OR REPLACE PACKAGE pachet_aux_adt AS
  TYPE tablou_muncitori IS TABLE OF muncitor%ROWTYPE INDEX BY BINARY_INTEGER;
  muncitori tablou_muncitori;
  TYPE vector_angajati IS VARRAY(100) OF angajat_magazin%ROWTYPE;
  angajati vector_angajati;
  PROCEDURE Muncitori_platiti_bine_adt;
  PROCEDURE Angajati_platiti_bine_adt(nume_parfum in parfum.nume%type);
  FUNCTION Regiune_muncitor(nume_muncitor in muncitor.nume%type) return regiune.nume%type;
  FUNCTION Parfum_tara(nume_parfum in parfum.nume%type) return varchar2;
END pachet_aux_adt;
/

CREATE OR REPLACE PACKAGE BODY pachet_aux_adt AS
  -- Afisati muncitorii care au salariu mai mare decat media salariilor colegilor de continent, neluand in considerare
  -- la medie angajatii angajati inainte de anul 2000.
  PROCEDURE Muncitori_platiti_bine_adt is
  BEGIN
    select a.*
    bulk collect into muncitori
    from muncitor a
    join fabrica b on a.id_fabrica=b.id_fabrica
    join locatie c on b.id_locatie=c.id_locatie
    join tara d on c.id_tara=d.id_tara
    join regiune e on d.id_regiune=e.id_regiune
    where salariu>=
      (select avg(salariu)
      from muncitor y
      join fabrica x on y.id_fabrica=x.id_fabrica
      join locatie w on x.id_locatie=w.id_locatie
      join tara t on w.id_tara=t.id_tara
      join regiune r on t.id_regiune=r.id_regiune
      where e.id_regiune=r.id_regiune and TO_CHAR(y.data_angajarii, 'YYYY')>='2000');
  END;
  
  -- Sa se afiseze numele tuturor angajatilor din magazin care au salariu mai mare decat media salariala a muncitorilor care lucreaza
  -- la fabricarea al carui nume e dat ca parametru
  PROCEDURE Angajati_platiti_bine_adt(nume_parfum in parfum.nume%type) is
  i binary_integer;
  BEGIN
    select *
    bulk collect into angajati
    from angajat_magazin
    where salariu>=
      (select avg(a.salariu)
      from muncitor a
      join fabrica b on a.id_fabrica=b.id_fabrica
      join parfum c on b.id_fabrica=c.id_fabrica
      where lower(id_parfum)=lower(nume_parfum))
    order by nume;
    
    i := angajati.first;
    WHILE (i is not null) LOOP
      DBMS_OUTPUT.PUT_LINE(angajati(i).nume);
      i := angajati.next(i);
    END LOOP;
  END;
  
  --Afisati pentru fiecare muncitor numele regiunii in care munceste. Daca nu munceste in nicio regiune, afisati 'Nedefinit'.
  FUNCTION Regiune_muncitor(nume_muncitor in muncitor.nume%type) return regiune.nume%type is rezultat regiune.nume%type;
  BEGIN
    select e.nume
    into rezultat
    from muncitor a
    left outer join fabrica b on a.id_fabrica=b.id_fabrica
    left outer join locatie c on b.id_locatie=c.id_locatie
    left outer join tara d on c.id_tara=d.id_tara
    left outer join regiune e on d.id_regiune=e.id_regiune
    where a.nume = nume_muncitor;
    
    return rezultat;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Numele introdus este incorect '  || SQLCODE || ' - ' || SQLERRM);
    WHEN TOO_MANY_ROWS THEN
      DBMS_OUTPUT.PUT_LINE('Muncitorul lucreaza pe mai multe continente '  || SQLCODE || ' - ' || SQLERRM);
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Alta eroare! ' || SQLCODE || ' - ' || SQLERRM);
  END;
  
  FUNCTION Parfum_tara(nume_parfum in parfum.nume%type) return varchar2 is rezultat varchar2(100);
    tara_productie locatie.id_tara%type;
    tara_depozitare locatie.id_tara%type;
  BEGIN
    select l.id_tara
    into tara_productie
    from parfum p
    join fabrica f on p.id_fabrica = f.id_fabrica
    join locatie l on l.id_locatie = f.id_locatie
    where lower(p.nume) = lower(nume_parfum);
    
    select l.id_tara
    into tara_depozitare
    from parfum p
    join depozit d on p.id_depozit = d.id_depozit
    join locatie l on d.id_locatie = l.id_locatie
    where lower(p.nume) = lower(nume_parfum);
    
    IF tara_productie = tara_depozitare THEN
      rezultat := 'TRUE';
    ELSE
      rezultat := 'FALSE';
    END IF;
    
    return rezultat;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Nu a fost gasit parfumul '  || SQLCODE || ' - ' || SQLERRM);
    WHEN TOO_MANY_ROWS THEN
      DBMS_OUTPUT.PUT_LINE('Parfumul are mai multe tari de provenienta sau de vanzare '  || SQLCODE || ' - ' || SQLERRM);
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Alta eroare! ' || SQLCODE || ' - ' || SQLERRM);
  END;
END pachet_aux_adt;
/

-- Trigger ca 'muncitori' sa fie mereu actualizat
CREATE OR REPLACE TRIGGER muncitori_check
  AFTER INSERT OR UPDATE OR DELETE ON muncitor
BEGIN 
  PACHET_AUX_ADT.MUNCITORI_PLATITI_BINE_ADT;
END; 
/

-- Testari
DECLARE
  i binary_integer;
BEGIN
  PACHET_AUX_ADT.MUNCITORI_PLATITI_BINE_ADT;
  i := PACHET_AUX_ADT.muncitori.first;
  WHILE (i is not null) LOOP
    DBMS_OUTPUT.PUT_LINE(PACHET_AUX_ADT.muncitori(i).id_muncitor);
    i := PACHET_AUX_ADT.muncitori.next(i);
  END LOOP;
END;
/

DECLARE
BEGIN
  PACHET_AUX_ADT.Angajati_platiti_bine_adt('GCI');
END;
/

DECLARE
BEGIN
  DBMS_OUTPUT.PUT_LINE('Regiunea este ' || PACHET_AUX_ADT.Regiune_muncitor('Bob'));
END;
/

DECLARE
BEGIN
  DBMS_OUTPUT.PUT_LINE('Parfumul este fabricat si depozitat in aceeasi tara: ' || PACHET_AUX_ADT.Parfum_tara('Davidoff'));
END;
/


