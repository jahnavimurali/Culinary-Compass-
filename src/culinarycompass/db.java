/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package culinarycompass;

/**
 *
 * @author JAHNAVI
 */


import java.sql.*;

public class db {
    public static Connection mycon(){
        Connection con = null;
        
        try{
            Class.forName("oracle.jdbc.OracleDriver");
            //JOptionPane.showMessageDialog(this,"Driver Loaded!");
//            con = DriverManager.getConnection("jdbc:oracle:thin:@10.106.56.128:1521:orcl",
//                        "scott","tiger");
//            con = DriverManager.getConnection("jdbc:oracle:thin:@10.17.177.146:1521:orcl",
//                        "scott","tiger");
              con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.103:1521:orcl",
                        "scott","tiger");
                return con;
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e);
            return null;
        }
    }
}
