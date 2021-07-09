import com.sun.jndi.ldap.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import java.sql.*;
import com.mysql.cj.jdbc.Driver;

public class MySQLAdsDao implements Ads {
    private Connection connection;

    public mySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(), config.getUser(), config.getPassword());
        } catch (SQLException error) {
            throw new RuntimeException("Error connecting to the database");
        }
    }


    @Override
    public List<Ad> all() {
        try {
            Statement stmt = connection.createStatement();
            String showAds = "SELECT * FROM ads";
            ResultSet rs = stmt.executeQuery(showAds);


            return createAdsFromResults(rs);

        } catch (SQLException error){
            throw new RuntimeException("Error retrieving all ads");
        }
    }

    @Override
    public Long insert(Ad ad) {
        try {
            Statement stmt = connection.createStatement();
            stmt.executeUpdate(createInsertQuery(ad), Statement.RETURN_GENERATED_KEYS);
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException error){
            throw new RuntimeException("Could not insert add successfully.");
        }
    }

    private String createInsertQuery(Ad ad){
        return "INSERT INTO ads (user_id, description) VALUES ("
                + "'" + ad.getUserId() + "',"
                + "'" + ad.getTitle() + "',"
                + "'" + ad.getDescription() + "'";
    }

    private Ad extractAd (ResultSet rs) throws SQLException{
        return new Ad(rs.getLong("id"),
                rs.getLong("user_id"),
                rs.getString("title"),
                rs.getString("description"));
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException{
        List<Ad> ads = new ArrayList<>();
        while (rs.next()){
            ads.add(extractAd(rs));
        }
        return ads;
    }



}
