/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.cart;
import model.category;
import model.product;

/**
 *
 * @author Admin
 */
public class addProduct extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
     
        ArrayList<category> cate=DAO.DAOCategory.getDAOCategory().getAllCate();
          request.setAttribute("cate", cate);

        int id=Integer.parseInt(request.getParameter("productId"));
          
       int num=Integer.parseInt(request.getParameter("num"));
       
        product pro=DAO.DAOproduct.getAOproduct().getProductById(id);
        cart c=new cart(pro, num);
        HttpSession session=request.getSession();
        ArrayList<cart> carts=(ArrayList<cart>) session.getAttribute("cart");
        if(carts ==null){
            carts=new ArrayList<>();
        }
        boolean check =false;
        for(cart con:carts){
            if(con.getProduct().getId()==pro.getId()){
                con.setNum(con.getNum()+num);
               check=true;
               break;
            }
        }
        
        if(!check){
            carts.add(c);
        }
           session.setAttribute("cart", carts);
           
            request.setAttribute("message", "Sản phẩm đã được thêm vào giỏ hàng thành công.");
        
         request.getRequestDispatcher("Controllerdetail?id="+id).forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
