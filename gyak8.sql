-- 1, PL/SQL Hello World procedure
CREATE OR REPLACE PROCEDURE helloWorld(nev varchar2) IS
    hello varchar2(6) := 'Hello';
BEGIN
    for i in 1..5 loop
        if mod(i, 2) != 0 then 
            dbms_output.put_line('UNACCEPTABLE');
        else -- elsif mod(i, 2) = 0 then
            dbms_output.put_line(i || '| ' || hello || ' ' || nev);
        end if;
    end loop;
END;

-- 2, Prím-e Függvény 
CREATE OR REPLACE FUNCTION prime(n number) RETURN number IS
BEGIN
    for i in 2..sqrt(n) loop
        if mod(n, i) = 0 then
            return 0;
        end if;
    end loop;
    return 1;
END;


-- 3, N. fibonacci függvény
CREATE OR REPLACE FUNCTION fib(n number) RETURN number IS
BEGIN
    if n = 1 or n = 2 then
        return 1;
    end if;
    return fib(n - 2) + fib(n - 1);
END;

-- 4, LNKO függvény
CREATE OR REPLACE FUNCTION LNKO(aa number, bb number) RETURN number IS
    t number;
    a number := aa;
    b number := bb;
BEGIN
    while b != 0 loop
        t := b;
        b := mod(a, b);
        a := t;
    end loop;
    return a;
END;

-- 5, Faktoriális függvény
CREATE OR REPLACE FUNCTION faktor(n number) RETURN number IS
BEGIN
    if n = 1 then
        return 1;
    elsif n = 2 then
        return 2;
    end if;
    return n * faktor(n - 1);
END;

-- 6, Hanyszor fordul elő egy szövegben egy másik string
CREATE OR REPLACE FUNCTION hanyszor(text varchar2, ptrn varchar) RETURN number IS
    c number := 0;
BEGIN
    for i in 1..length(text) - length(ptrn) loop
        if ptrn = substr(text, i, length(ptrn)) then
            c := c + 1;
        end if;
    end loop;
    return c;
END;

call helloWorld('REEEEEEEEEE');
select prime(4) from dual;
select fib(10) from dual;
select lnko(80,100) from dual;
select faktor(5) from dual;
select hanyszor ('ab c ab ab de ab fg a', 'ab') from dual;
