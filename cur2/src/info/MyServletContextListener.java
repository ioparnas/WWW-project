package info;
import javax.servlet.*;

public class MyServletContextListener implements ServletContextListener {
public void contextInitialized(ServletContextEvent event) {
ServletContext sc = event.getServletContext();
String infolink = sc.getInitParameter("info");
sc.setAttribute("Link", infolink);
}
public void contextDestroyed(ServletContextEvent event) {
}
}