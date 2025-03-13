package Controller;

import Dal.BookDAO;
import Model.Book;
import Model.CartItem;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "BorrowDetail", urlPatterns = {"/borrowdetail"})
public class BorrowDetail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BorrowDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BorrowDetail at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Retrieve book ID from request parameter
        int bookId = Integer.parseInt(request.getParameter("bookID"));
        BookDAO bd = new BookDAO();
        Book b = bd.getBookDetail(bookId);

        // Get the cart from the session
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        boolean productExists = false;

        // Add item to the cart or update quantity if it already exists
        for (CartItem item : cart) {
            if (item.getBook().getBookID() == b.getBookID()) {
                item.setAmount(item.getAmount() + 1);
                productExists = true;
                break;
            }
        }

        // If the product doesn't exist in the cart, add it with quantity = 1
        if (!productExists) {
            CartItem newItem = new CartItem(b, 1); // Assuming CartItem has a constructor (Book, int)
            cart.add(newItem);
        }

        // Calculate total quantity and total number of items in the cart
        int totalQuantity = 0;
        for (CartItem item : cart) {
            totalQuantity += item.getAmount();
        }
        int numItems = cart.size(); // Number of different items

        // Set session attributes for total quantity, cart, and number of items
        session.setAttribute("totalQuantity", totalQuantity);
        session.setAttribute("cart", cart);
        session.setAttribute("numItems", numItems);

        // Forward to the content page
        request.getRequestDispatcher("borrowdetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        
        if (cart != null) {
            for (CartItem item : cart) {
                String amountParam = request.getParameter("amount_" + item.getBook().getBookID());
                if (amountParam != null) {
                    int newAmount = Integer.parseInt(amountParam);
                    item.setAmount(newAmount);
                }
            }
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("borrowdetail.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}



//        try {
//            int bookId = Integer.parseInt(request.getParameter("bookID"));
//            int amount = Integer.parseInt(request.getParameter("amount"));
//
//            HttpSession session = request.getSession();
//            BookDAO bd = new BookDAO();
//            Book b = bd.getBookDetail(bookId);
//
//            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
//            if (cart == null) {
//                cart = new ArrayList<>();
//            }
//
//            boolean productExists = false;
//            for (CartItem item : cart) {
//                if (item.getBook().getBookID() == b.getBookID()) {
//                    item.setAmount(amount + item.getAmount());  
//                    productExists = true;
//                    break;
//                }
//            }
//
//            if (!productExists) {
//                cart.add(new CartItem(b, amount));
//            }
//
//            session.setAttribute("cart", cart);
//            request.getRequestDispatcher("borrowdetail.jsp").forward(request, response);
//        } catch (NumberFormatException e) {
//            // Handle error where parameters are not valid integers
//            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid book ID or amount");
//        }