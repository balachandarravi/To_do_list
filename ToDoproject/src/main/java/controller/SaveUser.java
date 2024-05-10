package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.Dao;
import dto.User;
@WebServlet("/saveuser")
@MultipartConfig(maxFileSize = 10*1024*1024)
public class SaveUser extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		long contact = Long.parseLong(req.getParameter("contact"));
		String password = req.getParameter("password");
		
		Part imagePart = req.getPart("image"); // storing image file in part object
		byte[] imagebytes = imagePart.getInputStream().readAllBytes();//converting part object into byte[]

		//initializing or setting values to variables in java beans	through constructor	
		User user=new User(id, name, email, contact, password, imagebytes);
		
		Dao dao = new Dao();// creating a object for dao class and invoke method 
		
		try {
			List<String> emails=dao.fetchAllUserEmails();
			if(emails.contains(email)) {
				req.setAttribute("messages","user already exist");
				req.getRequestDispatcher("signup.jsp").forward(req, resp);
			}
			else
			{
				int res = dao.saveUser(user);
				if(res>0) {
					resp.sendRedirect("login.jsp");
					
				}else {
					resp.sendRedirect("signup.jsp");
					resp.getWriter().print("signup unsuccessfull");
				}
			}
			}
			
			catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
			
		
	