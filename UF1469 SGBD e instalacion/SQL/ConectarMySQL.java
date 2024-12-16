public class ConectarMySQL
{
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Conector JDBC cargado!!!");
        } catch (ClassNotFoundException e) {
            System.out.println("No se pudo abrir el conector JDBC.");
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }
}
