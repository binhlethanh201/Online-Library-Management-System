/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Dal.BookDAO;
import Dal.CategoryDAO;
import Model.Book;
import Model.Category;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name="HomeServlet", urlPatterns={"/home"})
public class HomeServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HomeServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
   
        CategoryDAO cd= new CategoryDAO();
        List<Category> listC;
        listC= cd.getAllCatgory();
        BookDAO bd =new BookDAO();
        List<Book> listB;
        List<Book> listN;
        listN =bd.getNewBook();
        
        String stringCateID = request.getParameter("CateID");
        if(stringCateID == null ){
            listB = bd.getAllBook();
        }else{
            int cateId = Integer.parseInt(stringCateID);
            listB = bd.getBookByCategoryId(cateId);
            
        }
          //Phân Trang
        int page, numberpage=8;
        int size = listB.size();
        int num = (size%8==0?(size/8):((size/8))+1);
        String xpage= request.getParameter("page");
        if(xpage==null){
            page=1;
        }else{
            page=Integer.parseInt(xpage);
        }
        int start,end;
        start = (page-1)*numberpage;
        end=Math.min(page*numberpage, size);
        List<Book> list = bd.getBookByPage(listB, start, end);
        
        request.setAttribute("listB", list);
        request.setAttribute("num", num);
        
        
        request.setAttribute("listN", listN);
//        request.setAttribute("listB", listB);
        request.setAttribute("listC", listC);
        request.getRequestDispatcher("Home.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String txt = request.getParameter("txt");
         CategoryDAO cd= new CategoryDAO();
        List<Category> listC;
        listC= cd.getAllCatgory();
        BookDAO bd =new BookDAO();
        List<Book> listA = bd.getAllBook();
        List<Book> listN;
        listN =bd.getNewBook();
         List<Book> listB ; 
//        for(Book a : listA){
//            if(a.getBookName().equals(txt)){
//                listB.add(a);
//            }
//        }

        listB =bd.getBookBySearch(txt);
          //Phân Trang
        int page, numberpage=8;
        int size = listB.size();
        int num = (size%8==0?(size/8):((size/8))+1);
        String xpage= request.getParameter("page");
        if(xpage==null){
            page=1;
        }else{
            page=Integer.parseInt(xpage);
        }
        int start,end;
        start = (page-1)*numberpage;
        end=Math.min(page*numberpage, size);
        List<Book> list = bd.getBookByPage(listB, start, end);
        
        request.setAttribute("txt", txt);
        request.setAttribute("listN", listN);
        request.setAttribute("listB", listB);
        request.setAttribute("num", num);
        request.setAttribute("listC", listC);
        request.getRequestDispatcher("Home.jsp").forward(request, response);
        
        
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
