import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SQL {
    // Datos de conexión
    private static final String URL = "jdbc:mysql://localhost:3306/neptuno";
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

    // Método para ejecutar una consulta SQL
    public static void ejecutarConsulta(Connection conexion, String consulta) {
        Statement statement = null;
        ResultSet resultSet = null;
        int contador=0;
        try {
            // Crear el statement
            statement = conexion.createStatement();
            
            // Ejecutar la consulta
            resultSet = statement.executeQuery(consulta);
            
            // Procesar los resultados
            while (resultSet.next()) {
                // Aquí puedes hacer lo que desees con los resultados
                // Por ejemplo, imprimir alguna información
                System.out.println((++contador)+".- "+resultSet.getString("NombreCompania") + ", " + resultSet.getString("Ciudad"));
            }
        } catch (SQLException e) {
            System.out.println("Error al ejecutar la consulta: " + e.getMessage());
        } finally {
            // Cerrar el resultSet y el statement
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
            } catch (SQLException e) {
                System.out.println("Error al cerrar el resultSet o el statement: " + e.getMessage());
            }
        }
    }

    // Método principal para probar la conexión y la consulta
    public static void main(String[] args) {
        // Conectar a la base de datos
        Connection conexion = conectar();
        
        // Ejecutar una consulta de ejemplo
        if (conexion != null) {
            while (true) {
                ejecutarConsulta(conexion, "SELECT NombreCompania,Ciudad FROM clientes");
            }
        } else {
            System.out.println("No se pudo establecer la conexión.");
        }
    }
}

