<%-- 
    Document   : cart.jsp
    Created on : Feb 26, 2025, 4:53:55 PM
    Author     : hungs
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Giỏ hàng</title>

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
                    <div class="container">
                        <ul class="checkout-progress-bar d-flex justify-content-center flex-wrap">
                            <li class="active">
                                <a href="${pageContext.request.contextPath}/view/page/cart.jsp">Giỏ Hàng</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/view/page/checkout.jsp">Thanh toán</a>
                        </li>
                        <li class="disabled">
                            <a href="${pageContext.request.contextPath}/view/page/cart.jsp">Hoàn tất thanh toán</a>
                        </li>
                    </ul>

                    <div class="row">
                        <div class="col-lg-8">
                            <div class="cart-table-container">
                                <table class="table table-cart">
                                    <thead>
                                        <tr>
                                            <th class="thumbnail-col"></th>
                                            <th class="product-col">Sản phẩm</th>
                                            <th class="price-col">Giá tiền</th>
                                            <th class="qty-col">Số lượng</th>
                                            <th class="text-right">Tổng tiền</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <p></p>

                                    <c:forEach var="od" items="${cart.listOrderDetails}">
                                        <c:forEach var="product" items="${productList}">
                                            <c:if test="${product.productID == od.productID}">
                                                <c:set var="p" value="${product}"> </c:set>
                                            </c:if>
                                        </c:forEach>
                                        <tr class="product-row">
                                            <td>
                                                <figure class="product-image-container">
                                                    <a href="${pageContext.request.contextPath}/products?productID=${p.productID}" class="product-image">
                                                        <img src="${p.image}" alt="product">
                                                    </a>
                                                    <form action="cart?action=delete" method="POST">
                                                        <input type="hidden" name="productID" value="${p.productID}">

                                                        <a href="#" onclick="return this.closest('form').submit()" class="btn-remove icon-cancel" title="Remove Product"></a>
                                                    </form>
                                                </figure>
                                            </td>
                                            <td class="product-col">
                                                <h5 class="product-title">
                                                    <a href="${pageContext.request.contextPath}/products?productID=${p.productID}">${p.productName}</a>
                                                </h5>
                                            </td>
                                            <td><fmt:formatNumber value="${p.price}" type="currency" currencySymbol="₫" maxFractionDigits="0" /></td>

                                            <td>
                                                <div class="product-single-qty">
                                                    <form action="cart?action=change-quantity" method="POST">
                                                        <input type="hidden" name="id" value="${p.productID}">
                                                        <input name="quantity-input" onchange="return this.closest('form').submit()" class="horizontal-quantity form-control" type="number" value="${od.quantity}">
                                                    </form>
                                                </div><!-- End .product-single-qty -->
                                            </td>
                                            <td class="text-right"><span class="subtotal-price"><fmt:formatNumber value="${p.price * od.quantity}" type="currency" currencySymbol="₫" maxFractionDigits="0" /></span></td>
                                        </tr>

                                    </c:forEach>


                                    </tbody>


                                    <tfoot>
                                        <tr>
                                            <td colspan="5" class="clearfix">
                                                <div class="float-left">
