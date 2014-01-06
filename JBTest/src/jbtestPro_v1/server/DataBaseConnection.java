package jbtestPro_v1.server;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DataBaseConnection
{
   public void dbConnect(String db_connect_string,String db_userid,String db_password)
   {
      try {
         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
         Connection conn = DriverManager.getConnection(db_connect_string,
                  db_userid, db_password);
         System.out.println("connected");
         Statement statement = conn.createStatement();
         String queryString = "select * from sysobjects where type='u'";
         ResultSet rs = statement.executeQuery(queryString);
         while (rs.next()) {
            System.out.println(rs.getString(1));
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   public static void main(String[] args)
   {
      DataBaseConnection connServer = new DataBaseConnection();
      connServer.dbConnect("jdbc:sqlserver://212.150.144.16\\REGSRV;", "margarita",
               "Mb123456");
   }
}