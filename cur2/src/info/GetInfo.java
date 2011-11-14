package info;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class GetInfo extends HttpServlet {
	public void doGet(HttpServletRequest request,
	HttpServletResponse response)
	throws IOException, ServletException {
		response.sendRedirect((String)getServletContext().getAttribute("Link"));
	}
}