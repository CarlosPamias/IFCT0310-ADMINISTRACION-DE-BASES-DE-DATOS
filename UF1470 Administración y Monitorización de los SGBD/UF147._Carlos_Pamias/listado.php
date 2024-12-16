<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado todas las rutas</title>
    <style>
        table, th, td {
            border: 1px solid black;
            width: 500px;
            text-align: center;

        }
        th {
            background-color: #000;
            color: #fff;
        }
        tr:nth-child(odd) {
            background-color: burlywood;
        }
       
    </style>
    <body>
        <?php
 
        // Variables
        $conexion=mysqli_connect("localhost", "root", "", "academia");

        // Consulta
        $consulta = "SELECT * FROM cursos";
        $resultado = mysqli_query($conexion, $consulta);
      
        echo "Listado de cursos:<br><br>";
        echo "<table><tr><th>Id</th><th>Curso</th><th>Horas</th><th>Modalidad</th>";

        //bucle para mostrar los resultados
        while($fila = mysqli_fetch_array($resultado)) {
            // Imprimimos los valores 
           
            echo "<tr>";
            echo "<td>". $fila['Id']. "</td>";
            echo "<td>". $fila['Curso']. "</td>";
            echo "<td>". $fila['Horas']. "</td>";
            echo "<td>". $fila['Modalidad']. "</td>";
            echo "</tr>";
    
           
        }
        echo "</tr>"; 
        echo "</table>";
        // cerrar la conexión
        mysqli_close($conexion);
        echo "<br><a href='index.html'>Volver al inicio</a>";
        ?>
        </head>
        <body>    
