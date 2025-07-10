import java.time.LocalDate;

public class Flight {
    private int id;
    private String origin;
    private String destination;
    private LocalDate departureDate;
    private double price;
    private boolean isDirect;
    private int seatsEconomy;
    private int seatsBusiness;
    private int seatsFirst;

    public Flight(int id, String origin, String destination, LocalDate date, double price,
                  boolean isDirect, int seatsEconomy, int seatsBusiness, int seatsFirst) {
        this.id = id;
        this.origin = origin;
        this.destination = destination;
        this.departureDate = date;
        this.price = price;
        this.isDirect = isDirect;
        this.seatsEconomy = seatsEconomy;
        this.seatsBusiness = seatsBusiness;
        this.seatsFirst = seatsFirst;
    }

    /**
     * Returns the number of available seats for the given flight class.
     *
     * @param flightClass the class of the flight (economy, business, or first)
     * @return the number of available seats
     */
    public int getAvailableSeats(String flightClass) {
        switch (flightClass.toLowerCase()) {
            case "economy":
                return seatsEconomy;
            case "business":
                return seatsBusiness;
            case "first":
                return seatsFirst;
            default:
                return 0;
        }
    }

    public double getPrice() { return price; }
    public LocalDate getDepartureDate() { return departureDate; }
    public boolean isDirect() { return isDirect; }
    public String getOrigin() { return origin; }
    public String getDestination() { return destination; }

    @Override
    public String toString() {
        return origin + " -> " + destination + " | " + departureDate + " | $" + price;
    }
}

