package Controller;

import Dal.ReaderDAO;
import Dal.UserDAO;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "SignupServlet", urlPatterns = {"/signup"})
public class SignupServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SignupServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignupServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String repass = request.getParameter("repass");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String date = request.getParameter("date");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        if (!pass.equals(repass)) {
            String error = "Password does not match Re-entered Password";
            request.setAttribute("error", error);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else {
            UserDAO uDAO = new UserDAO();
            ReaderDAO rDAO = new ReaderDAO();
            boolean personAdded = rDAO.addReader(name, gender, date, null, address, email, phone);
            if (personAdded) {
                boolean signUpSuccess = uDAO.signUp(user, pass);
                if (signUpSuccess) {
                    response.sendRedirect("login.jsp");
                }
            }

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
