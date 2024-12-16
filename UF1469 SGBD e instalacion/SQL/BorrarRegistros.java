import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;

import java.io.FileReader;
import java.io.BufferedReader;
import java.io.IOException;

public class BorrarRegistros {
    // Datos de conexión
    private static final String URL = "jdbc:mysql://localhost:3306/bbdd";
    private static final String USUARIO = "juanpedro";
    private static final String CONTRASEÑA = "Ifct0310*";

    // Método para conectar a la base de datos
    public static Connection conectar() {
        Connection conexion = null;
        try {
            // Registrar el driver JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establecer la conexión
            conexion = DriverManager.getConnection(URL, USUARIO, CONTRASEÑA);
            System.out.println("Conexión exitosa a la base de datos.");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al conectar a la base de datos: " + e.getMessage());
        }
        return conexion;
    }

    // Método principal para probar la conexión y la consulta
    public static void main(String[] args) {
        String nombreArchivo=new String("contactos.csv");
        String linea;
        String separador=new String(",");
        String consulta;
        
        // Conectar a la base de datos
        Connection conexion = conectar();
        
        // Ejecutar una consulta de ejemplo
        if (conexion != null) {
            
            PreparedStatement sentenciaSQL=null;
            
            try {
                FileReader archivo=new FileReader(nombreArchivo);
                BufferedReader bufer=new BufferedReader(archivo);
                
                while ((linea=bufer.readLine())!=null) {
                    String[] campos=linea.split(separador);
                    consulta="DELETE FROM contactos WHERE nombre LIKE '"+campos[0]+"' AND edad="+campos[1];
                    sentenciaSQL=conexion.prepareStatement(consulta);
                    sentenciaSQL.executeUpdate();
                }
                
                
            } catch (IOException | SQLException e) {
                System.out.println("Fallo en la aplicación: "+e.getMessage());
            }
            
        } else {
            System.out.println("No se pudo establecer la conexión.");
        }
    }
}

