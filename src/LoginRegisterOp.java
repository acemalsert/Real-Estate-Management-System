/*
 * Authors: Ahmet Cemal Sert - Talip Sina Postacı - Bensu Şeker
 * Title:CMPE232 Project
 * Group No: 3
 * */

import java.util.Scanner;

public class LoginRegisterOp {

    private final DbConnection db = new DbConnection();

    public boolean login(int flag){
        Scanner sc = new Scanner(System.in);
        if (flag == 1){
            String email,password;
            System.out.println("Enter email: ");
            email = sc.nextLine();
            System.out.println("Enter Password: ");
            password = sc.nextLine();
            if ((checkEmpty(email,password))){
                if (db.checkLogin(email,password,flag)){
                    return true;
                }
            }
        }
        else if(flag == 2){
            String email,password;
            System.out.println("Enter email: ");
            email = sc.nextLine();
            System.out.println("Enter Password: ");
            password = sc.nextLine();
            if ((checkEmpty(email,password))){
                if (db.checkLogin(email,password,flag)){
                    return true;
                }
            }
        }

        else if(flag == 3){
            String email,password;
            System.out.println("Enter email: ");
            email = sc.nextLine();
            System.out.println("Enter Password: ");
            password = sc.nextLine();
            if ((checkEmpty(email,password))){
                if (db.checkLogin(email,password,flag)){
                    return true;
                }
            }
        }

        return false;
    }

    private boolean checkEmpty(String email,String password){

        if (email.isEmpty()){
            System.out.println("Email cannot be null!");
            return false;
        }
        if (password.isEmpty()){
            System.out.println("Password cannot be null!");
            return false;
        }
        return true;
    }
}
