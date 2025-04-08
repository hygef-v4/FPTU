package controller.utility;

import jakarta.servlet.http.HttpServletRequest;

/**
 *
 * @author hungs
 */
public class Validation {

    /**
     * Validate password based on common rules (without special character
     * requirement): - Not null or empty - Length between 8 and 20 characters -
     * Contains at least one digit, one lowercase letter, and one uppercase
     * letter - No whitespace allowed
     *
     * @param request the HttpServletRequest to set error attribute
     * @param password the password to validate
     * @param errorAttributeName the name of the request attribute to set error
     * messages
     * @return true if valid, false otherwise
     */
    public static boolean validatePassword(HttpServletRequest request, String password, String errorAttributeName) {
        if (password == null || password.trim().isEmpty()) {
            request.setAttribute(errorAttributeName, "Mật khẩu không được để trống.");
            return false;
        }
        if (password.length() < 8) {
            request.setAttribute(errorAttributeName, "Mật khẩu phải có ít nhất 8 ký tự.");
            return false;
        }
        if (password.length() > 20) {
            request.setAttribute(errorAttributeName, "Mật khẩu không được vượt quá 20 ký tự.");
            return false;
        }
        // Regular expression checks:
        // - At least one digit (?=.*[0-9])
        // - At least one lowercase letter (?=.*[a-z])
        // - At least one uppercase letter (?=.*[A-Z])
        // - No whitespace allowed (?=\S+$)
        // - Overall length between 8 and 20 characters (.{8,20})
        if (!password.matches("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\\S+$).{8,20}$")) {
            request.setAttribute(errorAttributeName, "Mật khẩu phải chứa ít nhất một chữ số, một chữ thường, một chữ hoa và không chứa khoảng trắng.");
            return false;
        }
        return true;
    }

    /**
     * Validate username based on common rules: - Not null or empty - Length
     * between 5 and 15 characters (customizable) - Contains only alphanumeric
     * characters and underscores
     *
     * @param request the HttpServletRequest to set error attribute
     * @param username the username to validate
     * @param errorAttributeName the name of the request attribute to set error
     * messages
     * @return true if valid, false otherwise
     */
    public static boolean validateUsername(HttpServletRequest request, String username, String errorAttributeName) {
        if (username == null || username.trim().isEmpty()) {
            request.setAttribute(errorAttributeName, "Username không được để trống.");
            return false;
        }
        // Remove leading and trailing spaces for length check
        username = username.trim();

        if (username.length() < 5) {
            request.setAttribute(errorAttributeName, "Username phải có ít nhất 5 ký tự.");
            return false;
        }
        if (username.length() > 15) {
            request.setAttribute(errorAttributeName, "Username không được vượt quá 15 ký tự.");
            return false;
        }
        // Check that username contains only letters, numbers, and underscores
        if (!username.matches("^[a-zA-Z0-9_]+$")) {
            request.setAttribute(errorAttributeName, "Username chỉ chứa chữ cái, số và dấu gạch dưới.");
            return false;
        }
        return true;
    }

    /**
     * Validate username for login: - Must not be null or empty.
     *
     * @param request the HttpServletRequest to set error attribute
     * @param username the username to validate
     * @param errorAttributeName the name of the request attribute to set error
     * messages
     * @return true if valid, false otherwise
     */
    public static boolean validateUsernameForLogin(HttpServletRequest request, String username, String errorAttributeName) {
        if (username == null || username.trim().isEmpty()) {
            request.setAttribute(errorAttributeName, "Username không được để trống.");
            return false;
        }
        // Optionally trim the username for consistency.
        return true;
    }

    /**
     * Validate full name: - Must not be null or empty. - Length must be between
     * 2 and 50 characters. - Should contain only letters and spaces.
     *
     * @param request the HttpServletRequest to set error attribute
     * @param fullname the full name to validate
     * @param errorAttributeName the name of the request attribute to set error
     * messages
     * @return true if valid, false otherwise
     */
    public static boolean validateFullname(HttpServletRequest request, String fullname, String errorAttributeName) {
        int min = 5;

        if (fullname == null || fullname.trim().isEmpty()) {
            request.setAttribute(errorAttributeName, "Họ và tên không được để trống.");
            return false;
        }

        fullname = fullname.trim();

        if (fullname.length() < min) {
            request.setAttribute(errorAttributeName, "Họ và tên phải có ít nhất " + min + " ký tự.");
            return false;
        }

        if (fullname.length() > 50) {
            request.setAttribute(errorAttributeName, "Họ và tên không được vượt quá 50 ký tự.");
            return false;
        }

        // Using Unicode letter property to allow accented characters and spaces.
        if (!fullname.matches("^[\\p{L} ]+$")) {
            request.setAttribute(errorAttributeName, "Họ và tên chỉ chứa chữ cái và khoảng trắng.");
            return false;
        }

        return true;
    }

    /**
     * Validate Vietnamese phone number: - Must not be null or empty. - Should
     * match Vietnamese phone number format.
     *
     * Valid formats include: 0xxxxxxxxx (10 digits, starting with 0)
     * +84xxxxxxxx (country code +84 followed by 9 digits)
     *
     * @param request the HttpServletRequest to set error attribute
     * @param phone the phone number to validate
     * @param errorAttributeName the name of the request attribute to set error
     * messages
     * @return true if valid, false otherwise
     */
    public static boolean validatePhoneNumber(HttpServletRequest request, String phone, String errorAttributeName) {
        if (phone == null || phone.trim().isEmpty()) {
            request.setAttribute(errorAttributeName, "Số điện thoại không được để trống.");
            return false;
        }

        phone = phone.trim();

        // Regex explanation:
        // ^                 : Start of the string
        // (0|\+84)         : Must start with a "0" or "+84"
        // [35789]          : Next digit must be one of 3, 5, 7, 8, or 9
        // \\d{8}           : Followed by exactly 8 digits
        // $                 : End of the string
        //
        // For example, valid numbers: 0912345678, +84912345678
        if (!phone.matches("^(0|\\+84)[35789]\\d{8}$")) {
            request.setAttribute(errorAttributeName, "Số điện thoại không hợp lệ.");
            return false;
        }

        return true;
    }

    /**
     * Validate email address: - Must not be null or empty. - Must match a
     * standard email pattern.
     *
     * @param request the HttpServletRequest to set error attribute
     * @param email the email address to validate
     * @param errorAttributeName the name of the request attribute to set error
     * messages
     * @return true if valid, false otherwise
     */
    public static boolean validateEmail(HttpServletRequest request, String email, String errorAttributeName) {
        if (email == null || email.trim().isEmpty()) {
            request.setAttribute(errorAttributeName, "Email không được để trống.");
            return false;
        }

        email = email.trim();

        // Regular expression for a basic email validation:
        // ^                : Start of the string
        // [\\w\\.-]+       : One or more word characters (letters, digits, underscore), dots or hyphens
        // @                : The '@' symbol
        // [\\w\\.-]+       : One or more word characters (letters, digits, underscore), dots or hyphens (domain name)
        // \\.              : A literal dot
        // \\w+             : One or more word characters (top-level domain)
        // $                : End of the string
        if (!email.matches("^[\\w\\.-]+@[\\w\\.-]+\\.\\w+$")) {
            request.setAttribute(errorAttributeName, "Email không hợp lệ.");
            return false;
        }

        return true;
    }

}
