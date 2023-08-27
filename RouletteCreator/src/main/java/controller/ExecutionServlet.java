package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ExecutionServlet")
public class ExecutionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rouletteName = request.getParameter("roulette_name");
		String[] itemName = request.getParameterValues("item_name[]");
		
		request.setAttribute("rouletteName", rouletteName);
		request.setAttribute("itemNames", itemName);
		
		RequestDispatcher rd = request.getRequestDispatcher("/execution.jsp");
		rd.forward(request, response);
	}

}
