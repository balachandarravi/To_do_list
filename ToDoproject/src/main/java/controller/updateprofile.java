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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.Dao;
import dto.Task;
import dto.User;

@WebServlet("/updateprofile")
@MultipartConfig(maxFileSize = 10*1024*1024)
public class updateprofile extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    int id = Integer.parseInt(req.getParameter("id"));
	    String name = req.getParameter("name");
	    String email = req.getParameter("email");
	    long contact = Long.parseLong(req.getParameter("contact"));
	    String password = req.getParameter("password");
	    Part imagePart = req.getPart("image");
	    
	    byte[] image;
	    if (imagePart != null && imagePart.getSize() > 0) {
	        // Process the new image file
	        image = imagePart.getInputStream().readAllBytes();
	    } else {
	        // No new image file uploaded, retain the existing image
	        HttpSession session = req.getSession();
	        User existingUser = (User) session.getAttribute("user");
	        image = existingUser.getUserimage();
	    }

	    User user = new User(id, name, email, contact, password, image);
	    Dao dao = new Dao();
	    try {
	        int res = dao.updateuser(user);
	        HttpSession session = req.getSession();
	        User updatedUser = (User) session.getAttribute("user");
	        updatedUser.setUsername(name);
	        updatedUser.setUseremail(email);
	        updatedUser.setUsercontact(contact);
	        updatedUser.setUserpassword(password);
	        updatedUser.setUserimage(image);
	        resp.sendRedirect("home.jsp");
	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace();
	        // Handle the exception
	    }   
}
}


