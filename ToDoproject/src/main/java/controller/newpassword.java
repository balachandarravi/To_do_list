package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;

@WebServlet("/newPassword")
public class newpassword extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		HttpSession session = req.getSession();
		String newPassword = req.getParameter("password");
		String confPassword = req.getParameter("confPassword");
	
		if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
			Dao dao= new Dao();
			try {		
				Connection con=Dao.getConnection();
				PreparedStatement pst = con.prepareStatement("update user set userpassword = ? where useremail = ? ");
				pst.setString(1, newPassword);
				pst.setString(2, (String) session.getAttribute("email"));

				int rowCount = pst.executeUpdate();
				if (rowCount > 0) {
					req.setAttribute("status", "resetSuccess");
					req.getRequestDispatcher("login.jsp").forward(req, resp);
				} else {
					req.setAttribute("status", "resetFailed");
				    req.getRequestDispatcher("login.jsp").forward(req, resp);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
		
		
	}


