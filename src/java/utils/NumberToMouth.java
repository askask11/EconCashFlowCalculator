/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

/**
 *
 * @author jianqing
 */
public class NumberToMouth {

    
    

    public static String convertInt(int mouth) {
        switch (mouth % 12) {
            case 1:
                return "January";

            case 2:
                return "February";

            case 3:
                return "March";

            case 4:
                return "April";

            case 5:
                return "May";

            case 6:
                return "June";

            case 7:
                return "July";

            case 8:
                return "August";

            case 9:

                return "September";
            case 10:
                return "October";

            case 11:
                return "November";
            case 0:
                return "December";

            default:
                return "Unknown";

        }
    }

    public static void main(String[] args) {
//        System.out.println(convert("15"));
    }
}
