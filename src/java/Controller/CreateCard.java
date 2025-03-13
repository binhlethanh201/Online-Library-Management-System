package Controller;

import Dal.CardDAO;
import Dal.ReaderDAO;
import Dal.UserDAO;
import Model.Reader;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet(urlPatterns = {"/createCard"})
public class CreateCard extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreateCard</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateCard at " + request.getContextPath() + "</h1>");
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
        String name = request.getParameter("Name");
        String gender = request.getParameter("Gender");
        String dateOfBirth = request.getParameter("DateOfBirth");
        String address = request.getParameter("Address");
        String email = request.getParameter("Email");
        String phone = request.getParameter("Phone");
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        Random random = new Random();

        UserDAO uDAO = new UserDAO();
        ReaderDAO rDAO = new ReaderDAO();
        CardDAO cDAO = new CardDAO();
        if (!cDAO.checkPersonExistCard(rDAO.getPersonByUser(user).getPersonID())) {
            if (uDAO.checkUserExist(user, pass)) {
                String username = user;
                String password = pass;
                LocalDate validFrom = LocalDate.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                String validFromStr = validFrom.format(formatter);
                // Generate ValidThru as date 9 years from ValidFrom
                LocalDate validThru = validFrom.plusYears(9);
                String validThruStr = validThru.format(formatter);
                try {
                    cDAO.addCardExistUser(rDAO.getPersonByUser(user).getPersonID(), validFromStr, validThruStr);
                    int cardID = cDAO.getLastInsertedCardID(); // Add this line to get the last inserted CardID
                    if (cardID != -1) {
                        request.setAttribute("cardID", cardID);
                        request.setAttribute("validFromStr", validFromStr);
                        request.setAttribute("validThruStr", validThruStr);
                        request.setAttribute("username", username);
                        request.setAttribute("password", password);
                        request.getRequestDispatcher("displayCardInfo.jsp").forward(request, response);
                    } else {
                        response.getWriter().println("Error retrieving card ID");
                    }

                } catch (Exception e) {
                    // Handle generic exception
                    response.getWriter().println("An error occurred: " + e.getMessage());
                }
            } else {
                String username = "user" + random.nextInt(900) + 100;
                String password = "123";
                LocalDate validFrom = LocalDate.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                String validFromStr = validFrom.format(formatter);

                // Generate ValidThru as date 9 years from ValidFrom
                LocalDate validThru = validFrom.plusYears(9);
                String validThruStr = validThru.format(formatter);

                try {
                    // Save user to the database
                    UserDAO userDAO = new UserDAO();

                    ReaderDAO readerDAO = new ReaderDAO();
                    boolean isPersonAdded = readerDAO.addReader(name, gender, dateOfBirth, null, address, email, phone);

                    if (isPersonAdded) {
                        userDAO.signUp(username, password);
                        cDAO.addCard(validFromStr, validThruStr);
                        int cardID = cDAO.getLastInsertedCardID(); // Add this line to get the last inserted CardID

                        if (cardID != -1) {
                            request.setAttribute("cardID", cardID);
                            request.setAttribute("validFromStr", validFromStr);
                            request.setAttribute("validThruStr", validThruStr);
                            request.setAttribute("username", username);
                            request.setAttribute("password", password);
                            request.getRequestDispatcher("displayCardInfo.jsp").forward(request, response);
                        } else {
                            response.getWriter().println("Error retrieving card ID");
                        }
                    } else {
                        // Handle error if person addition fails
                        response.getWriter().println("Error adding person to database");
                    }
                } catch (Exception e) {
                    // Handle generic exception
                    response.getWriter().println("An error occurred: " + e.getMessage());
                }
            }
        } else {
            request.setAttribute("error", "Thẻ đã tồn tại");
            request.getRequestDispatcher("createCard.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("Name");
        String gender = request.getParameter("Gender");
        String dateOfBirth = request.getParameter("DateOfBirth");
        String address = request.getParameter("Address");
        String email = request.getParameter("Email");
        String phone = request.getParameter("Phone");
        Random random = new Random();

        UserDAO uDAO = new UserDAO();
        ReaderDAO rDAO = new ReaderDAO();
        CardDAO cDAO = new CardDAO();
        String username = "user" + random.nextInt(900) + 100;
        String password = "123";
        LocalDate validFrom = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String validFromStr = validFrom.format(formatter);

        // Generate ValidThru as date 9 years from ValidFrom
        LocalDate validThru = validFrom.plusYears(9);
        String validThruStr = validThru.format(formatter);

        try {
            // Save user to the database
            UserDAO userDAO = new UserDAO();

            ReaderDAO readerDAO = new ReaderDAO();
            boolean isPersonAdded = readerDAO.addReader(name, gender, dateOfBirth, null, address, email, phone);

            if (isPersonAdded) {
                userDAO.signUp(username, password);
                cDAO.addCard(validFromStr, validThruStr);
                int cardID = cDAO.getLastInsertedCardID() + 1; // Add this line to get the last inserted CardID

                if (cardID != -1) {
                    request.setAttribute("cardID", cardID);
                    request.setAttribute("validFromStr", validFromStr);
                    request.setAttribute("validThruStr", validThruStr);
                    request.setAttribute("username", username);
                    request.setAttribute("password", password);
                    request.getRequestDispatcher("displayCardInfo.jsp").forward(request, response);
                } else {
                    response.getWriter().println("Error retrieving card ID");
                }
            } else {
                // Handle error if person addition fails
                response.getWriter().println("Error adding person to database");
            }
        } catch (Exception e) {
            // Handle generic exception
            response.getWriter().println("An error occurred: " + e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
