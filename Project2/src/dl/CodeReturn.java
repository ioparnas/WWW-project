package dl;  
   
import java.io.IOException;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.*;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import java.io.FileNotFoundException;  
import java.io.*;  

public class CodeReturn extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, FileNotFoundException{
		response.setContentType("application/rar");
		ServletContext ctx = getServletContext();
		InputStream is = ctx.getResourceAsStream("/myCode.rar");
		int read = 0;
		byte[] bytes = new byte[1024];
		OutputStream os = response.getOutputStream();
		while ((read = is.read(bytes)) != -1) {
		os.write(bytes, 0, read);
	}
	os.flush();
	os.close(); 
	}
}