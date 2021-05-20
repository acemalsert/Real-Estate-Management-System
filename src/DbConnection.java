/*
* Authors: Ahmet Cemal Sert - Talip Sina Postacı - Bensu Şeker
* Title:CMPE232 Project
* Group No: 3
* */

import java.sql.*;
import java.util.Scanner;

public class DbConnection {
    private final String host = "host";
    private final String username = "username";
    private final String db_name = "groupname";
    private final String password = "password";
    private final int port =5432;

    private Connection con = null;

    private PreparedStatement statement;

    DbConnection(){
        String url = "jdbc:postgresql://"+host+":"+port+"/"+db_name;

        try{
            con = DriverManager.getConnection(url,username,password);
            System.out.println("Connection successful!");
        }catch (SQLException e){
            System.out.println("Connection Failed!");
        }

    }
    public void addCustomer(Customer customer){
        String query = "insert into customer(first_name,last_name,phone_number,ssn,email,monthly_income,gender) values(?,?,?,?,?,?,?)";

        try {
            statement = con.prepareStatement(query);
            statement.setString(1,customer.getFirstName());
            statement.setString(2,customer.getLastName());
            statement.setString(3,customer.getPhoneNumber());
            statement.setString(4,customer.getSSN());
            statement.setString(5,customer.getEmail());
            statement.setInt(6,customer.getMonthly_income());
            statement.setString(7,customer.getGender());
            statement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    public void addHouse(House house){
        String query = "insert into house(selling_price,rent_price,number_of_flats,number_of_rooms,is_monhtly_rental,is_daily_rental,for_sale,is_Sold,is_villa,is_apartment,is_rent,pet_accept) values(?,?,?,?,?,?,?,?,?,?,?,?)";

        try {
            statement = con.prepareStatement(query);
            statement.setInt(1,house.getSelling_price());
            statement.setInt(2,house.getRent_price());
            statement.setInt(3,house.getNumberOfFlats());
            statement.setInt(4,house.getNumberOfRooms());
            statement.setBoolean(5,house.isMonthlyRental());
            statement.setBoolean(6,house.isDailyRental());
            statement.setBoolean(7,house.isForSale());
            statement.setBoolean(8,house.isSold());
            statement.setBoolean(9,house.isVilla());
            statement.setBoolean(10,house.isApartment());
            statement.setBoolean(11,house.isRent());
            statement.setBoolean(12,house.isPetAccept());
            statement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    public void addSeller(Seller seller){
        String query = "insert into seller(first_name,last_name,phone_number,ssn,email,gender) values(?,?,?,?,?,?,)";

        try {
            statement = con.prepareStatement(query);
            statement.setString(1,seller.getFirstName());
            statement.setString(2,seller.getLastName());
            statement.setString(3,seller.getPhoneNumber());
            statement.setString(4,seller.getSSN());
            statement.setString(5,seller.getEmail());
            statement.setString(6,seller.getGender());
            statement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void listRentHouses(){

        String query = "select * from house where is_monhtly_rental = ? or is_daily_rental = ?";

        try {
            statement = con.prepareStatement(query);
            statement.setBoolean(1,true);
            statement.setBoolean(2,true);
            ResultSet set = statement.executeQuery();
            System.out.println("List of Rentable Houses: ");
            while (set.next()){
                int id = set.getInt("house_id");
                int rent_price = set.getInt("rent_price");
                int noOfFlats = set.getInt("number_of_flats");
                int noOfrooms = set.getInt("number_of_rooms");
                boolean petAccept = set.getBoolean("pet_accept");
                System.out.println("House id:"+id +"\tRent Price:"+ rent_price +"\tNumber of Flats:"+ noOfFlats +"\tNumber of Rooms:" + noOfrooms + "\tPet Accept:"+petAccept);

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }


    public void listHousesForSale(){

        String query = "select * from house where for_sale = ?";

        try {
            statement = con.prepareStatement(query);
            statement.setBoolean(1,true);
            ResultSet set = statement.executeQuery();
            System.out.println("List of Houses For Sale: ");
            while (set.next()){
                int id = set.getInt("house_id");
                int selling_price = set.getInt("selling_price");
                int noOfFlats = set.getInt("number_of_flats");
                int noOfrooms = set.getInt("number_of_rooms");
                boolean petAccept = set.getBoolean("pet_accept");
                System.out.println("House id:"+id +"\tSelling Price:"+ selling_price +"\t\tNumber of Flats:"+ noOfFlats +"\tNumber of Rooms:" + noOfrooms + "\tPet Accept:"+petAccept);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    public void updateSellingHouse(int house_id, int selling_price) {


        String query = "UPDATE House set selling_price = ? where house_id =?";
        String query2 = "Select * from house where house_id = ?";


        try {
            statement = con.prepareStatement(query);
            statement.setInt(1,selling_price);
            statement.setInt(2, house_id);
            statement.executeUpdate();
            statement = con.prepareStatement(query2);
            statement.setInt(1, house_id);
            ResultSet set = statement.executeQuery();

            while(set.next()){
                house_id = set.getInt("house_id");
                System.out.println("The house with the house id:"+ house_id +" is updated successfully");
            }



        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void deleteHouse(int house_id){
        String query1 = "delete from sale as sa where sa.house_id = ?";
        String query2 = "delete from rent as sa where sa.house_id = ?";
        String query3 = "delete from house_adress as ha where ha.house_id = ?";
        String query4  = "delete from house as h where h.house_id = ?";


        try {
            statement = con.prepareStatement(query1);
            statement.setInt(1, house_id);
            statement.executeUpdate();

            statement = con.prepareStatement(query2);
            statement.setInt(1, house_id);
            statement.executeUpdate();

            statement = con.prepareStatement(query3);
            statement.setInt(1, house_id);
            statement.executeUpdate();

            statement = con.prepareStatement(query4);
            statement.setInt(1, house_id);
            statement.executeUpdate();


            System.out.println("ID with the house with the house id :"+ house_id +" is deleted successfully");

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


    }
        public boolean checkLogin(String email,String password,int flag){
        String query = null;
        if (flag ==1){
            query = "select * from customer where email = ? and login_password = ?";
        }
        else if(flag == 2){
            query = "select * from seller where email = ? and login_password = ?";
        }
        else if(flag ==3){
            return checkAdmin(email,password);

        }

        try {
            statement = con.prepareStatement(query);
            statement.setString(1,email);
            statement.setString(2,password);
            ResultSet set = statement.executeQuery();

            if (set.next()){
                return true;
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return false;
    }

    public boolean checkAdmin(String email, String password){
        String query = null;
        String admin_email = "acemal.sert@tedu.edu.tr";
        String admin_password = "abcde";

        query = "select * from customer where email = ? and login_password = ?";


        try {
            statement = con.prepareStatement(query);
            statement.setString(1,email);
            statement.setString(2,password);
            ResultSet set = statement.executeQuery();
            while (set.next()){
                if(set.getString("email").equals(admin_email)&& set.getString("login_password").equals(admin_password)){
                    return true;
                }
            }



        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return false;
    }

    public static void main(String[] args) {
        DbConnection con = new DbConnection();
    }
}

