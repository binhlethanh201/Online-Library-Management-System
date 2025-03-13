/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.admin;

import Dal.PublisherDAO;
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
@WebServlet(name = "PublisherDetailServlet", urlPatterns = {"/publisherDetail"})
public class PublisherDetailServlet extends HttpServlet {

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
            out.println("<title>Servlet PublisherDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PublisherDetailServlet at " + request.getContextPath() + "</h1>");
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
        int id = Integer.parseInt(request.getParameter("ID"));

        PublisherDAO pd = new PublisherDAO();
        Publisher pub = pd.getPublisherById(id);

        request.setAttribute("pub", pub);
        request.setAttribute("id", id);
        request.getRequestDispatcher("publisherDetail.jsp").forward(request, response);
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
         
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String website = request.getParameter("website");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        int id = Integer.parseInt(request.getParameter("ID"));

        PublisherDAO pd = new PublisherDAO();

        if (name == null || name.trim().isEmpty()
                || address == null || address.trim().isEmpty()
                || website == null || website.trim().isEmpty()
                || email == null || email.trim().isEmpty()
                || phone == null || phone.trim().isEmpty() || !validatePhoneNumber(phone)) {
            request.setAttribute("mess", "Cập Nhật Không Thành Công, Vui lòng nhập đúng giá trị!");
        } else {
            request.setAttribute("mess", "Cập Nhật Thành Công!");
            pd.updatePublisher(id, name, address, website, email, phone);
        }

        //goi lai detail
        
        Publisher pub = pd.getPublisherById(id);

        request.setAttribute("pub", pub);
        request.setAttribute("id", id);

        request.getRequestDispatcher("publisherDetail.jsp").forward(request, response);
//            response.sendRedirect("listPublisher");

    }


    public boolean validatePhoneNumber(String phoneNumber) {
        String regexPhoneNumber = "^(0[3|5|7|8|9])+([0-9]{8})\\b";

        return phoneNumber.matches(regexPhoneNumber);
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
