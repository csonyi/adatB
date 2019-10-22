--Adjuk meg, hogy az egyes osztályokon hány ember dolgozik.
select oazon, count(*) from dolgozo group by oazon;

select d2.dkod, count(*) from dolgozo d1 join dolgozo d2 
    on d1.fonoke = d2.dkod
    where d1.jutalek is not null
    group by d2.dkod
    having min(d1.fizetes) > 1500;
    
--Adjuk meg azokra az osztályokra az átlagfizetést, ahol ez nagyobb mint 2000.
select oazon, avg(fizetes) from dolgozo 
    group by oazon 
    having avg(fizetes) > 2000;

--Adjuk meg az átlagfizetést azokon az osztályokon, ahol legalább 4-en dolgoznak (oazon, avg_fiz)
select oazon, avg(fizetes), count(*) dologozok from dolgozo
    group by oazon
    having count(*) > 4;

--Adjuk meg az átlagfizetést és telephelyet azokon az osztályokon, ahol legalább 4-en dolgoznak.
select avg(fizetes), telephely, count(*) dolgozok from dolgozo natural join osztaly group by telephely having count(*) > 4;

--Adjuk meg azon osztályok nevét és telephelyét, ahol az átlagfizetés nagyobb mint 2000. (onev, telephely)
select onev, telephely, avg(fizetes) from dolgozo natural join osztaly group by onev, telephely having avg(fizetes) > 2000; 

--Adjuk meg azokat a fizetési kategóriákat, amelybe pontosan 3 dolgozó fizetése esik.
select kategoria from dolgozo join fiz_kategoria
    on dolgozo.fizetes >= fiz_kategoria.also
        and dolgozo.fizetes <= fiz_kategoria.felso
    group by kategoria
    having count(*) = 3;

--Adjuk meg azokat a fizetési kategóriákat, amelyekbe eső dolgozók mindannyian ugyanazon az osztályon dolgoznak.
select kategoria from dolgozo join fiz_kategoria
    on dolgozo.fizetes >= fiz_kategoria.also
        and dolgozo.fizetes <= fiz_kategoria.felso
    group by kategoria
    having count(oazon) = 1;

--Adjuk meg azon osztályok nevét és telephelyét, amelyeknek van 1-es fizetési kategóriájú dolgozója.
select onev, telephely from dolgozo d natural join osztaly o join fiz_kategoria k
    on d.fizetes >= k.also
        and d.fizetes <= k.felso
    where k.kategoria = 1
    group by o.onev, o.telephely
    having count(*) > 0;

--Adjuk meg azon osztályok nevét és telephelyét, amelyeknek legalább 2 fő 1-es fiz. kategóriájú dolgozója van.
select onev, telephely from dolgozo d natural join osztaly o join fiz_kategoria k
    on d.fizetes >= k.also
        and d.fizetes <= k.felso
    where k.kategoria = 1
    group by o.onev, o.telephely
    having count(d.dkod) >= 2;
    
--Készítsünk listát a páros és páratlan azonosítójú (dkod) dolgozók számáról.
select mod(dkod, 2) maradek, count(*) mennyiseg from dolgozo group by mod(dkod, 2);

--Listázzuk ki munkakörönként a dolgozók számát, átlagfizetését (kerekítve) numerikusan és grafikusan is.
  --200-anként jelenítsünk meg egy '#'-ot
select count(dkod), round(avg(fizetes), 0) atlagFizu, rpad(' ', round((fizetes) / 200,0)+1, '#') atlagGraf from dolgozo group by foglalkozas, fizetes;
  
-- Melyik gyümölcsöt hányan szeretik?
-- Melyik állat hányfajta gyümölcsöt szeret?
-- Hányan szeretik a micimackó által szeretett gyümölcsöket?
-- Hányan szeretik az összes gyümölcsöt?
-- Melyik gyümölcsöt hányan NEM szeretik?
