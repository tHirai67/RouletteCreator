package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ExecutionServlet")
public class ExecutionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rouletteId =  Integer.parseInt(request.getParameter("roulette_id"));
		List<String> rouletteItemList = new ArrayList<>();
		String rouletteName = "";
		
		Properties properties = new Properties();
		try(InputStream is = getClass().getClassLoader().getResourceAsStream("database.properties")){
			properties.load(is);
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		try {
	        // MySQLへの接続
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection connection = DriverManager.getConnection(properties.getProperty("url"),properties.getProperty("username"),properties.getProperty("password"));
	        
	        //ルーレット名の取得
	        String getRouletteNameQuery = "SELECT roulette_name FROM roulettes WHERE id = ?";
	        PreparedStatement rouletteNameStatement = connection.prepareStatement(getRouletteNameQuery);
	        rouletteNameStatement.setInt(1, rouletteId);
	        ResultSet resultSetName = rouletteNameStatement.executeQuery();
	        if (resultSetName.next()) {
	            rouletteName = resultSetName.getString("roulette_name");
	        }
	        
	        resultSetName.close();
	        rouletteNameStatement.close();
	        
	        // ルーレット項目名を取得
	        String retrieveRouletteItemNameQuery = "SELECT item_name FROM roulette_items WHERE roulette_id = ?";
	        PreparedStatement rouletteItemNameStatement = connection.prepareStatement(retrieveRouletteItemNameQuery);
	        rouletteItemNameStatement.setInt(1, rouletteId);
	        ResultSet resultSet = rouletteItemNameStatement.executeQuery();
	        while (resultSet.next()) {
	            String itemName = resultSet.getString("item_name");
	            rouletteItemList.add(itemName);
	        }
	        
	        resultSet.close();
	        rouletteItemNameStatement.close();
	        connection.close();

	        
	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace();
	    }

		request.setAttribute("rouletteName", rouletteName);
		String[] rouletteItemArray = rouletteItemList.toArray(new String[0]);
        request.setAttribute("rouletteItemList", rouletteItemArray);
        request.setAttribute("rouletteId", rouletteId);
        
        // execution.jspへフォワード
        request.getRequestDispatcher("/execution.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rouletteName = request.getParameter("roulette_name");
		String[] itemName = request.getParameterValues("item_name[]");
		
		request.setAttribute("rouletteName", rouletteName);
		request.setAttribute("rouletteItemList", itemName);
		
		RequestDispatcher rd = request.getRequestDispatcher("/execution.jsp");
		rd.forward(request, response);
	}

}
