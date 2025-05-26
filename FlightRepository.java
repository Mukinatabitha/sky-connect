import java.sql.*;
import java.sql.Date;
import java.time.LocalDate;
import java.util.*;

public class FlightRepository {
    private final Connection conn;

    public FlightRepository(Connection conn) {
        this.conn = conn;
    }

    public List<Flight> filterFlights(String origin, String destination, LocalDate date,
                                      Double maxPrice, Boolean isDirect,
                                      String flightClass, int passengers) throws SQLException {
        String sql = """
            SELECT * FROM flights
            WHERE (? IS NULL OR origin = ?)
              AND (? IS NULL OR destination = ?)
              AND (? IS NULL OR departure_date = ?)
              AND (? IS NULL OR price <= ?)
              AND (? IS NULL OR is_direct = ?)
        """;

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, origin);      stmt.setString(2, origin);
            stmt.setString(3, destination); stmt.setString(4, destination);
            if (date != null) {
                stmt.setDate(5, Date.valueOf(date));
                stmt.setDate(6, Date.valueOf(date));
            } else {
                stmt.setNull(5, Types.DATE);
                stmt.setNull(6, Types.DATE);
            }
            if (maxPrice != null) {
                stmt.setDouble(7, maxPrice);
                stmt.setDouble(8, maxPrice);
            } else {
                stmt.setNull(7, Types.DOUBLE);
                stmt.setNull(8, Types.DOUBLE);
            }
            if (isDirect != null) {
                stmt.setBoolean(9, isDirect);
                stmt.setBoolean(10, isDirect);
            } else {
                stmt.setNull(9, Types.BOOLEAN);
                stmt.setNull(10, Types.BOOLEAN);
            }

            ResultSet rs = stmt.executeQuery();
            List<Flight> flights = new ArrayList<>();
            while (rs.next()) {
                Flight flight = new Flight(
                        rs.getInt("flight_id"),
                        rs.getString("origin"),
                        rs.getString("destination"),
                        rs.getDate("departure_date").toLocalDate(),
                        rs.getDouble("price"),
                        rs.getBoolean("is_direct"),
                        rs.getInt("available_seats_economy"),
                        rs.getInt("available_seats_business"),
                        rs.getInt("available_seats_first")
                );
                if (flight.getAvailableSeats(flightClass) >= passengers) {
                    flights.add(flight);
                }
            }
            return flights;
        }
    }
}

