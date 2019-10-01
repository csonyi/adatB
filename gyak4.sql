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
