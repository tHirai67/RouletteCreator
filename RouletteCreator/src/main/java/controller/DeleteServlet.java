package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rouletteId =  Integer.parseInt(request.getParameter("roulette_id"));
		
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
	        
	        String deleteRouletteQuery = "DELETE FROM roulettes WHERE id = ?";
	        PreparedStatement deleteRouletteStatement = connection.prepareStatement(deleteRouletteQuery);
	        deleteRouletteStatement.setInt(1, rouletteId);
	        deleteRouletteStatement.executeUpdate();
	        deleteRouletteStatement.close();
	        
	        connection.close();
		}catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
		response.sendRedirect(request.getContextPath()+"/");
	}

}
