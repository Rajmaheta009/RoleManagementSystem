package util;

import java.util.regex.Pattern;

public class Validation {

    // Full Name Validation
    public static boolean isValidName(String name) {

        return name != null
                && name.matches("[A-Za-z ]{3,50}");

    }

    // Email Validation
    public static boolean isValidEmail(String email) {

        String regex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";

        return Pattern.matches(regex, email);

    }

    // Phone Validation
    public static boolean isValidPhone(String phone) {

        return phone.matches("[0-9]{10}");

    }

    // Password Validation
    public static boolean isValidPassword(String password) {

        return password.length() >= 6;

    }

}