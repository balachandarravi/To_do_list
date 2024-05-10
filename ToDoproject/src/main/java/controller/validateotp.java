package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ValidateOtp")
public class validateotp extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		int value=Integer.parseInt(req.getParameter("otp").replaceAll("\\s",""));
		HttpSession session=req.getSession();
		int otp=(int)session.getAttribute("otp");

		if (value==otp) 
		{			
				req.setAttribute("email", req.getParameter("email"));
				req.setAttribute("status", "success");
			  req.getRequestDispatcher("newPassword.jsp").forward(req, resp);			
		}
		else
		{
			req.setAttribute("message","wrong otp");
			
		   req.getRequestDispatcher("EnterOtp.jsp").forward(req, resp);;
				
		}		
	}		
}