<!--                                                    <div class="cart-discount">
                                                        <form action="#">
                                                            <div class="input-group">
                                                                <input type="text" class="form-control form-control-sm"
                                                                       placeholder="Nhập mã giảm giá" required>
                                                                <div class="input-group-append">
                                                                    <button class="btn btn-sm" type="submit">Áp dụng mà giảm giá</button>
                                                                </div>
                                                            </div> End .input-group 
                                                        </form>
                                                    </div>-->
                                                </div><!-- End .float-left -->

                                                <div class="float-right">
                                                    <a href="${pageContext.request.contextPath}/category"><button  type="submit" class="btn btn-shop btn-update-cart">
                                                            Tiếp tục mua sắm 
                                                        </button>
                                                    </a>
                                                </div><!-- End .float-right -->
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div><!-- End .cart-table-container -->
                        </div><!-- End .col-lg-8 -->

                        <div class="col-lg-4">
                            <div class="cart-summary">
                                <h3>Giỏ Hàng</h3>

                                <table class="table table-totals">
                                    <tbody>
                                        <tr>
                                            <td>Tạm tính</td>
                                            <td id="sub-total"></td>
                                        </tr>

                                        <tr>
                                            <td>Giảm giá</td>
                                            <td id="discount">
                                                <fmt:formatNumber value="0" type="number" maxFractionDigits="0" /> ₫
                                            </td>
                                        </tr>


                                    </tbody>

                                    <tfoot>
                                        <tr>
                                            <td>Tổng cộng</td>
                                            <td id="total-cart"></td>
                                        </tr>
                                    </tfoot>
                                </table>

                                <div class="checkout-methods">
                                    <c:if test="${sessionScope.user == null}">
                                        <!-- Show red warning text -->
                                        <p style="color: red; font-weight: bold;">
                                            Bạn cần đăng ký hoặc đăng nhập để tiếp tục thanh toán!
                                        </p>
                                        <!-- Register/Login Button with Black Background -->
                                        <a href="authen?action=login" class="btn btn-block" style="background-color: black; color: white;">
                                            Đăng ký / Đăng nhập
                                        </a>
                                    </c:if>

                                    <c:if test="${sessionScope.user != null}">
                                        <c:choose>
                                            <c:when test="${empty sessionScope.cart || (not empty sessionScope.cart and sessionScope.cart.listOrderDetails.size() == 0)}">

                                                <!-- If the cart is empty, show a message and a link to the category page -->
                                                <p style="color: red; font-weight: bold;">
                                                    Giỏ hàng của bạn đang trống!
                                                </p>
                                                <form action="category" method="GET">
                                                    <button type="submit" class="btn btn-block btn-dark">
                                                        Thêm sản phẩm vào giỏ hàng <i class="fa fa-arrow-right"></i>
                                                    </button>
                                                </form>
                                            </c:when>
                                            <c:otherwise>
                                                <!-- If the cart is NOT empty and user logged in, show the checkout button -->
                                                <form action="payment" method="GET">
                                                    <button type="submit" class="btn btn-block btn-dark">
                                                        Tiến hành thanh toán <i class="fa fa-arrow-right"></i>
                                                    </button>
                                                </form>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>


                                </div>
                                <% 
                                    String errorMsg = (String) session.getAttribute("errorPaymentMsg");
                                    if (errorMsg != null) { 
                                %>
                                    <div style="color: red;"><%= errorMsg %></div>
                                <% 
                                        session.removeAttribute("errorPaymentMsg"); // Clear after displaying
                                    } 
                                %>


                            </div><!-- End .cart-summary -->
                        </div><!-- End .col-lg-4 -->
                    </div><!-- End .row -->
                </div><!-- End .container -->

                <div class="mb-6"></div><!-- margin -->
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
                    <a href="demo4.jsp">
                        <i class="icon-home"></i>Home
                    </a>
                </div>
                <div class="sticky-info">
                    <a href="category.jsp" class="">
                        <i class="icon-bars"></i>Categories
                    </a>
                </div>
                <div class="sticky-info">
                    <a href="wishlist.jsp" class="">
                        <i class="icon-wishlist-2"></i>Wishlist
                    </a>
                </div>
                <div class="sticky-info">
                    <a href="login.jsp" class="">
                        <i class="icon-user-2"></i>Account
                    </a>
                </div>
                <div class="sticky-info">
                    <a href="cart.jsp" class="">
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

        <!--        tinh subtotal-->
        <script>
                                                            window.onload = updateSubTotal;

                                                            function updateSubTotal() {
                                                                let subtotalElements = document.querySelectorAll(".subtotal-price");
                                                                let total = 0;

                                                                subtotalElements.forEach(e => {
                                                                    let priceText = e.textContent.trim().replace("₫", "").replace(/,/g, "");
                                                                    let totalPrice = parseFloat(priceText) || 0;
                                                                    total += totalPrice;
                                                                });

                                                                let discountText = document.getElementById("discount").textContent.trim().replace("₫", "").replace(/,/g, "");
                                                                let discount = parseFloat(discountText) || 0; // Get discount value from the element

                                                                let finalTotal = total - discount;

                                                                document.getElementById("sub-total").textContent =
                                                                        new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(total);

                                                                document.getElementById("total-cart").textContent =
                                                                        new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(finalTotal);
                                                            }


        </script>
    </body>


</html>
