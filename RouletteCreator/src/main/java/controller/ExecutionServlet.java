package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ExecutionServlet
 */
@WebServlet("/ExecutionServlet")
public class ExecutionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect(request.getContextPath()+"/execution.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String rouletteName = request.getParameter("roulette_name");
		String rouletteType = request.getParameter("roulette_type");
		String[] itemName = request.getParameterValues("item_name[]");
		String[] itemProbabilities = request.getParameterValues("item_probability[]");
		
		request.setAttribute("rouletteName", rouletteName);
		request.setAttribute("rouletteType", rouletteType);
		request.setAttribute("itemNames", itemName);
		request.setAttribute("itemProbabilities", itemProbabilities);
		
		RequestDispatcher rd = request.getRequestDispatcher("/execution.jsp");
		rd.forward(request, response);
	}

}
