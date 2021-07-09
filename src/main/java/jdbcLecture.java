import com.mysql.jdbc.Driver;

import java.sql.*;

public class jdbcLecture {
    public static void main(String[] args) throws SQLException {
        Config config = new Config();

        //instantiate the MySQL driver to register to the built in Java driver manager
        DriverManager.registerDriver(new Driver());

        //connect to the database by providing the URL, user, and password of the user we want to connect as
        Connection connection = DriverManager.getConnection(config.getUrl(), config.getUser(), config.getPassword());

        //create a statement object to execute queries
        Statement stmt = connection.createStatement();

        //we can use the statement object to make our queries
        // execure method returns a boolean indicating success
//        stmt.execute("DELETE FROM albums WHERE id = 4");

        //executeUpdate: returns the number of rows affected
//        stmt.executeUpdate("INSERT INTO albums (artist, name, release_date, genre, sales) VALUES('Nelly Furtado', 'Loose', 2006, 'Dance-pop, hip hop, R&B', 12.5)");

        //returns a ResultSet objec.
        //use to iterate through results
//        stmt.executeQuery("SELECT * FROM albums");

        //handling the results with the resulset object
        String selectQuery = "SELECT * FROM albums";
        ResultSet rs = stmt.executeQuery(selectQuery);

        //by calliing the next() method we can iterate over the rows
        //the method will return as true as long as there are rows left in our results
        //therefore, the most common way to handle the results is to use while loop

        while (rs.next()){
            //do something with each row
            System.out.println("Here's an album: ");
            System.out.println("  id:" + rs.getLong("id"));
            System.out.println("  artist:" + rs.getString("artist"));
            System.out.println("  name:" + rs.getString("name"));
        }

        //INSERT query
        String inserQuery = "INSERT INTO albums (artist, name, release_date, genre, sales) VALUES('Nelly Furtado', 'Loose', 2006, 'Dance-pop, hip hop, R&B', 12.5)";

        //for executeUpdate method, we can have two arguments
        //First is the Query String we want executed
        //Second is a constant from the statement object
        //this gives us access to the ID's that are automatically generated by the database

        stmt.executeUpdate(inserQuery, Statement.RETURN_GENERATED_KEYS);

        //we xan use getGenerateKeys Method
        ResultSet rsKeys = stmt.getGeneratedKeys();

        if (rsKeys.next()){
            System.out.println("Inserted a new record! New ID: " + rsKeys.getLong(1));
        }

    }
}
