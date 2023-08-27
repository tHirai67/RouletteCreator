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

@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
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
        request.setAttribute("rouletteItemList", rouletteItemList);
        request.setAttribute("rouletteId", rouletteId);
        
        // edit.jspへフォワード
        request.getRequestDispatcher("/edit.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		int rouletteId =  Integer.parseInt(request.getParameter("roulette_id"));
		String rouletteName = request.getParameter("roulette_name");
		String[] rouletteItems = request.getParameterValues("item_name[]");
		
		
		request.setAttribute("rouletteName", rouletteName);
		request.setAttribute("itemNames", rouletteItems);
		
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
			
			//ルーレット名の更新
			String updateRouletteNameQuery = "UPDATE roulettes SET roulette_name = ? WHERE id = ?";
			PreparedStatement updateNameStatement = connection.prepareStatement(updateRouletteNameQuery);
			updateNameStatement.setString(1, rouletteName);
			updateNameStatement.setInt(2, rouletteId);
			updateNameStatement.executeUpdate();
			updateNameStatement.close();
			
			//ルーレット項目の削除
			String deleteRouletteItemsQuery = "DELETE FROM roulette_items WHERE roulette_id = ?";
			PreparedStatement deleteItemStatement = connection.prepareStatement(deleteRouletteItemsQuery);
			deleteItemStatement.setInt(1, rouletteId);
			deleteItemStatement.executeUpdate();
			deleteItemStatement.close();

            // ルーレット項目情報を挿入
            String insertItemQuery = "INSERT INTO roulette_items (roulette_id, item_name) VALUES (?, ?)";
            PreparedStatement itemStatement = connection.prepareStatement(insertItemQuery);
            for (String item : rouletteItems) {
                itemStatement.setInt(1, rouletteId);
                itemStatement.setString(2, item);
                itemStatement.executeUpdate();
            }
            itemStatement.close();

            connection.close();
		}catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/execution.jsp");
		rd.forward(request, response);
	}

}
