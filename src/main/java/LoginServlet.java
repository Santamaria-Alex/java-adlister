import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean validAttempt = username.equals("admin") && password.equals("password");

        if (validAttempt) {
            response.sendRedirect("/profile");
        } else {
            response.sendRedirect("/login");
        }

        //set the session object to a variable based on the HttpSession class
        HttpSession session = request.getSession();

        String darkMode = request.getParameter("color");

        //set the dark theme attribute on the session so that it gets remembered every time we log in
        session.setAttribute("darkMode", darkMode);

        //on  a different servet (profile page)
        //with our getAttribue method, our return is always a generic object type
        //therefore we need to explicitly cast the object to the correct type
        session.getAttribute("darkMode");
        String darkSelected = (String) session.getAttribute("darkMode");

        //to remove an attribute
        session.removeAttribute("darkMode");

        //destroys the session
        session.invalidate();
    }
}
