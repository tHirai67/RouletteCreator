package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CreateServlet")
public class CreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/create.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rouletteName = request.getParameter("roulette_name");
		String[] rouletteItems = request.getParameterValues("item_name[]");
		
		request.setAttribute("rouletteName", rouletteName);
		request.setAttribute("rouletteItemList", rouletteItems);
		
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
			
			// ルーレット情報の挿入
			String insertRouletteQuery = "INSERT INTO roulettes (roulette_name, date) VALUES (?, ?)";
            PreparedStatement rouletteStatement = connection.prepareStatement(insertRouletteQuery);
            rouletteStatement.setString(1, rouletteName);
            rouletteStatement.setDate(2, new java.sql.Date(new Date().getTime()));
            rouletteStatement.executeUpdate();
            rouletteStatement.close();
            
         // 直前に挿入したルーレットのIDを取得
            String lastInsertIdQuery = "SELECT LAST_INSERT_ID()";
            PreparedStatement idStatement = connection.prepareStatement(lastInsertIdQuery);
            ResultSet idResult = idStatement.executeQuery();
            int rouletteId = 0;
            if (idResult.next()) {
                rouletteId = idResult.getInt(1);
            }
            idResult.close();
            idStatement.close();

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
