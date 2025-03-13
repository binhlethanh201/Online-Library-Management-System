package Controller;

import Dal.BookDAO;
import Dal.CategoryDAO;
import Model.Book;
import Model.Category;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "UpdateBookInfo", urlPatterns = {"/updateBookInfo"})
public class UpdateBookInfo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("bookID"));
            BookDAO bookDAO = new BookDAO();
            Book book = bookDAO.getBookDetail(id);

            CategoryDAO categoryDAO = new CategoryDAO();
            List<Category> categories = categoryDAO.getAllCatgory();

            request.setAttribute("book", book);
            request.setAttribute("categories", categories);

            request.getRequestDispatcher("updateBookInfo.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving book details");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int bookID = Integer.parseInt(request.getParameter("bookID"));
            String author = request.getParameter("author");
            int categoryID = Integer.parseInt(request.getParameter("category"));
            String description = request.getParameter("description");

            BookDAO bookDAO = new BookDAO();
            boolean updateResult = bookDAO.updateBookInfo(bookID, author, categoryID, description);
            if (updateResult) {
                response.sendRedirect("home?bookID=" + bookID);
            } else {
                request.setAttribute("error", "Failed to update book information");
                doGet(request, response);  // To reload the form with error message
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating book information");
        }
    }
}
