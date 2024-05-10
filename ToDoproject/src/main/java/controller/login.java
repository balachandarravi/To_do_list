package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import dto.Task;
import dto.User;

@WebServlet("/userlogin")
public class login extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		Dao dao = new Dao();
		
		try {
			List<String> emails=dao.fetchAllUserEmails();
			if(emails.contains(email)) {
			User u = dao.findByEmail(email);
			if(u!=null) 
			{				
				if(u.getUserpassword().equals(password)) 
				{
					HttpSession session=req.getSession();
    				session.setAttribute("user",u);
    				resp.sendRedirect("home.jsp");
				}else {	
					req.setAttribute("Email", email);
					req.setAttribute("message","incorrect password");
					req.getRequestDispatcher("login.jsp").include(req, resp);
				}
			}else {				
				req.getRequestDispatcher("login.jsp").forward(req, resp);
			}
			}
			else {
				req.setAttribute("messages","user doesn't exist");
				req.getRequestDispatcher("login.jsp").forward(req, resp);
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	}

