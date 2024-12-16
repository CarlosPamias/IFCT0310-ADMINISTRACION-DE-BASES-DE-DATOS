<html>
<head>
    <title>Acceso secuencial a ficheros</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
</head>

<body>
    
    <h1 align="center">Acceso directo aleatorio</h1>
    <hr>
    <?php
        
        $nombreArchivo="datos.txt";
    
        $cabecera=116+1;
        $numRegistro=4;
        $tamanyo=55;
    
        $salto=$cabecera+(($numRegistro-1)*$tamanyo);
    
        try {
            $archivo=fopen($nombreArchivo,"r");
            if (!$archivo) {
                throw new Exception("");
            }
            
            $campos=fgets($archivo);
            
            fseek($archivo,$salto);
            $linea=fgets($archivo);
            print($campos."<br>".$linea);

            fclose($archivo);

        } catch (Exception $e) {
            print("El archivo no existe!!!");
        }
        
    ?>
    
</body>
    
</html>