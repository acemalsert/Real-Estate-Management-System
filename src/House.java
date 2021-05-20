/*
 * Authors: Ahmet Cemal Sert - Talip Sina Postacı - Bensu Şeker
 * Title:CMPE232 Project
 * Group No: 3
 * */

public class House {

    private int house_id;
    private int selling_price;
    private int rent_price;
    private int numberOfFlats;
    private int numberOfRooms;
    private boolean isDailyRental;
    private boolean isMonthlyRental;
    private boolean isApartment;
    private boolean isVilla;
    private boolean forSale;
    private boolean isSold;
    private boolean isRent;
    private boolean petAccept;

    public House(int selling_price, int rent_price, int numberOfFlats, int numberOfRooms, boolean isDailyRental, boolean isMonthlyRental, boolean isApartment, boolean isVilla, boolean forSale, boolean isSold, boolean isRent, boolean petAccept) {
        this.selling_price = selling_price;
        this.rent_price = rent_price;
        this.numberOfFlats = numberOfFlats;
        this.numberOfRooms = numberOfRooms;
        this.isDailyRental = isDailyRental;
        this.isMonthlyRental = isMonthlyRental;
        this.isApartment = isApartment;
        this.isVilla = isVilla;
        this.forSale = forSale;
        this.isSold = isSold;
        this.isRent = isRent;
        this.petAccept = petAccept;
    }

    @Override
    public String toString() {
        return "House{" +
                "house_id=" + house_id +
                ", selling_price=" + selling_price +
                ", rent_price=" + rent_price +
                ", numberOfFlats=" + numberOfFlats +
                ", numberOfRooms=" + numberOfRooms +
                ", isDailyRental=" + isDailyRental +
                ", isMonthlyRental=" + isMonthlyRental +
                ", isApartment=" + isApartment +
                ", isVilla=" + isVilla +
                ", forSale=" + forSale +
                ", isSold=" + isSold +
                ", isRent=" + isRent +
                ", petAccept=" + petAccept +
                '}';
    }

    public House(int selling_price) {
        this.selling_price = selling_price;
    }

    public int getHouse_id() {
        return house_id;
    }

    public void setHouse_id(int house_id) {
        this.house_id = house_id;
    }

    public int getSelling_price() {
        return selling_price;
    }

    public void setSelling_price(int selling_price) {
        this.selling_price = selling_price;
    }

    public int getRent_price() {
        return rent_price;
    }

    public void setRent_price(int rent_price) {
        this.rent_price = rent_price;
    }

    public int getNumberOfFlats() {
        return numberOfFlats;
    }

    public void setNumberOfFlats(int numberOfFlats) {
        this.numberOfFlats = numberOfFlats;
    }

    public int getNumberOfRooms() {
        return numberOfRooms;
    }

    public void setNumberOfRooms(int numberOfRooms) {
        this.numberOfRooms = numberOfRooms;
    }

    public boolean isDailyRental() {
        return isDailyRental;
    }

    public void setDailyRental(boolean dailyRental) {
        isDailyRental = dailyRental;
    }

    public boolean isMonthlyRental() {
        return isMonthlyRental;
    }

    public void setMonthlyRental(boolean monthlyRental) {
        isMonthlyRental = monthlyRental;
    }

    public boolean isApartment() {
        return isApartment;
    }

    public void setApartment(boolean apartment) {
        isApartment = apartment;
    }

    public boolean isVilla() {
        return isVilla;
    }

    public void setVilla(boolean villa) {
        isVilla = villa;
    }

    public boolean isForSale() {
        return forSale;
    }

    public void setForSale(boolean forSale) {
        this.forSale = forSale;
    }

    public boolean isSold() {
        return isSold;
    }

    public void setSold(boolean sold) {
        isSold = sold;
    }

    public boolean isRent() {
        return isRent;
    }

    public void setRent(boolean rent) {
        isRent = rent;
    }

    public boolean isPetAccept() {
        return petAccept;
    }

    public void setPetAccept(boolean petAccept) {
        this.petAccept = petAccept;
    }
}
