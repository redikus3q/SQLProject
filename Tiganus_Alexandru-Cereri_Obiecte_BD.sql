--11
--Afisati id-urile fabricilor de la care se iau minim 2 tipuri de produse prin intermediul comenzilor de catre clienti care au numarul de telefon nenul.
select d.id_fabrica, count(a.id_client) as Tipuri_produse
from client a
join comanda b on a.id_client=b.id_client
join parfum c on b.ID_PARFUM=c.id_parfum
join fabrica d on c.ID_FABRICA=d.id_fabrica
where a.TELEFON is not null
group by d.id_fabrica
having count(a.id_client)>=2;

--Sa se afiseze toate datele despre toti angajatii din magazin care au salariu mai mare decat media salariala a muncitorilor care lucreaza la fabricarea parfumului Gucci.
select *
from angajat_magazin
where salariu>=
  (select avg(a.salariu)
  from muncitor a
  join fabrica b on a.id_fabrica=b.id_fabrica
  join parfum c on b.id_fabrica=c.id_fabrica
  where lower(id_parfum)=lower('GCI'))
order by nume;

--Afisati muncitorii care au salariu mai mare decat media salariilor colegilor de continent, neluand in considerare la medie angajatii angajati inainte de anul 2000.
select a.*
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
  
--Afisati id-ul fabricilor infintate inainte de 15 iunie 2008 care au minim 2 muncitori.
WITH abc AS (
  select a.id_fabrica, a.data_infintare, decode(count(b.id_muncitor), 0, 'nu', 1, 'nu', 'da') as decod
  from fabrica a
  join muncitor b on a.id_fabrica=b.id_fabrica
  group by a.id_fabrica, a.data_infintare
)
SELECT abc.id_fabrica
FROM abc
where abc.data_infintare<TO_DATE('15/06/2008', 'DD/MM/YYYY') and upper(abc.decod)='DA';

--Afisati id-ul clientilor si tipul lor. Un client este de tip bronz daca are o comanda, argint daca are 2, aur daca are 3, diamat daca are mai multe.
--Afisati metoda preferata de contact. Daca au numar de telefon, afisati-l, altfel afisati mailul. Se garanteaza ca niciun client nu are 0 comenzi.
select a.id_client, CASE
  WHEN count(b.id_client)=1 THEN 'Client de bronz'
  WHEN count(b.id_client)=2 THEN 'Client de argint'
  WHEN count(b.id_client)=3 THEN 'Client de aur'
  ELSE 'Client de diamant'
  END as Numar_comenzi, nvl(a.telefon, nvl(a.mail, 'Nu poate fi contactat')) as contact
from client a
join comanda b on a.id_client=b.id_client
group by a.id_client, nvl(a.telefon, nvl(a.mail, 'Nu poate fi contactat'));



--12
--Mariti salariul tuturor muncitorilor care au salariu mai mic decat salariul mediu al muncitorilor care lucreaza la fabricarea parfumului Prada cu 10%.
update muncitor
set salariu=salariu+salariu/10
where salariu<
  (select avg(a.salariu)
  from muncitor a
  join fabrica b on a.id_fabrica=b.id_fabrica
  join parfum c on b.id_fabrica=c.id_fabrica
  where lower(c.nume)='prada');
  
--Aplicati o reducere de 10% (micsorati suma cu 10%) la toate comenzile care sunt plasate de un client care a plasat 3 sau mai multe comenzi.
update comanda
set suma=suma-suma/10
where id_client in 
  (select a.id_client
  from client a
  join comanda b on a.id_client=b.id_client
  group by a.id_client
  having count(b.id_client)>=3);

--Concediati (stergeti) toti angajatii din magazin care au salariu mai mare decat cel mai bine platit muncitor care e parfumier. Nu se sterg managerii.
delete from angajat_magazin
where salariu>
  (select max(salariu)
  from muncitor
  where lower(specializare)='parfumier')
and lower(ocupatie)!='manager';

--13
create sequence sid
start with 1005
increment by 1
maxvalue 9999;
INSERT INTO Angajat_magazin(ID_Angajat, Nume, Prenume, Salariu, Data_angajarii, Ocupatie, ID_Magazin) VALUES(sid.nextval, 'Corina', 'Popa', 1200, TO_DATE('02/10/2018', 'DD/MM/YYYY'), 'Vanzator', 'MG2');
select * from angajat_magazin;

--16
--Afisati pentru fiecare muncitor id-ul regiunii in care munceste. Daca nu munceste in nicio regiune, afisati 'Nedefinit'.
select a.id_muncitor, a.nume, a.prenume, nvl(e.id_regiune, 'Nedefinit') as id_regiune
from muncitor a
left outer join fabrica b on a.id_fabrica=b.id_fabrica
left outer join locatie c on b.id_locatie=c.id_locatie
left outer join tara d on c.id_tara=d.id_tara
left outer join regiune e on d.id_regiune=e.id_regiune;

--Afisati ID-urile magazinelor care primesc marfa de la toate depozitele cu spatiu de stocare mai mare de 1000.
SELECT id_magazin
FROM contract
WHERE id_depozit IN
  (select id_depozit
  from depozit p
  where marime>1000)
GROUP BY id_magazin
HAVING COUNT(id_depozit)=
  (SELECT COUNT(*)
  from depozit p
  where marime>1000);
  
--Afisati ID-urile fabricilor care trimit marfa la toate depozitele cu spatiu de stocare mai mic sau egal cu 2000.
SELECT DISTINCT id_fabrica
FROM parfum a
WHERE NOT EXISTS (
  (SELECT id_depozit
  FROM depozit p
  WHERE marime<=2000)
  MINUS
  (SELECT p.id_depozit
  FROM depozit p, parfum b
  WHERE p.id_depozit=b.id_depozit
  AND b.id_fabrica=a.id_fabrica));