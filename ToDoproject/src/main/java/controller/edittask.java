package controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import dto.Task;
import dto.User;
@WebServlet("/edittask")
public class edittask extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int taskid= Integer.parseInt(req.getParameter("taskid"));
		String tasktitle =req.getParameter("tasktitle");
		String taskdescription =req.getParameter("taskdescription");
		String taskpriority =req.getParameter("taskpriority");
		String taskduedate =req.getParameter("taskduedate");
		String taskstatus =req.getParameter("taskstatus");
		
		
		Task task= new Task(taskid, tasktitle, taskdescription,taskpriority,taskduedate,taskstatus);
		
		Dao dao= new Dao();
		
		try {
			int res=dao.edittask(task);
					if (res>0)
			{
			Map<Integer, String> updatedPriorities = dao.updatePriorityBasedOnDuration();
			HttpSession session=req.getSession();
			 User user=(User)req.getSession().getAttribute("user");
	        List<Task> tas = (List)dao.getalltask(user.getUserid()); ;
	        for (Task tasks : tas) {
	            if (updatedPriorities.containsKey(tasks.getTaskid())) {
	                task.setTaskpriority(updatedPriorities.get(tasks.getTaskid()));
	            }
	        }  
			 				
				resp.sendRedirect("home.jsp");
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
			resp.getWriter().print("something went problem"+e.getMessage());
		}
	}
}

