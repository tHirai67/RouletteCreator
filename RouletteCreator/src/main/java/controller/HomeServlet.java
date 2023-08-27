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
import model.Roulette;

@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Roulette> rouletteInfoList = new ArrayList<>();
		
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
			
			//ルーレット情報を取得
			String retrieveRouletteQuery = "SELECT id, roulette_name, date FROM roulettes";
            PreparedStatement rouletteStatement = connection.prepareStatement(retrieveRouletteQuery);
            ResultSet resultSet = rouletteStatement.executeQuery();
            
            while(resultSet.next()) {
            	int id = resultSet.getInt("id");
            	String rouletteName = resultSet.getString("roulette_name");
            	java.sql.Date date = resultSet.getDate("date");
            	Roulette rouletteInfo = new Roulette(id, rouletteName, date);
                rouletteInfoList.add(rouletteInfo);
            }
            resultSet.close();
            rouletteStatement.close();

            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
		
		request.setAttribute("rouletteInfoList", rouletteInfoList);
		RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
		rd.forward(request, response);
	}
}
