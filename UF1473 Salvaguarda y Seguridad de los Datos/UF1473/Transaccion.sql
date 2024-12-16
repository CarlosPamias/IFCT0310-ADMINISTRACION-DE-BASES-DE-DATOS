create table cuentas(
num_cuenta varchar(10) primary key,
cliente varchar(50),
saldo decimal(9,2)
)

insert into cuentas (num_cuenta, cliente, saldo) values ('A', 'C1', 1000);
insert into cuentas (num_cuenta, cliente, saldo) values ('B', 'C2', 100);
insert into cuentas (num_cuenta, cliente, saldo) values ('C', 'C3', 1500);

select * from cuentas;

-- Transaccion de dinero de una cuenta a otra --

BEGIN; -- se inicia la transaccion --
	UPDATE cuentas SET saldo = saldo - 100 WHERE num_cuenta = 'A';
	
	UPDATE cuentas SET saldo = saldo + 100 WHERE num_cuenta = 'B';

COMMIT;

-- Otra transaccion con puntos de recuperacion SAVEPOINTS --
BEGIN;
	UPDATE cuentas SET saldo = saldo - 100 WHERE num_cuenta = 'A';
	
	SAVEPOINT punto1;
	UPDATE cuentas SET saldo = saldo - 100 WHERE num_cuenta = 'A';

	ROLLBACK TO SAVEPOINT punto1;
	UPDATE cuentas SET saldo = saldo + 100 WHERE num_cuenta = 'B';

	