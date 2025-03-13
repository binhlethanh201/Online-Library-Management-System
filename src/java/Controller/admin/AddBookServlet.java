/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.admin;

import Dal.BookDAO;
import Dal.CategoryDAO;
import Dal.PublisherDAO;
import Model.Book;
import Model.Category;
import Model.Publisher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name = "AddBookServlet", urlPatterns = {"/addBook"})
public class AddBookServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddBookServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddBookServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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

            String name = request.getParameter("name");
            String image = request.getParameter("image");
            String author = request.getParameter("author");
            String description = request.getParameter("des");
            int categoryId = Integer.parseInt(request.getParameter("category"));
            int publisherId = Integer.parseInt(request.getParameter("publisher"));
            int publishingYear = Integer.parseInt(request.getParameter("publishingYear"));
            
            BookDAO bd = new BookDAO();
            bd.addBook(name,"img/product/" + image, author, publisherId, categoryId, publishingYear, description);
        
    //    response.sendRedirect("bookList");
    
      //goi lai san pham
            List<Book> listB;
            listB = bd.getAllBook();

            //Phân Trang
            int page, numberpage = 8;
            int size = listB.size();
            int num = (size % 8 == 0 ? (size / 8) : ((size / 8)) + 1);
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numberpage;
            end = Math.min(page * numberpage, size);
            List<Book> list = bd.getBookByPage(listB, start, end);

            //get category
            CategoryDAO cd = new CategoryDAO();
            List<Category> listC;
            listC = cd.getAllCatgory();
            //get Pulisher
            PublisherDAO ps = new PublisherDAO();
            List<Publisher> listPu;
            listPu = ps.getPublisher();

            request.setAttribute("listPu", listPu);
            request.setAttribute("listCa", listC);

            request.setAttribute("listB", list);
            request.setAttribute("num", num);
            request.setAttribute("mess", "Thêm sách mới thành công!");
            request.getRequestDispatcher("bookList.jsp").forward(request, response);
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
