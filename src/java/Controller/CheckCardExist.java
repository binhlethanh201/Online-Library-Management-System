/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dal.BookDAO;
import Dal.CardDAO;
import Dal.ReaderDAO;
import Model.Book;
import Model.Reader;
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
 * @author Duc Long
 */
@WebServlet(name = "CheckCardExist", urlPatterns = {"/checkCardExist"})
public class CheckCardExist extends HttpServlet {

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
            out.println("<title>Servlet CheckCardExist</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckCardExist at " + request.getContextPath() + "</h1>");
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
        String error = "";
        try {
            int cardid = Integer.parseInt(request.getParameter("cardid"));
            CardDAO cDAO = new CardDAO();
            ReaderDAO rDAO = new ReaderDAO();

            if (cDAO.checkExistCard(cardid)) {
                Reader r = rDAO.getPersonByCard(cardid);
                BookDAO bDAO = new BookDAO();
                List<Book> listB = bDAO.getAllBook();
                request.setAttribute("listB", listB);
                request.setAttribute("reader", r);
                request.getRequestDispatcher("createborrow.jsp").forward(request, response);
                return;
            } else {
                error = "Sai mã thẻ! Vui lòng nhập lại";
            }
        } catch (Exception e) {
            error = "Có lỗi xảy ra! Vui lòng thử lại";
            System.out.println(e.getMessage());
        }

        request.setAttribute("error", error);
        request.getRequestDispatcher("checkCardExist.jsp").forward(request, response);
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
