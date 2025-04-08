<%-- 
    Document   : checkout
    Created on : Feb 26, 2025, 6:26:54 PM
    Author     : hungs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">


    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Thanh toán</title>

        <meta name="keywords" content="HTML5 Template" />
        <meta name="description" content="Porto - Bootstrap eCommerce Template">
        <meta name="author" content="SW-THEMES">

        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/icons/favicon.png">


        <script>
            WebFontConfig = {
                google: {
                    families: ['Open+Sans:300,400,600,700,800', 'Poppins:300,400,500,600,700', 'Shadows+Into+Light:400']
                }
            };
            (function (d) {
                var wf = d.createElement('script'),
                        s = d.scripts[0];
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

                <main class="main main-test">
                    <div class="container checkout-container">
                        <ul class="checkout-progress-bar d-flex justify-content-center flex-wrap">
                            <li>
                                <a href="${pageContext.request.contextPath}/cart">Giỏ hàng</a>
                        </li>
                        <li class="active">
                            <a href="${pageContext.request.contextPath}/payment">Thanh toán</a>
                        </li>
                        <li class="disabled">
                            <a href="#">Hoàn tất thanh toán</a>
                        </li>
                    </ul>






                    <div class="row">
                        <div class="col-lg-7">
                            <p><a href="${pageContext.request.contextPath}/dashboard" class="edit-payment-link">Chỉnh sửa thông tin thanh toán</a></p>

                            <ul class="checkout-steps">
                                <li>
                                    <h2 class="step-title">Chi tiết thanh toán</h2>

                                     <form id="checkout-form" action="payment?action=check-out" method="POST">
                                        <div class="row">
                                            <div class="col-md">
                                                <div class="form-group">
                                                    <label>Họ và tên
                                                        <abbr class="required" title="required"></abbr>
                                                    </label>
                                                    <input readonly name="fullname" type="text" value="${user.fullName}" class="form-control" required />
                                                </div>
                                            </div>


                                        </div>





                                        <div class="form-group mb-1 pb-2">
                                            <label>Địa chỉ
                                                <abbr class="required" title="required"></abbr></label>
                                            <input name="address" type="text" class="form-control" value="${user.address}" placeholder="Số nhà và tên phố" required />
                                        </div>






                                        <div class="form-group">
                                            <label>Số điện thoại <abbr class="required" title="required"></abbr></label>
                                            <input name="phone" type="tel" class="form-control" value="${user.phone}" id="phone" maxlength="11" placeholder="" required onkeypress="return event.charCode >= 48 && event.charCode <= 57" />

                                        </div>

                                        <div class="form-group">
                                            <label class="order-comments">Ghi chú đơn hàng (nếu có)</label>
                                            <textarea name="order-note" class="form-control" placeholder="Ghi chú về đơn hàng của bạn, ví dụ ghi chú đặc biệt về việc giao hàng."></textarea>
                                        </div>
                                   
                                </li>
                            </ul>
                        </div>
                        <!-- End .col-lg-8 -->

                        <div class="col-lg-5">
                            <div class="order-summary">
                                <h3>Đơn hàng của bạn</h3>

                                <table class="table table-mini-cart">
                                    <thead>
                                        <tr>
                                            <th colspan="2">Sản phẩm</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        ${empty cart ? "Cart is empty" : "Cart has items: "}${cart.listOrderDetails.size()}
                                    <p>${empty productList ? "productList is empty" : "productList has items: "}${productList.size()}</p>

                                    <c:forEach var="od" items="${cart.listOrderDetails}">
                                        <c:forEach var="product" items="${productList}">
                                            <c:if test="${product.productID == od.productID}">
                                                <c:set var="p" value="${product}"> </c:set>
                                            </c:if>
                                        </c:forEach>
                                        <tr>
                                            <td class="product-col">
                                                <h3 class="product-title">
                                                    ${p.productName} ×
                                                    <span class="product-qty">${od.quantity}</span>
                                                </h3>
                                            </td>

                                            <td class="price-col">
                                                <span class="subtotal-price">
                                                    <fmt:formatNumber value="${p.price * od.quantity}" type="number" maxFractionDigits="0" /> ₫
                                                </span>

                                            </td>
                                        </tr>
                                    </c:forEach>


                                    </tbody>
                                    <tfoot>
                                        <tr  style="border-bottom: none !important; margin-bottom: 0px" class="cart-subtotal">
                                            <td>
                                                <h4>Tạm tính</h4>
                                            </td>
                                            <td class="price-col" id="sub-total">0</td> <!-- Moved id="sub-total" to the correct place -->
                                        </tr>

                                        <tr style=" " class="cart-subtotal">
                                            <td style="border-bottom: none; padding-top: 0px !important;">
                                                <h4>Giảm giá</h4>
                                            </td>

                                            <td style="padding-top: 0px" id="discount">
                                                <fmt:formatNumber value="0" type="number" maxFractionDigits="0" /> ₫
                                            </td>
                                        </tr>
                                        <tr class="order-shipping">
                                            <td class="text-left" colspan="2">
                                                <h4 class="m-b-sm">Vận chuyển</h4>

<!--                                                <div class="form-group form-group-custom-control">
                                                    <div class="custom-control custom-radio d-flex">
                                                        <input type="radio" class="custom-control-input" name="radio" checked />
                                                        <label class="custom-control-label">Nhận tại cửa hàng</label>
                                                    </div>
                                                     End .custom-checkbox 
                                                </div>-->
                                                <!-- End .form-group -->

                                                <div class="form-group form-group-custom-control mb-0">
                                                    <div class="custom-control custom-radio d-flex mb-0">
                                                        <input checked type="radio" name="radio" class="custom-control-input">
                                                        <label class="custom-control-label">Giao hàng tận nơi</label>
                                                    </div>
                                                    <!-- End .custom-checkbox -->
                                                </div>
                                                <!-- End .form-group -->
                                            </td>

                                        </tr>

                                        <tr class="order-total">
                                            <td>
                                                <h4>Tổng tiền</h4>
                                            </td>


                                            <td class="price-col" id="total-cart">0</td>

                                        </tr>
                                    </tfoot>
                                </table>

                                <div class="payment-methods">
                                    <h4 class="">Phương thức thanh toán</h4>
                                    <div class="info-box with-icon p-0">
                                        <p>
                                            Thanh toán khi nhận hàng
                                        </p>
                                    </div>
                                </div>
                               
                                    <!-- Your input fields here -->
                                    <button type="submit" class="btn btn-dark btn-place-order">
                                        Đặt hàng
                                    </button>                   
                                </form>


                            </div>
                            <!-- End .cart-summary -->
                        </div>
                        <!-- End .col-lg-4 -->
                    </div>
                    <!-- End .row -->
                </div>
                <!-- End .container -->
            </main>
            <!-- End .main -->

            <jsp:include page="/view/common/footer.jsp"></jsp:include>

                <!-- End .footer -->
            </div>
            <!-- End .page-wrapper -->

            <div class="loading-overlay">
                <div class="bounce-loader">
                    <div class="bounce1"></div>
                    <div class="bounce2"></div>
                    <div class="bounce3"></div>
                </div>
            </div>



            <div class="sticky-navbar">
                <div class="sticky-info">
                    <a href="home.jsp">
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
                    <a href="https://www.portotheme.com/html/porto_ecommerce/my-account.jsp" class="">
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

        <script>
                                                window.onload = updateSubTotal;

                                                function updateSubTotal() {
                                                    let subtotalElements = document.querySelectorAll(".subtotal-price");
                                                    let total = 0;

                                                    if (subtotalElements.length === 0) {
                                                        console.error("No elements found with class .subtotal-price!");
                                                    }

                                                    subtotalElements.forEach(e => {
                                                        let priceText = e.textContent.trim().replace("₫", "").replace(/\./g, "").replace(/,/g, "");
                                                        let totalPrice = parseFloat(priceText);

                                                        console.log("Extracted Price:", priceText, "Parsed Value:", totalPrice); // Debugging log

                                                        if (!isNaN(totalPrice)) {
                                                            total += totalPrice;
                                                        }
                                                    });

                                                    let discount = getDiscountValue();
                                                    let finalTotal = total - discount;

                                                    console.log("Subtotal:", total, "Discount:", discount, "Final Total:", finalTotal); // Debugging log

                                                    updateElementText("sub-total", total);

                                                    // Only update total-cart if it exists in the DOM
                                                    if (document.getElementById("total-cart")) {
                                                        updateElementText("total-cart", finalTotal);
                                                    }
                                                }

                                                function getDiscountValue() {
                                                    let discountElement = document.getElementById("discount");
                                                    if (discountElement) {
                                                        let discountText = discountElement.textContent.trim().replace("₫", "").replace(/\./g, "").replace(/,/g, "");
                                                        let discountValue = parseFloat(discountText);
                                                        return isNaN(discountValue) ? 0 : discountValue;
                                                    }
                                                    return 0;
                                                }

                                                function updateElementText(elementId, value) {
                                                    let element = document.getElementById(elementId);
                                                    if (element) {
                                                        element.textContent = new Intl.NumberFormat('vi-VN').format(value) + " ₫";
                                                    } else {
                                                        console.error("Element #" + elementId + " not found!");
                                                    }
                                                }








        </script>
    </body>


</html>
