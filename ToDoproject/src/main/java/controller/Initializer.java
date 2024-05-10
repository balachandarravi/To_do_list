package controller;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class Initializer implements ServletContextListener {
	private Thread backgroundThread;
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		
		backgroundThread = new Thread(new schedular());
		backgroundThread.start();		
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
		 if (backgroundThread != null && backgroundThread.isAlive()) {
	            backgroundThread.interrupt(); // Request the background thread to stop
	        }
		
	}

}
