/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daftar_app;
import java.sql.*;
import javax.swing.JOptionPane;
/**
 *
 * @author Lenovo
 */
public class DB {
    private static Connection conn;
    
    public static Connection connectDB() throws SQLException{
        String DB = "jdbc:mysql://localhost:3306/daftar";
        String username = "root";
        String password = "";
        
        try{
            conn = (Connection) DriverManager.getConnection(DB, username, password);
            return conn;
        } catch(SQLException ex){
            JOptionPane.showMessageDialog(null, ex.toString());
        }
        return null;
    }
    
//    baca data
    public static ResultSet read(String sql) throws SQLException{
        ResultSet rs = null;
        try {
            conn = (Connection) connectDB();
            Statement st = conn.createStatement();
            rs = st.executeQuery(sql);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.toString());
        }
        return rs;
    }
//    eksekusi data
    public static boolean exec(String sql) throws SQLException{
        
        try {
            conn = (Connection) connectDB();
            Statement st = conn.createStatement();
            st.execute(sql);
            return true;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.toString());
        }
        return false;
    }
    
    
    
    public static void closeDB() throws SQLException{
        try {
            conn.close();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.toString());
        }
    }
}
