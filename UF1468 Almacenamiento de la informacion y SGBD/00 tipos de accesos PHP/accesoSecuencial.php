<html>
<head>
    <title>Acceso secuencial a ficheros</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
</head>

<body>
    
    <h1 align="center">Acceso secuencial</h1>
    <hr>
    <?php
        
        $nombreArchivo="datos.txt";
        
        try {
            $archivo=fopen($nombreArchivo,"r");
            if (!$archivo) {
                throw new Exception("");
            }
            
            while ($linea=fgets($archivo)) {
                print($linea."<br>");
            }

            fclose($archivo);

        } catch (Exception $e) {
            print("El archivo no existe!!!");
        }
        
    ?>
    
</body>
    
</html>