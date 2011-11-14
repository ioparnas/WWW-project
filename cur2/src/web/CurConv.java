package web;

import model.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import com.google.gson.*;

public class CurConv extends HttpServlet {
	public void doPost(HttpServletRequest request,
	HttpServletResponse response)
	throws IOException, ServletException {
		String c1 = request.getParameter("From");
		String c2 = request.getParameter("To");
		String c3 = request.getParameter("Money");
		CurExpert ce = new CurExpert();
		String result = ce.getMoney(c1,c2,c3);
		request.setAttribute("result", result);	
		RequestDispatcher view = request.getRequestDispatcher("result.jsp");
		view.forward(request, response);
	}
}