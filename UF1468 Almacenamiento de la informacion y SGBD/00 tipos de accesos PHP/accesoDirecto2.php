<html>
<head>
    <title>Acceso secuencial a ficheros</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
</head>

<body>
    
    <h1 align="center">Acceso directo aleatorio</h1>
    <hr>
    <?php
        
        function mostrarRegistro($nombreArchivo,$numRegistro,$cabecera,$tamanyo) {
            
            $salto=$cabecera+(($numRegistro-1)*$tamanyo);
            try {
                $archivo=fopen($nombreArchivo,"r");
                if (!$archivo) {
                    throw new Exception("");
                }

                $campos=fgets($archivo);

                fseek($archivo,$salto);
                $linea=fgets($archivo);
                
                fclose($archivo);
                
                return ($campos."<br>".$linea."<br>");

            } catch (Exception $e) {
                print("El archivo no existe!!!");
            }
        }
    
        print(mostrarRegistro("datos.txt",5,116+1,55));
        print(mostrarRegistro("datos.txt",2,116+1,55));
        
    ?>
    
</body>
    
</html>