--------------------------------------------------------------------------------
-- Melyik állatok szertik az összes gyümölcsöt?
--------------------------------------------------------------------------------

select nev
    from szeret
MINUS
select nev
    from (select *
        from (select nev from szeret), (select gyumolcs from szeret)
            MINUS
            select * from szeret);
            
--------------------------------------------------------------------------------
-- Kik azok, akik legalább azokat a gyümölcsöket szeretik, mint Micimackó?
--------------------------------------------------------------------------------

select *
    from (select nev from szeret), (select gyumolcs from szeret where nev = 'Micimackó')
MINUS
select * from szeret;


--------------------------------------------------------------------------------
-- Kik azok a dolgozók, akik 1982.01.01 után léptek be a céghez?
--------------------------------------------------------------------------------

select dnev, belepes
    from dolgozo
        where belepes > TO_DATE('1982-01-01', 'YYYY-MM-DD');
        
--------------------------------------------------------------------------------
--Adjuk meg azon dolgozókat, akik nevének második betűje 'A'.
--------------------------------------------------------------------------------

select dnev
    from dolgozo
        where dnev like '_A%';
        
--------------------------------------------------------------------------------
-- Adjuk meg azon dolgozókat, akik nevében van legalább két 'L' betű. 
--------------------------------------------------------------------------------

select dnev
    from dolgozo
        where dnev like '%L%L%';
        
--------------------------------------------------------------------------------
-- Adjuk meg a dolgozók nevének utolsó három betűjét.
--------------------------------------------------------------------------------

select SUBSTR(dnev, -3, 3)
    from dolgozo;
    
--------------------------------------------------------------------------------
-- Adjuk meg a dolgozók fizetéseinek négyzetgyökét két tizedesre, és ennek egészrészét. 
--------------------------------------------------------------------------------

select ROUND(SQRT(fizetes), 2), FLOOR(ROUND(SQRT(fizetes), 2))
    from dolgozo;
  
