select * from cuentas;

begin;
do $$
declare
    -- declaración de variables --
    cantidad decimal := 100.00;
    cuenta_origen varchar(10) := 'A';
    cuenta_destino varchar(10) := 'B';
    saldo_origen decimal;
    estado varchar(2) := 'OK';
begin
    -- Verificar saldo de la cuenta origen
    select saldo into saldo_origen from cuentas where num_cuenta = cuenta_origen;

    -- Comprobar saldo --
    if saldo_origen >= cantidad then
        -- Quitar de la cuenta origen
        update cuentas set saldo = saldo - cantidad where num_cuenta = cuenta_origen;
        -- Transferir a la cuenta destino
        update cuentas set saldo = saldo + cantidad where num_cuenta = cuenta_destino;

        raise notice 'Transferencia realizada correctamente';

    else
        estado := 'ER';
        raise notice 'Saldo insuficiente';
    end if;
end $$;
    -- Confirmación o anulación de la transacción
commit;
rollback;


