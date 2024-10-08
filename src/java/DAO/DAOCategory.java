/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import model.category;
import java.sql.*;

/**
 *
 * @author Admin
 */
public class DAOCategory {
    public static DAOCategory getDAOCategory(){
        return new DAOCategory();
    }
    public ArrayList<category> getAllCate(){
        ArrayList<category>c=new ArrayList<>();
        try {
            Connection con=JDBC.getConnection();
            String querry="select * from category";
            PreparedStatement pr=con.prepareStatement(querry);
            ResultSet rs=pr.executeQuery();
            while(rs.next()){
                int id=rs.getInt(1);
                String cate=rs.getString(2);
                category newcate=new category(id, cate);
                c.add(newcate);
                
            }
        } catch (Exception e) {
        }
        return c;
    }
   
    public category getCategoryById(int id) {
        category ct = null;
        try (Connection c = JDBC.getConnection();
             PreparedStatement pr = c.prepareStatement("SELECT * FROM category WHERE id = ?")) {
            pr.setInt(1, id);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                ct = new category(rs.getInt(1), rs.getString(2));  // Đổi tên lớp thành Category
            }
        } catch (SQLException e) {
            e.printStackTrace();  // In ra thông báo lỗi
        }
        return ct;  // Thêm dấu chấm phẩy
    }
    public static void main(String[] args) {
//        ArrayList<category> c=DAO.DAOCategory.getDAOCategory().getAllCate();
//        for(category con:c){
//            System.out.println(con.getCate());
//        }
        category ct=DAO.DAOCategory.getDAOCategory().getCategoryById(1);
        
        System.out.println(ct.getCate());
    }
}
