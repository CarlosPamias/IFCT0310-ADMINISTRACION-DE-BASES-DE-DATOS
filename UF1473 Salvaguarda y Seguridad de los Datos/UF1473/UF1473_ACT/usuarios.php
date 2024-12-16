<?php
$host = 'localhost';
$db = 'colectividad';
$user = 'postgres';
$pass = 'postgres';

// Conexión a la base de datos
$conn = new PDO("pgsql:host=$host;dbname=$db", $user, $pass);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $alias = $_POST['alias'];
    $password = $_POST['password'];

    // Verificar credenciales
    $stmt = $conn->prepare('SELECT * FROM usuarios WHERE alias = :alias AND password = :password');
    $stmt->execute(['alias' => $alias, 'password' => $password]);
    $user = $stmt->fetch();

    if ($user) {
        // Mostrar tabla de cuentas
        echo "<h2>Listado de cuentas</h2>";
        $stmt = $conn->query('SELECT * FROM cuenta');
        echo "<table border='1'><tr><th>Número de cuenta</th><th>Nombre</th><th>Email</th><th>Saldo</th></tr>";
        while ($row = $stmt->fetch()) {
            echo "<tr><td>{$row['num_cuenta']}</td><td>{$row['nombre']}</td><td>{$row['email']}</td><td>{$row['saldo']}</td></tr>";
        }
        echo "</table>";

        // Mostrar modificaciones de saldo
        echo "<h2>Historial de modificaciones</h2>";
        $stmt = $conn->query('SELECT * FROM log_modificaciones');
        echo "<table border='1'><tr><th>Número de cuenta</th><th>Nombre</th><th>Saldo Anterior</th><th>Saldo Nuevo</th><th>Fecha</th></tr>";
        while ($row = $stmt->fetch()) {
            echo "<tr><td>{$row['num_cuenta']}</td><td>{$row['nombre']}</td><td>{$row['saldo_anterior']}</td><td>{$row['saldo_nuevo']}</td><td>{$row['fecha']}</td></tr>";
        }
        echo "</table>";
    } else {
        echo "Usuario o contraseña incorrectos.";
    }
}
?>

<!-- Formulario de autenticación -->
<form method="POST">
    Alias: <input type="text" name="alias" required><br>
    Contraseña: <input type="password" name="password" required><br>
    <input type="submit" value="Iniciar sesión">
</form>
