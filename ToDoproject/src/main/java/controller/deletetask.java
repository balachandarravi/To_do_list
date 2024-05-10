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

@WebServlet("/deletetask")
public class deletetask extends HttpServlet {
	
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
{
	int taskid=Integer.parseInt(req.getParameter("taskid"));
	Dao dao=new Dao();
	try {
		    HttpSession session=req.getSession();
			User u=(User)session.getAttribute("user");
			if(u!=null)
			{
				Task dbtask=dao.findtaskById(taskid);
				if(dbtask.getUserid()==u.getUserid())
				{
					int res= dao.delete(taskid);
//					List<Task>tasks=dao.getalltask(u.getUserid());
//					req.setAttribute("tasks",tasks);
//					req.getRequestDispatcher("home.jsp").include(req, resp);		
					
					resp.sendRedirect("home.jsp");
				}				
			}
							
	} catch (ClassNotFoundException | SQLException e) {
		e.printStackTrace();
	}	
}
}

