/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Dal.CardDAO;
import Dal.ReaderDAO;
import Model.Reader;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author Duc Long
 */
@WebServlet(name="GetInfoToCheckOut", urlPatterns={"/getInfoToCheckOut"})
public class GetInfoToCheckOut extends HttpServlet {
   
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
            out.println("<title>Servlet GetInfoToCheckOut</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetInfoToCheckOut at " + request.getContextPath () + "</h1>");
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
        try{
            String username = request.getParameter("username");
            int bid = Integer.parseInt(request.getParameter("bookID"));
            CardDAO cDAO = new CardDAO();
            ReaderDAO rDAO = new ReaderDAO();
            Reader r = rDAO.getPersonByUser(username);
            int pid = r.getPersonID();
            if(cDAO.checkPersonExistCard(pid)){
                int CardID = cDAO.getCardByPerson(pid);
                int BorrowID = rDAO.getLastInsertedBorrowID() + 1;
                LocalDate validFrom = LocalDate.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                String validFromStr = validFrom.format(formatter);
                LocalDate validThru = validFrom.plusDays(7);
                String validThruStr = validThru.format(formatter);
                request.setAttribute("pid", pid);
                request.setAttribute("bid", bid);
                request.setAttribute("CardID", CardID);
                request.setAttribute("BorrowID", BorrowID);
                request.setAttribute("validFromStr", validFromStr);
                request.setAttribute("validThruStr", validThruStr);
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            }
            else{
                request.setAttribute("error", "Bạn chưa có thẻ! Vui lòng nhờ sự giúp đỡ của nhân viên để tạo thẻ");
                request.getRequestDispatcher("borrowdetail.jsp").forward(request, response);
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
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
        processRequest(request, response);
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
