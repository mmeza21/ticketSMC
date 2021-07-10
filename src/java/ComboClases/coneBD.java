package ComboClases;

import java.sql.*;
import javax.swing.JOptionPane;
public class coneBD {
    public static PreparedStatement prest=null;
    public static CallableStatement cllst=null;
    public static Connection conec=null;
    public static Statement st=null;
    public static ResultSet rt=null;
    public static String usu;
    public static String contra;
    public static String host;
    public static String db;
    public void Conectar(){
        try{
            usu="root"; contra=""; host="localhost"; db="reporte";
            String url="jdbc:mysql://"+host+"/"+db;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conec=DriverManager.getConnection(url,usu,contra);
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, e.toString());
        }
    }
}
