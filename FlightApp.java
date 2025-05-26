import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

public class FlightApp {
    public static void main(String[] args) {
        try (Connection conn = DatabaseConnection.getConnection()) {
            FlightRepository repo = new FlightRepository(conn);

            List<Flight> results = repo.filterFlights(
                    "Nairobi",            // origin
                    "Cairo",              // destination
                    LocalDate.of(2025, 6, 10), // date
                    300.0,                // max budget
                    true,                 // direct flights only
                    "economy",            // flight class
                    2                     // number of passengers
            );

            if (results.isEmpty()) {
                System.out.println("No flights found.");
            } else {
                results.forEach(System.out::println);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

