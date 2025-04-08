<%-- 
    Document   : wishlist
    Created on : Feb 26, 2025, 6:14:29 PM
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
                                        <li class="breadcrumb-item active" aria-current="page">
                                            Danh sách yêu thích
                                        </li>
                                    </ol>
                                </div>
                            </nav>

                            <h1>Sản phẩm yêu thích</h1>
                        </div>
                    </div>

                    <div class="container">
                        <div class="wishlist-title">
                            <h2 class="p-2">Danh sách sản phẩm</h2>
                        </div>
                        <div class="wishlist-table-container">
                            <table class="table table-wishlist mb-0">
                                <thead>
                                    <tr>
                                        <th class="thumbnail-col"></th>
                                        <th class="product-col">Sản Phẩm</th>
                                        <th class="price-col">Giá</th>
                                        <th class="status-col">Tình Trạng Kho</th>
                                        <th class="action-col">Thao Tác</th>
                                    </tr>

                                </thead>
                                <tbody>
<!--                                    SAN PHAM-->
                                    <tr class="product-row">
                                        <td>
                                            <figure class="product-image-container">
                                                <a href="product.html" class="product-image">
                                                    <img src="${pageContext.request.contextPath}/assets/images/products/product-4.jpg" alt="product">
                                            </a>

                                            <a href="#" class="btn-remove icon-cancel" title="Remove Product"></a>
                                        </figure>
                                    </td>
                                    <td>
                                        <h5 class="product-title">
                                            <a href="product.html">Men Watch</a>
                                        </h5>
                                    </td>
                                    <td class="price-box">$17.90</td>
                                    <td>
                                        <span class="stock-status">In stock</span>
                                    </td>
                                    <td class="action">
                                        <a href="ajax/product-quick-view.html" class="btn btn-quickview mt-1 mt-md-0"
                                           title="Quick View">SẢN PHẨM</a>
                                        <button class="btn btn-dark btn-add-cart product-type-simple btn-shop">THÊM VÀO GIỎ HÀNG
                                        </button>
                                    </td>
                                </tr>

                   
                            </tbody>
                        </table>
                    </div><!-- End .cart-table-container -->
                </div><!-- End .container -->
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
                    <a href="wishlist.jsp" class="">
                        <i class="icon-wishlist-2"></i>Danh sách ưu thích
                    </a>
                </div>
                <div class="sticky-info">
                    <a href="https://www.portotheme.com/html/porto_ecommerce/my-account.html" class="">
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
    </body>


    <!-- Mirrored from portotheme.com/html/porto_ecommerce/wishlist.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Feb 2025 03:27:44 GMT -->
</html>
