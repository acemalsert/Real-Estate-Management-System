/*
 * Authors: Ahmet Cemal Sert - Talip Sina Postacı - Bensu Şeker
 * Title:CMPE232 Project
 * Group No: 3
 * */

import java.util.Scanner;

public class RealEstateDriver {


    public static void main(String[] args) {

        String customer_operations = "1- List houses for rent  \n" +
                "2- List houses for sale \n";

        String seller_operations = "1- Add new house to database \n" +
                "2- List houses for rent  \n" +
                "3- List houses for sale \n";


        String admin_customer_seller_operations = "1- Add new customer to the database \n" +
                "2- Add new seller to the database \n" +
                "3- Update selling price \n" +
                "4- Delete house";

        Scanner scan = new Scanner(System.in);
        DbConnection real_Estate = new DbConnection();
        LoginRegisterOp op = new LoginRegisterOp();
        System.out.println();

        System.out.println("---------Welcome to the Real Estate Database---------");
        System.out.println();

        while (true) {
            System.out.println("Are you a customer or seller. Enter 1 for customer and 2 for seller and 3 for admin operations(Any other number for exit): ");
            String flag = scan.nextLine();

            op.login(Integer.parseInt(flag));

            // customer
            if (flag.equals("1")) {

                while (true) {
                    System.out.println("Welcome to the customer interface of our database. Here is the operations you can perform: \n");
                    System.out.println(customer_operations + "\n");
                    System.out.println("Enter the operation you want (Any other input for exit): ");
                    String input = scan.nextLine();
                    if (input.equals("1")) {

                        real_Estate.listRentHouses();
                        continue;

                    } else if (input.equals("2")) {
                        real_Estate.listHousesForSale();
                        continue;
                    } else {
                        System.out.println("Exitting from the customer menu...");
                        break;
                    }
                }
            }

            // seller
            else if (flag.equals("2")) {
                while (true) {
                    System.out.println("Welcome to the seller interface of our database. Here is the operations you can perform: \n");
                    System.out.println(seller_operations + "\n");
                    System.out.println("Enter the operation you want (Any other input for exit): ");
                    String input = scan.nextLine();
                    if (input.equals("1")) {

                        System.out.println("Enter the selling price:");
                        int selling_price = scan.nextInt();

                        System.out.println("Enter the rent price:");
                        int rent_price = scan.nextInt();

                        System.out.println("Enter the number of flats :");
                        int number_of_flats = scan.nextInt();


                        System.out.println("Enter the number of rooms:");
                        int number_of_rooms = scan.nextInt();


                        System.out.println("Enter if it is monhtly rental:");
                        boolean is_monthly_rental = scan.nextBoolean();

                        System.out.println("Enter if it is daily rental:");
                        boolean is_daily_rental = scan.nextBoolean();

                        System.out.println("Enter if it is for sale or not:");
                        boolean is_for_sale = scan.nextBoolean();

                        System.out.println("Enter if it is sold or not:");
                        boolean is_sold = scan.nextBoolean();

                        System.out.println("Enter if it is villa or not:");
                        boolean is_villa = scan.nextBoolean();

                        System.out.println("Enter if it is apartment or not:");
                        boolean is_apartment = scan.nextBoolean();

                        System.out.println("Enter if it is for rent or not:");
                        boolean is_rent = scan.nextBoolean();

                        System.out.println("Enter if owner accepts pet:");
                        boolean is_pet_accept = scan.nextBoolean();


                        House house = new House(selling_price, rent_price, number_of_flats, number_of_rooms, is_monthly_rental, is_daily_rental, is_for_sale, is_sold, is_villa, is_apartment, is_rent, is_pet_accept);
                        real_Estate.addHouse(house);
                        continue;

                    } else if (input.equals("2")) {
                        real_Estate.listRentHouses();

                    } else if (input.equals("3")) {
                        real_Estate.listHousesForSale();
                        continue;
                    } else {
                        System.out.println("Exitting from the seller menu...");
                        break;
                    }
                }
            }

            // Admin
            else if (flag.equals("3")) {
                while (true) {
                    System.out.println("Welcome to the admin interface of our database. Here is the operations you can perform: \n");
                    System.out.println(admin_customer_seller_operations + "\n");
                    System.out.println("Enter the operation you want (Any other input for exit): ");
                    String input = scan.nextLine();
                    if (input.equals("1")) {

                        System.out.println("Enter the first name of the customer:");
                        String first_name = scan.nextLine();

                        System.out.println("Enter the last name of the customer:");
                        String last_name = scan.nextLine();

                        System.out.println("Enter the e-mail of the customer:");
                        String e_mail = scan.nextLine();

                        System.out.println("Enter the phone number of the customer:");
                        String phone_number = scan.nextLine();

                        System.out.println("Enter the SSN of the customer:");
                        String SSN = scan.nextLine();

                        System.out.println("Enter the monthly income of the customer:");
                        int monthly_income = scan.nextInt();

                        System.out.println("Enter the monthly income of the customer:");
                        String gender = scan.nextLine();

                        Customer customer = new Customer(first_name, last_name, e_mail, phone_number, SSN, monthly_income, gender);
                        real_Estate.addCustomer(customer);

                        System.out.println("New customer added to the database successfully...");



                    } else if (input.equals("2")) {

                        System.out.println("Enter the first name of the customer:");
                        String first_name = scan.nextLine();

                        System.out.println("Enter the last name of the customer:");
                        String last_name = scan.nextLine();

                        System.out.println("Enter the e-mail of the customer:");
                        String e_mail = scan.nextLine();

                        System.out.println("Enter the phone number of the customer:");
                        String phone_number = scan.nextLine();

                        System.out.println("Enter the SSN of the customer:");
                        String SSN = scan.nextLine();

                        System.out.println("Enter the monthly income of the customer:");
                        String gender = scan.nextLine();

                        Seller seller = new Seller(first_name, last_name, e_mail, phone_number, SSN, gender);
                        real_Estate.addSeller(seller);
                        System.out.println("New seller added to the database successfully...");
                        continue;
                    } else if (input.equals("3")) {
                        System.out.println("Enter the the ID of the house: ");
                        int ID = scan.nextInt();

                        System.out.println("Enter the selling price of the house: ");
                        int selling_price = scan.nextInt();

                        real_Estate.updateSellingHouse(ID, selling_price);
                    } else if (input.equals("4")) {
                        System.out.println("Enter the house ID to delete: ");
                        int ID = scan.nextInt();
                        real_Estate.deleteHouse(ID);
                    } else {
                        System.out.println("Exitting from the admin menu...");
                        break;
                    }
                }
            } else {
                System.out.println("Goodbye...");
                break;
            }

        }
    }
}
