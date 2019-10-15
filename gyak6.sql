select * from dolgozo natural join osztaly;
-- rel. algebrában egyenlő ezzel:
select * from dolgozo, osztaly where dolgozo.oazon = osztaly.oazon;
-- csak akkor használható ha azonosak az oszlopok nevei, és az adathalmazuk is közös!

select oazon, floor(avg(fizetes)) atlagfizu, max(fizetes), min(fizetes), sum(fizetes) from dolgozo group by oazon having min(fizetes) >= 1000;

select oazon, avg(fizetes) from dolgozo
    where jutalek is not null
        group by oazon
            having avg(fizetes) > 1500;

-- Mekkora a maximális fizetés a dolgozók között?
select * from
    (select dnev from dolgozo), (select max(fizetes) from dolgozo);
    
-- Mennyi a dolgozók összfizetése?
select sum(fizetes) from dolgozo;

-- Mennyi a 20-as osztályon az átlagfizetés?
select avg(fizetes) from dolgozo where oazon = 20;
select oazon, avg(fizetes) from dolgozo group by oazon having oazon = 20;
select oazon, avg(fizetes) from dolgozo where oazon = 20 group by oazon;

-- Adjuk meg, hogy hány különböző foglalkozás fordul elő a dolgozók között.
select count(*), count(foglalkozas), count(distinct foglalkozas) from dolgozo;

-- Hány olyan dolgozó van, akinek a fizetése > 2000?
select count(*) from dolgozo where fizetes > 2000;

-- Adjuk meg osztályonként az átlagfizetést (oazon, atl_fiz).
select oazon, avg(fizetes) from dolgozo group by oazon;

-- Adjuk meg osztályonként a telephelyet és az átlagfizetést (oazon, telephely, atl_fiz).
select oazon, telephely, avg(fizetes) from
    (dolgozo natural join osztaly) group by oazon, telephely;
