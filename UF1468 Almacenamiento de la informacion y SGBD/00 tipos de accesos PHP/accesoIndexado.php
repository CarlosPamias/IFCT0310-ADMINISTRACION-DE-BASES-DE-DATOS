<html>
<head>
    <title>Acceso secuencial a ficheros</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
</head>

<body>
    
    <h1 align="center">Acceso indexado</h1>
    <hr>
    <?php
        
        $nombreArchivo="datos.txt";
    
        try {
            $archivo=fopen($nombreArchivo,"r");
            if (!$archivo) {
                throw new Exception("");
            }
            
            $lineas=[];
            
            while ($linea=fgets($archivo)) {
                $lineas[]=$linea;
            }

            fclose($archivo);
            
            //print("El primer registro es: ".$lineas[0+2]."<br>");
            //print("El tercera registro es: ".$lineas[2+2]."<br>");
            //print("El quinto registro es: ".$lineas[4+2]."<br>");
            
            for ($i=0;$i<count($lineas);$i=$i+1){
                print($lineas[$i]."<br>");
            }

        } catch (Exception $e) {
            print("El archivo no existe!!!");
        }
        
    ?>
    
</body>
    
</html>