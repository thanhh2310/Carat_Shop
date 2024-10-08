/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import model.product;
import java.sql.*;
import model.category;

/**
 *
 * @author Admin
 */
public class DAOproduct {
    public static DAOproduct getAOproduct(){
        return new DAOproduct();
    }
   public ArrayList<product> getTop4() {
    ArrayList<product> products = new ArrayList<>();
    try {
        Connection con = JDBC.getConnection();
        String query = "SELECT * FROM product ORDER BY buy DESC LIMIT 4;";
        PreparedStatement pr = con.prepareStatement(query);
        ResultSet rs = pr.executeQuery();
        
        while (rs.next()) {
            // Lấy dữ liệu từ ResultSet và tạo đối tượng Product
            int id = rs.getInt("id");
            String name = rs.getString("name");
            double price = rs.getDouble("price");
            String image = rs.getString("image");
            String description = rs.getString("des");
            int cate = rs.getInt("cate");
            String color = rs.getString("color");
            String material = rs.getString("material");
            String stone = rs.getString("stone");
            String gender = rs.getString("gender");
            String perfection = rs.getString("perfection");
            int buy = rs.getInt("buy");
            category category=DAO.DAOCategory.getDAOCategory().getCategoryById(cate);
            // Tạo đối tượng Product và thêm vào danh sách
            product product = new product(id, name, price, image, description, category, color, material, stone, gender, perfection, buy);
            products.add(product);
        }
        
    } catch (Exception e) {
        e.printStackTrace(); // In lỗi ra console để dễ dàng kiểm tra
    }
    return products;
}
     public ArrayList<product> getTop4Id() {
    ArrayList<product> products = new ArrayList<>();
    try {
        Connection con = JDBC.getConnection();
        String query = "SELECT * FROM product ORDER BY id DESC LIMIT 4;";
        PreparedStatement pr = con.prepareStatement(query);
        ResultSet rs = pr.executeQuery();
        
        while (rs.next()) {
            // Lấy dữ liệu từ ResultSet và tạo đối tượng Product
            int id = rs.getInt("id");
            String name = rs.getString("name");
            double price = rs.getDouble("price");
            String image = rs.getString("image");
            String description = rs.getString("des");
            int cate = rs.getInt("cate");
            String color = rs.getString("color");
            String material = rs.getString("material");
            String stone = rs.getString("stone");
            String gender = rs.getString("gender");
            String perfection = rs.getString("perfection");
            int buy = rs.getInt("buy");
             category category=DAO.DAOCategory.getDAOCategory().getCategoryById(cate);
            // Tạo đối tượng Product và thêm vào danh sách
            product product = new product(id, name, price, image, description, category, color, material, stone, gender, perfection, buy);
            products.add(product);
        }
        
    } catch (Exception e) {
        e.printStackTrace(); // In lỗi ra console để dễ dàng kiểm tra
    }
    return products;
}
  public product getProductById(int id) {
    product product = null; // Khởi tạo biến product
    try {
        Connection con = JDBC.getConnection();
        String query = "SELECT * FROM product WHERE id = ?;"; // Câu truy vấn tìm sản phẩm theo ID
        PreparedStatement pr = con.prepareStatement(query);
        pr.setInt(1, id); // Gán giá trị ID vào câu truy vấn
        ResultSet rs = pr.executeQuery();
        
        if (rs.next()) { // Kiểm tra xem có kết quả không
            // Lấy dữ liệu từ ResultSet và tạo đối tượng Product
            String name = rs.getString("name");
            double price = rs.getDouble("price");
            String image = rs.getString("image");
            String description = rs.getString("des");
            int cate = rs.getInt("cate");
            String color = rs.getString("color");
            String material = rs.getString("material");
            String stone = rs.getString("stone");
            String gender = rs.getString("gender");
            String perfection = rs.getString("perfection");
            int buy = rs.getInt("buy");

            // Tạo đối tượng Product
             category category=DAO.DAOCategory.getDAOCategory().getCategoryById(cate);
            product = new product(id, name, price, image, description, category, color, material, stone, gender, perfection, buy);
        }
    } catch (Exception e) {
        e.printStackTrace(); // In lỗi ra console để dễ dàng kiểm tra
    }
    return product; // Trả về đối tượng product hoặc null nếu không tìm thấy
}
 public ArrayList<product> getProductByName(String search) {
    ArrayList<product> products = new ArrayList<>(); // Khởi tạo biến product
    try {
        Connection con = JDBC.getConnection();
        String query = "SELECT * FROM product WHERE LOWER(NAME) LIKE LOWER(?)"; // Sử dụng LOWER() để không phân biệt chữ hoa/chữ thường
        PreparedStatement pr = con.prepareStatement(query);
        pr.setString(1, "%" + search+ "%"); // Chuyển chuỗi tìm kiếm về chữ thường
        ResultSet rs = pr.executeQuery();
        
        while (rs.next()) { // Kiểm tra xem có kết quả không
            // Lấy dữ liệu từ ResultSet và tạo đối tượng Product
            int id = rs.getInt("id");
            String name = rs.getString("name");
            double price = rs.getDouble("price");
            String image = rs.getString("image");
            String description = rs.getString("des");
            int cate = rs.getInt("cate");
            String color = rs.getString("color");
            String material = rs.getString("material");
            String stone = rs.getString("stone");
            String gender = rs.getString("gender");
            String perfection = rs.getString("perfection");
            int buy = rs.getInt("buy");

            // Tạo đối tượng Product
            category category = DAO.DAOCategory.getDAOCategory().getCategoryById(cate);
           product product = new product(id, name, price, image, description, category, color, material, stone, gender, perfection, buy);
           products.add(product);
        }
    } catch (Exception e) {
        e.printStackTrace(); // In lỗi ra console để dễ dàng kiểm tra
    }
    return products; // Trả về đối tượng product hoặc null nếu không tìm thấy
}

     public ArrayList<product> getProductByCateId( int idcate) {
    ArrayList<product> products = new ArrayList<>();
    try {
        Connection con = JDBC.getConnection();
        String query = "SELECT * FROM product WHERE cate=?;";
        PreparedStatement pr = con.prepareStatement(query);
         pr.setInt(1, idcate);  // Đặt giá trị idcate vào câu truy vấn
        ResultSet rs = pr.executeQuery();
        
        while (rs.next()) {
            // Lấy dữ liệu từ ResultSet và tạo đối tượng Product
            int id = rs.getInt("id");
            String name = rs.getString("name");
            double price = rs.getDouble("price");
            String image = rs.getString("image");
            String description = rs.getString("des");
            int cate = rs.getInt("cate");
            String color = rs.getString("color");
            String material = rs.getString("material");
            String stone = rs.getString("stone");
            String gender = rs.getString("gender");
            String perfection = rs.getString("perfection");
            int buy = rs.getInt("buy");
             category category=DAO.DAOCategory.getDAOCategory().getCategoryById(cate);
            // Tạo đối tượng Product và thêm vào danh sách
            product product = new product(id, name, price, image, description, category, color, material, stone, gender, perfection, buy);
            products.add(product);
        }
        
    } catch (Exception e) {
        e.printStackTrace(); // In lỗi ra console để dễ dàng kiểm tra
    }
    return products;
}
    public static void main(String[] args) {
        ArrayList<product> p=DAO.DAOproduct.getAOproduct().getProductByName("vòng");
        for(product pa:p){
            System.out.println(pa.getName());
        }

    }

}
