/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dal.BorrowDAO;
import Model.Borrow;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author Duc Long
 */
@WebServlet(name = "BorrowManager", urlPatterns = {"/borrowManager"})
public class BorrowManager extends HttpServlet {

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
            out.println("<title>Servlet BorrowManager</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BorrowManager at " + request.getContextPath() + "</h1>");
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
        BorrowDAO bDAO = new BorrowDAO();
        List<Borrow> borrowList = new ArrayList<>();
        Map<Integer, List<Borrow>> borrowMap = new HashMap<>();
        String action = request.getParameter("action");
        String deadlineDate = request.getParameter("deadlineDate");
        if (action == null || action.trim().length() == 0) {
            action = "list";
        }
        switch (action) {
            case "list":
                borrowList = bDAO.getAllBorrow();
                for (Borrow borrow : borrowList) {
                    int personID = borrow.getPersonID();
                    if (!borrowMap.containsKey(personID)) {
                        borrowMap.put(personID, new ArrayList<>());
                    }
                    borrowMap.get(personID).add(borrow);
                }
                break;
            case "search":
                borrowList = bDAO.getPersonIDsByDeadline(deadlineDate);
                for (Borrow borrow : borrowList) {
                    int personID = borrow.getPersonID();
                    if (!borrowMap.containsKey(personID)) {
                        borrowMap.put(personID, new ArrayList<>());
                    }
                    borrowMap.get(personID).add(borrow);
                }
                break;
            default:
                throw new AssertionError();
        }

        request.setAttribute("borrowMap", borrowMap);
        request.getRequestDispatcher("borrowmanager.jsp").forward(request, response);
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
        String[] selectedBookIds = request.getParameterValues("bookid");
        Map<Integer, List<Borrow>> borrowMap = new HashMap<>();

        if (selectedBookIds != null && selectedBookIds.length > 0) {
            int personID = Integer.parseInt(request.getParameter("pid"));
            LocalDate validFrom = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String validFromStr = validFrom.format(formatter);
            LocalDate validThru = validFrom.plusDays(7);
            String validThruStr = validThru.format(formatter);

            List<Integer> bookIDs = new ArrayList<>();
            List<Integer> amounts = new ArrayList<>();

            // Collect all selected bookIDs and their corresponding amounts
            for (String bookId : selectedBookIds) {
                String amountStr = request.getParameter("amount_" + bookId);
                if (amountStr != null && !amountStr.isEmpty()) {
                    int amount = Integer.parseInt(amountStr);
                    bookIDs.add(Integer.parseInt(bookId));
                    amounts.add(amount);
                }
            }

            // Add borrow and borrow details to the database
            BorrowDAO bDAO = new BorrowDAO();
            bDAO.addBorrow(personID, bookIDs, amounts, validFromStr, validThruStr, null, "Đang mượn");

            // Get the updated list of all borrows
            List<Borrow> borrowList = bDAO.getAllBorrow();

            // Create borrowMap based on personID
            for (Borrow borrow : borrowList) {
                int pid = borrow.getPersonID();
                if (!borrowMap.containsKey(pid)) {
                    borrowMap.put(pid, new ArrayList<>());
                }
                borrowMap.get(pid).add(borrow);
            }
        } else {
            // Handle case when no books are selected (if needed).
        }

        // Set borrowMap attribute for the request to pass to borrowmanager.jsp
        request.setAttribute("borrowMap", borrowMap);
        request.getRequestDispatcher("borrowmanager.jsp").forward(request, response);
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
