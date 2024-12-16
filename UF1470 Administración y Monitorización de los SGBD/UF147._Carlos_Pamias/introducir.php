
    <?php

    $conexion=mysqli_connect("localhost", "root", "", "academia");
    
    $nombre = $_POST['nombre'];
    $apellidos = $_POST['apellidos'];
    $email = $_POST['email'];
    $telefono = $_POST['telefono'];
   
   
    $instruccion = "INSERT INTO usuarios VALUES(' ','$nombre', '$apellidos', '$email', '$telefono')";
    $ejecurarInsertar = mysqli_query($conexion, $instruccion);

   
    echo "Alumno agregado correctamente";
    echo "<br><a href='index.html'>Volver al inicio</a>";
    echo "<br><a href='listado.php'>Listado de todas los cursos.</a>";
    echo "<br><a href='formulario.html'>Introducir otro alumno.</a>";
    // cerrar la conexión
    mysqli_close($conexion)
    ?>
