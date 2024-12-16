create or replace function vueltas() returns varchar a
$$
declare
	x int := (select count ('Pais') from clientes);
	y int := 0;

begin
	while (y>x)
	loop
		raise notice 'vuelta %', y:
		y = y +1;
	end loop;
end
$$ language plpgsql;

select * from vueltas();

-- transaccion con bloqueo --
begin;
lock table clientes in access exclusive mode; -- bloqueo
select * from vueltas();
commit; 