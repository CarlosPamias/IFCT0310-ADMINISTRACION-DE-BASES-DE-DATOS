-- Dar privililegios a una tabla --

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE cuentas TO u2;

-- Quitar privilegios--

REVOKE ALL PRIVILEGES ON cuentas FROM u1;

REVOKE DELETE ON cuentas FROM u2;