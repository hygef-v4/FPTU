<%-- 
    Document   : contact
    Created on : Feb 26, 2025, 5:52:41 PM
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

        <title>Liên hệ</title>

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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/simple-line-icons/css/simple-line-icons.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css">
    </head>

    <body>
        <div class="page-wrapper">
            <jsp:include page="/view/common/header.jsp"></jsp:include>

                <!-- End .header -->

                <main class="main">
                    <nav aria-label="breadcrumb" class="breadcrumb-nav">
                        <div class="container">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="home.jsp"><i class="icon-home"></i></a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Liên hệ với chúng tôi
                                </li>
                            </ol>
                        </div>
                    </nav>

<!--                    <div id="map"></div>-->
                    <div class="container contact-us-container">
                        <div class="contact-info">
                            <div class="row">
                                <div class="col-12">
                                    <h2 class="ls-n-25 m-b-1">
                                        Thông Tin Liên Hệ
                                    </h2>

                                    <p>
                                        Nếu bạn có bất kỳ câu hỏi nào về sản phẩm, dịch vụ hoặc cần tư vấn mua laptop phù hợp, hãy liên hệ với chúng tôi. 
                                        Đội ngũ hỗ trợ luôn sẵn sàng giúp bạn lựa chọn sản phẩm tốt nhất với giá ưu đãi.
                                    </p>
                                </div>


                                <div class="col-sm-6 col-lg-3">
                                    <div class="feature-box text-center">
                                        <i class="sicon-location-pin"></i>
                                        <div class="feature-box-content">
                                            <h3>Địa Chỉ</h3>
                                            <h5>
                                                <a href="https://www.google.com/maps/search/%C4%91%E1%BA%A1i+h%E1%BB%8Dc+fpt/@21.0127417,105.523503,17z/data=!3m1!4b1?hl=vi-VN&entry=ttu&g_ep=EgoyMDI1MDIyNC4wIKXMDSoASAFQAw%3D%3D">
                                                    Đại học FPT Hà Nội
                                                </a>
                                            </h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-3">
                                    <div class="feature-box text-center">
                                        <i class="fa fa-mobile-alt"></i>
                                        <div class="feature-box-content">
                                            <h3>Số Điện Thoại</h3>
                                            <h5><a href="tel:0379914844">0379914844</a></h5>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-3">
                                    <div class="feature-box text-center">
                                        <i class="far fa-envelope"></i>
                                        <div class="feature-box-content">
                                            <h3>Địa Chỉ Email</h3>
                                            <h5><a href="mailto:hungsct1702@gmail.com">hungsct1702@gmail.com</a></h5>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-3">
                                    <div class="feature-box text-center">
                                        <i class="far fa-calendar-alt"></i>
                                        <div class="feature-box-content">
                                            <h3>Ngày/Giờ Làm Việc</h3>
                                            <h5>Thứ Hai - Chủ Nhật / 9:00AM - 8:00PM</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-6">
                                <h2 class="mt-6 mb-2">Gửi Tin Nhắn Cho Chúng Tôi</h2>

                                <form class="mb-0" action="#">
                                    <div class="form-group">
                                        <label class="mb-1" for="contact-name">Họ và Tên
                                            <span class="required">*</span></label>
                                        <input type="text" class="form-control" id="contact-name" name="contact-name" required />
                                    </div>

                                    <div class="form-group">
                                        <label class="mb-1" for="contact-email">Email Của Bạn
                                            <span class="required">*</span></label>
                                        <input type="email" class="form-control" id="contact-email" name="contact-email" required />
                                    </div>

                                    <div class="form-group">
                                        <label class="mb-1" for="contact-message">Tin Nhắn Của Bạn
                                            <span class="required">*</span></label>
                                        <textarea cols="30" rows="1" id="contact-message" class="form-control" name="contact-message"
                                                  required></textarea>
                                    </div>

                                    <div class="form-footer mb-0">
                                        <button type="submit" class="btn btn-dark font-weight-normal">
                                            Gửi Tin Nhắn
                                        </button>
                                    </div>
                                </form>
                            </div>

                            <div class="col-lg-6">
                                <h2 class="mt-6 mb-1">Câu Hỏi Thường Gặp</h2>
                                <div id="accordion">
                                    <div class="card card-accordion">
                                        <a class="card-header" href="#" data-toggle="collapse" data-target="#collapseOne"
                                           aria-expanded="true" aria-controls="collapseOne">
                                            Tôi có thể mua laptop trả góp không?
                                        </a>

                                        <div id="collapseOne" class="collapse show" data-parent="#accordion">
                                            <p>Chúng tôi hỗ trợ nhiều hình thức trả góp với lãi suất ưu đãi. Vui lòng liên hệ để biết thêm
                                                chi tiết.</p>
                                        </div>
                                    </div>

                                    <div class="card card-accordion">
                                        <a class="card-header collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                                           aria-expanded="true" aria-controls="collapseOne">
                                            Chính sách bảo hành của cửa hàng là gì?
                                        </a>

                                        <div id="collapseTwo" class="collapse" data-parent="#accordion">
                                            <p>Tất cả sản phẩm laptop đều được bảo hành chính hãng từ 12 đến 24 tháng tùy theo từng mẫu máy.
                                                Quý khách có thể liên hệ bộ phận chăm sóc khách hàng để được hỗ trợ chi tiết.</p>
                                        </div>
                                    </div>

                                    <div class="card card-accordion">
                                        <a class="card-header collapsed" href="#" data-toggle="collapse" data-target="#collapseThree"
                                           aria-expanded="true" aria-controls="collapseThree">
                                            Tôi có thể đổi trả laptop nếu không ưng ý không?
                                        </a>

                                        <div id="collapseThree" class="collapse" data-parent="#accordion">
                                            <p>Chúng tôi có chính sách đổi trả trong vòng 7 ngày nếu sản phẩm không đạt yêu cầu. Laptop phải
                                                còn nguyên vẹn và đầy đủ phụ kiện.</p>
                                        </div>
                                    </div>

                                    <div class="card card-accordion">
                                        <a class="card-header collapsed" href="#" data-toggle="collapse" data-target="#collapseFour"
                                           aria-expanded="true" aria-controls="collapseThree">
                                            Cửa hàng có hỗ trợ nâng cấp linh kiện không?
                                        </a>

                                        <div id="collapseFour" class="collapse" data-parent="#accordion">
                                            <p>Chúng tôi cung cấp dịch vụ nâng cấp RAM, ổ cứng SSD và các linh kiện khác cho laptop với giá
                                                ưu đãi.</p>
                                        </div>
                                    </div>

                                    <div class="card card-accordion">
                                        <a class="card-header collapsed" href="#" data-toggle="collapse" data-target="#collapseFive"
                                           aria-expanded="true" aria-controls="collapseThree">
                                            Tôi có thể đặt hàng online và giao tận nơi không?
                                        </a>

                                        <div id="collapseFive" class="collapse" data-parent="#accordion">
                                            <p>Chúng tôi hỗ trợ đặt hàng online và giao hàng toàn quốc. Quý khách có thể thanh toán khi nhận
                                                hàng hoặc chuyển khoản trước.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="mb-8"></div>
                </main>

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

            <div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->



            <div class="sticky-navbar">
                <div class="sticky-info">
                    <a href="demo4.html">
                        <i class="icon-home"></i>Home
                    </a>
                </div>
                <div class="sticky-info">
                    <a href="category.html" class="">
                        <i class="icon-bars"></i>Categories
                    </a>
                </div>
                <div class="sticky-info">
                    <a href="wishlist.html" class="">
                        <i class="icon-wishlist-2"></i>Wishlist
                    </a>
                </div>
                <div class="sticky-info">
                    <a href="login.html" class="">
                        <i class="icon-user-2"></i>Account
                    </a>
                </div>
                <div class="sticky-info">
                    <a href="cart.html" class="">
                        <i class="icon-shopping-cart position-relative">
                            <span class="cart-count badge-circle">3</span>
                        </i>Cart
                    </a>
                </div>
            </div>



            <a id="scroll-top" href="#top" title="Top" role="button"><i class="icon-angle-up"></i></a>



            <!-- Plugins JS File -->
            <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>

        <!-- Main JS File -->
        <script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>

        <!-- Google Map-->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDc3LRykbLB-y8MuomRUIY0qH5S6xgBLX4"></script>
        <script src="${pageContext.request.contextPath}/assets/js/map.js"></script>
    </body>


    <!-- Mirrored from portotheme.com/html/porto_ecommerce/contact.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Feb 2025 03:29:31 GMT -->
</html>
