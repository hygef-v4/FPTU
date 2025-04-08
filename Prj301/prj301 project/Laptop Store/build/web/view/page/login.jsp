<%-- 
    Document   : login
    Created on : Feb 26, 2025, 5:05:45 PM
    Author     : hungs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html lang="en">

    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Đăng nhập | Đăng ký</title>

        <meta name="keywords" content="HTML5 Template" />
        <meta name="description" content="Porto - Bootstrap eCommerce Template">
        <meta name="author" content="SW-THEMES">

        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/icons/favicon.png">


        <script>
            WebFontConfig = {
                google: {families: ['Open+Sans:300,400,600,700,800', 'Poppins:300,400,500,600,700', 'Shadows+Into+Light:400']}
            };
            (function (d) {
                var wf = d.createElement('script'), s = d.scripts[ 0 ];
                wf.src = 'assets/js/webfont.js';
                wf.async = true;
                s.parentNode.insertBefore(wf, s);
            })(document);
        </script>

        <!-- Plugins CSS File -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

        <!-- Main CSS File -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css">

    </head>

    <body>
        <div class="page-wrapper">


            <jsp:include page="/view/common/header.jsp"></jsp:include>

                <!-- End .header -->

                <main class="main">
                    <div class="page-header">
                        <div class="container d-flex flex-column align-items-center">
                            <nav aria-label="breadcrumb" class="breadcrumb-nav">
                                <div class="container">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="home.jsp">Trang chủ</a></li>
                                        <li class="breadcrumb-item"><a href="category.jsp">Cửa hàng</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">
                                            Tài khoản
                                        </li>
                                    </ol>
                                </div>
                            </nav>

                            <h1>Tài khoản</h1>
                        </div>
                    </div>

                    <div class="container login-container">
                        <div class="row">
                            <div class="col-lg-10 mx-auto">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="heading mb-1">
                                            <h2 class="title">Đăng nhập</h2>
                                        </div>

                                        <form id="login-form" action="authen?action=login" method="POST">
                                            <label for="login-email">
                                                Tên đăng nhập 
                                                <span class="required">*</span>
                                            </label>
                                            <input type="text" name="username" class="form-input form-wide" id="login-email" required />

                                            <label for="login-password">
                                                Mật khẩu
                                                <span class="required">*</span>
                                            </label>
                                            <input type="password" name="password" class="form-input form-wide" id="login-password" required />
                                            <!--                                            recapcha-->
                                            <div class="g-recaptcha" data-sitekey="6Lfw_fUqAAAAAHdeOcH_4SyLw_5q_VzRg1Bgl4UR"></div>
                                            <div id="error" style="color:red"></div>
                                            <div class="form-footer">


                                                <a href="${pageContext.request.contextPath}/authen?action=forgot-password"
                                               class="forget-password text-dark form-footer-right">Quên mật khẩu?</a>
                                        </div>
                                        <button type="button"  onclick="checkCapcha()"  class="btn btn-dark btn-md w-100">
                                            ĐĂNG NHẬP
                                        </button>
                                        <!--                                           login bang gg-->
                                        <div style="margin-top: 10px" class="d-flex gap-3 flex-column w-100 ">
                                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid &redirect_uri=http://localhost:9999/Laptop_Store/authen?action=login-google&response_type=code&client_id=607777252028-8jjc96guj4rr1hilaf05vqgc7qvaf2bs.apps.googleusercontent.com&approval_prompt=force" class="btn btn-lg btn-danger">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-google" viewBox="0 0 16 16">
                                                <path d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z" />
                                                </svg>
                                                <span class="ms-2 fs-6">Đăng nhập bằng google</span>
                                            </a>
                                        </div>

                                        <p style="color:red; margin-top: 4%;">${loginError}</p>
                                    </form>
                                </div>

                                <div class="col-md-6">
                                    <div class="heading mb-1">
                                        <h2 class="title">Đăng ký</h2>
                                    </div>

                                    <form action="authen?action=register" method="POST">
                                        <label for="register-email">
                                            Tên đăng nhập 
                                            <span class="required">*</span>
                                        </label>
                                        <input type="text" name="registerUsername" class="form-input form-wide" id="register-email" required />

                                        <label for="register-password">
                                            Mật khẩu
                                            <span class="required">*</span>
                                        </label>
                                        <input type="password" name="registerPassword" class="form-input form-wide" id="register-password"
                                               required />

                                        <div class="form-footer mb-2">
                                            <button type="submit" class="btn btn-dark btn-md w-100 mr-0">
                                                Đăng ký
                                            </button>

                                        </div>
                                        <p style="color:red; margin-top: 4%;">${registerError}</p>


                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main><!-- End .main -->

            <jsp:include page="/view/common/footer.jsp"></jsp:include>

                <!-- End .footer -->
            </div><!-- End .page-wrapper -->

            <div class="loading-overlay">
                <div class="bounce-loader">
                    <div class="bounce1"></div>
                    <div class="bounce2"></div>
                    <div class="bounce3"></div>
                </div>
            </div>





            <a id="scroll-top" href="#top" title="Top" role="button"><i class="icon-angle-up"></i></a>

            <!-- Plugins JS File -->
            <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>

        <!-- Main JS File -->
        <script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>
        <!--        recapcha-->
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script type="text/javascript">
                                            function checkCapcha() {
                                                var form = document.getElementById("login-form");   // lay form login 
                                                var error = document.getElementById("error");       // lay div thong bao loi 
                                                var username = document.getElementById("login-email").value.trim(); // Get username value
                                                var password = document.getElementById("login-password").value.trim(); // Get password value
                                                const response = grecaptcha.getResponse();      // lay key khi tich vao recapcha
                                                // Check if username and password are empty
                                                if (username === "" || password === "") {
                                                    error.textContent = "Tên đăng nhập và mật khẩu không được để trống!";
                                                    return; // Stop submission
                                                }
//                                                alert("reCAPTCHA response: " + response); // Force alert to show value

                                                if (response) {                                 // neu co capcha
                                                    form.submit();
                                                } else {
                                                    error.textContent = 'Bạn chưa xác thực captcha!';   // neu chua tick
                                                }
                                            }
        </script>
    </body>


</html>
