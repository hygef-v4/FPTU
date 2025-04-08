package controller.page;

import controller.google.GoogleLogin;
import controller.utility.Validation;
import dal.implement.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.GoogleAccount;
import model.User;

/**
 *
 * @author hungs
 */
public class AuthenticationServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(AuthenticationServlet.class.getName());

    // DAO declare 
    UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") != null ? request.getParameter("action") : "";
        String URL;
        switch (action) {
            case "login":
                URL = "view/page/login.jsp";
                break;
            case "logout":
                URL = logOutDoGet(request, response);    // xu ly o doGet vi chuyen logout tu the <a> 
                break;
            case "forgot-password":
                URL = "view/page/forgot-password.jsp";
                break;
            case "login-google":
                URL = loginGoogleDoGet(request, response);
                break;
            default:
                URL = "home";   // chuyen sang DO POST cua /home 
        }
        request.getRequestDispatcher(URL).forward(request, response);
    }

    // xu ly login form truyen ve do Post
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") != null ? request.getParameter("action") : "";
        String url;
        switch (action) {

            case "login":
                url = loginDoPost(request, response);
                break;
            case "register":
                url = signUpDoPost(request, response);
                break;
            case "change-password":
                url = changePasswordDoPost(request, response);
                break;
            case "change-info": // New case for changing user info
                url = changeInfoDoPost(request, response);
                break;

            default:
                url = "home";
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    private String loginDoPost(HttpServletRequest request, HttpServletResponse response) {
        String URL = null;
        // get username, password 
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validate username for login (minimal check)
        if (!Validation.validateUsernameForLogin(request, username, "loginError")) {
            return "view/page/login.jsp";
        }

        // find user exist
        User userFound = userDAO.findByUsernamePassword(username, password);
        // check login
        if (userFound != null) {       // if login sucess forward to /home
            HttpSession session = request.getSession();
            session.setAttribute("user", userFound);  // set session user 
            URL = "home";
        } else {                        // if login failed then go alert error 
            request.setAttribute("loginError", "Sai tài khoản hoặc mật khẩu!!");
            URL = "view/page/login.jsp";
        }
        return URL;

    }

    private String logOutDoGet(HttpServletRequest request, HttpServletResponse response) {
        // delete session user 
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        session.removeAttribute("cart");  // xoa cart session
        return "home";   // quay ve hom sau khi logout
    }

    private String signUpDoPost(HttpServletRequest request, HttpServletResponse response) {
        String URL = null;
        // get username and password register 

        String registerUsername = request.getParameter("registerUsername");
        String registerPassword = request.getParameter("registerPassword");

        // Validate username
        if (!Validation.validateUsername(request, registerUsername, "loginError")) {
            return "view/page/login.jsp";
        }

        // Validate password using the updated helper function
        if (!Validation.validatePassword(request, registerPassword, "registerError")) {
            // Validation failed; return to the login page with error message.
            return "view/page/login.jsp";
        }

        // check username exist 
        boolean isUserExist = userDAO.isUsernameExist(registerUsername);
        // if exist then error
        if (isUserExist) {
            request.setAttribute("registerError", "Tên người dùng đã tồn tại! Vui lòng thử tên khác.");
            URL = "view/page/login.jsp";
        } else {
            //else add user to db and go back to /home 
            User newUser = User.builder()
                    .fullName("Default Name") // Provide a default or input value
                    .username(registerUsername)
                    .password(registerPassword)
                    .roleID(2) // Example: Default role for a new user
                    .address("")
                    .phone("")
                    .email("")
                    .activate(true) // Default value for activation
                    .build();

            userDAO.insert(newUser);
            URL = "home";
        }
        return URL;

    }

    private String changePasswordDoPost(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String currentPassword = request.getParameter("acc-password");
        String newPassword = request.getParameter("acc-new-password");
        String confirmPassword = request.getParameter("acc-confirm-password");
        if (user == null) {
            // Redirect to login page (or handle as appropriate)
            return "view/page/login.jsp";
        }
        // 2. Verify current password
        if (!userDAO.checkPassword(user.getUsername(), currentPassword)) {
            request.setAttribute("changePasswordError", "Mật khẩu hiện tại sai.");
            return "view/page/account.jsp"; // Assuming dashboard.jsp has the change password form
        }
        // 3. Check if new password and confirm password match
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("changePasswordError", "Mật khẩu xác nhận không đúng.");
            return "view/page/account.jsp"; // Return to the form with an error
        }
        //4. Check new password and current password are same or not
        if (newPassword.equals(currentPassword)) {
            request.setAttribute("changePasswordError", "Mật khẩu mới phải khác mật khẩu hiện tại.");
            return "view/page/account.jsp";
        }
        // 5. Validate the new password meets the criteria
        if (!Validation.validatePassword(request, newPassword, "changePasswordError")) {
            return "view/page/account.jsp";
        }

        // 6. Update password in the database
        if (userDAO.changePassword(user.getUsername(), newPassword)) {
            // Success!  Update the user object in the session (optional, but good practice)
            user.setPassword(newPassword); // Keep session data consistent
            session.setAttribute("user", user);
            session.setAttribute("changePasswordSuccess", "Mật khẩu thay đổi thành công.");
            return "view/page/account.jsp";
        } else {
            // Database update failed.  Handle the error appropriately.
            request.setAttribute("changePasswordError", "Lỗi đổi mật khẩu.");
            return "view/page/account.jsp"; // Return to form
        }

    }

    private String changeInfoDoPost(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Check if the user is logged in
        if (user == null) {
            return "view/page/login.jsp"; // Redirect to login page if not logged in
        }
        String fullName = request.getParameter("acc-fullname").trim();
        String email = request.getParameter("acc-email").trim();
        String phone = request.getParameter("acc-phone").trim();
        String address = request.getParameter("acc-address").trim();

        // Validate full name using the utility method
        if (!Validation.validateFullname(request, fullName, "changeInfoError")) {
            return "view/page/account.jsp";
        }

        if (!Validation.validateEmail(request, email, "changeInfoError")) {
            return "view/page/account.jsp";
        }

        // Check if the email is already used by another user
        if (userDAO.isEmailExistForOtherUser(email, user.getUserID())) {
            request.setAttribute("changeInfoError", "Email đã được sử dụng bởi người dùng khác.");
            return "view/page/account.jsp";
        }

        // Validate phone number using the utility method for Vietnamese phone numbers
        if (!Validation.validatePhoneNumber(request, phone, "changeInfoError")) {
            return "view/page/account.jsp";
        }

        // Update user info in the database
        boolean updateSuccess = userDAO.updateUserInfo(user.getUserID(), fullName, email, phone, address);
        if (updateSuccess) {
            // Update the user object in the session
            user.setFullName(fullName);
            user.setEmail(email);
            user.setPhone(phone);
            user.setAddress(address);
            session.setAttribute("user", user);
            session.setAttribute("changeInfoSuccess", "Thông tin đã được cập nhật thành công.");
        } else {
            request.setAttribute("changeInfoError", "Cập nhật thông tin thất bại. Vui lòng thử lại.");
        }

        return "view/page/account.jsp";

    }

    private String loginGoogleDoGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String URL = null;
        // lay ve auth code 
        String code = request.getParameter("code");

        GoogleLogin gg = new GoogleLogin();
        // lay access token 
        String accessToken = gg.getToken(code);
        GoogleAccount acc = gg.getUserInfo(accessToken);
        String email = acc.getEmail();
        // Get current session or create one if not exists
        HttpSession session = request.getSession();

        // Check if user with this email already exists
        User userFound = userDAO.findByEmail(email);
        if (userFound != null) {
            // User exists: Log them in
            session.setAttribute("user", userFound);
            URL = "home";
        } else {
            request.setAttribute("loginError", "Đăng nhập thất bại!!");
            URL = "view/page/login.jsp";
        }
        return URL;
//        response.setContentType("text/html");
//        PrintWriter out = response.getWriter();
//        out.println("<html><head><title>Google Account Info</title></head><body>");
//        out.println("<h2>Acc:</h2><p>" + acc + "</p>");
//        out.println("<h2>Email:</h2><p>" + email + "</p>");
//        out.println("</body></html>");
//         Return null if you're handling the response completely here.
//        return null;  // debug 

    }

}
