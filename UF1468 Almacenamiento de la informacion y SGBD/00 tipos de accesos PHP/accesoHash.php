<html>
<head>
    <title>Acceso secuencial a ficheros</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
</head>

<body>
    
    <h1 align="center">Acceso por hash (función resumen)</h1>
    <hr>
    <?php
        
        function calcularHash($cadena) {
            return hash('sha256',$cadena);
        }
        
        $nombreArchivo="datosEtiquetados.txt";
        $hash="Juan Pedro";
        print("La clave se búsqueda para '".$hash."' es el hash [".calcularHash($hash)."] y su contenido es:<br>");
    
        try {
            $archivo=fopen($nombreArchivo,"r");
            if (!$archivo) {
                throw new Exception("");
            }
            
            while ($linea=fgets($archivo)) {
                if(strpos($linea,calcularHash($hash))) {
                    while (($linea=fgets($archivo)) && ($linea[0]!="[")) {
                        print($linea."<br>");
                    }
                    break;
                }
                
            }

            fclose($archivo);
            
            

        } catch (Exception $e) {
            print("El archivo no existe!!!");
        }
        
    ?>
    
</body>
    
</html>