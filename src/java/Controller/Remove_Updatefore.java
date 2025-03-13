/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dal.BorrowDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Duc Long
 */
@WebServlet(name = "Remove_Updatefore", urlPatterns = {"/remove_Updatefore"})
public class Remove_Updatefore extends HttpServlet {

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
            out.println("<title>Servlet Remove_Updatefore</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Remove_Updatefore at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        String borrowidStr = request.getParameter("borrowid");
        String bookidStr = request.getParameter("bookid");
        String pidStr = request.getParameter("pid");
        try {
            BorrowDAO bDAO = new BorrowDAO();

            if ("Remove".equals(action) && borrowidStr != null && bookidStr != null) {
                int borrowid = Integer.parseInt(borrowidStr);
                int bookid = Integer.parseInt(bookidStr);
                bDAO.deleteOneBorrow(borrowid, bookid);
            } else if ("removeall".equals(action) && pidStr != null) {
                int pid = Integer.parseInt(pidStr);
                if (bDAO.deleteAllBorrowDetails(pid)) {
                    bDAO.deleteAllBorrowByPerson(pid);
                }
            } else if ("removeborrow".equals(action) && borrowidStr != null) {
                int borrowid = Integer.parseInt(borrowidStr);
                bDAO.deleteBorrow(borrowid);
            } else {
                request.setAttribute("message", "Invalid action or missing parameters.");
            }
        } catch (NumberFormatException e) {
        } catch (Exception e) {
        }

        // Forward the request and response to borrowManager JSP
        response.sendRedirect("borrowManager");
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
        String borrowIDStr = request.getParameter("borrowID");
        String bookIDStr = request.getParameter("bookID");
        String amountStr = request.getParameter("amount");
        BorrowDAO bDAO = new BorrowDAO();

        if (borrowIDStr != null && bookIDStr != null && amountStr != null) {
            int borrowid = Integer.parseInt(borrowIDStr);
            int bookid = Integer.parseInt(bookIDStr);
            int amount = Integer.parseInt(amountStr);

            String returndate = request.getParameter("returnDate");
            if (returndate != null && returndate.trim().isEmpty()) {
                returndate = null;
            }

            String status = request.getParameter("status");
            bDAO.updateBorrow(borrowid, bookid, amount, returndate, status);
            response.sendRedirect("borrowManager");
        }
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
