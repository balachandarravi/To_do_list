package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import dto.User;

@WebServlet("/updateprofileolddata")
public class updateprofileolddata extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String email=req.getParameter("useremail");
		Dao dao=new Dao();		
		
		try {
			User res = dao.findByEmail(email);
			HttpSession session=req.getSession();

			session.setAttribute("user",res);
			
			 req.setAttribute("userData", res); // Setting res as an attribute
		     req.getRequestDispatcher("updateprofile.jsp").forward(req, resp);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}			
	}
}
