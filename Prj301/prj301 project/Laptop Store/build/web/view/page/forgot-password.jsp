<%-- 
    Document   : forgot-password
    Created on : Feb 26, 2025, 6:20:48 PM
    Author     : hungs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>FbtShop.com</title>

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

                            <h1>Quên mật khẩu</h1>
                        </div>
                    </div>

                    <div class="container reset-password-container">
                        <div class="row">
                            <div class="col-lg-6 offset-lg-3">
                                <div class="feature-box border-top-primary">
                                    <div class="feature-box-content">
                                        <form class="mb-0" action="authen" method="POST">
                                            <input type="hidden" name="action" value="forgot-password">
                                            <p>
                                                Vui lòng nhập tên đăng nhập hoặc địa chỉ email của bạn. Bạn sẽ nhận được một liên kết để tạo mật khẩu mới qua email.
                                            </p>
                                            <div class="form-group mb-0">
                                                <label for="reset-email" class="font-weight-normal">Địa chỉ email</label>
                                                <input type="email" class="form-control" id="reset-email" name="reset-email"
                                                       required />
                                            </div>

                                            <div class="form-footer mb-0">
                                                <a href="${pageContext.request.contextPath}/authen?action=login">Đăng nhập</a>

                                                <button type="submit"
                                                        class="btn btn-md btn-primary form-footer-right font-weight-normal text-transform-none mr-0">
                                                    Khôi phục mật khẩu
                                                </button>
                                            </div>
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
    </body>


    <!-- Mirrored from portotheme.com/html/porto_ecommerce/forgot-password.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Feb 2025 03:28:44 GMT -->
</html>
