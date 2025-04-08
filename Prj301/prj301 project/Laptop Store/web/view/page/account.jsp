<%-- 
    Document   : dashboard
    Created on : Feb 26, 2025, 5:24:56 PM
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

        <title>Tài khoản</title>

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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/simple-line-icons/css/simple-line-icons.min.css">
        <style>
            .badge {
                min-width: 130px;   /* Set a fixed width */
                text-align: center; /* Center text */
                font-weight: bold;  /* Make text bold */
                padding: 10px 15px; /* Add padding for a balanced look */
                border-radius: 8px; /* Smooth corners */
                font-size: 13px
            }

        </style>
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
                                        <li class="breadcrumb-item"><a href="demo4.html">Trang chủ</a></li>
                                        <li class="breadcrumb-item"><a href="category.html">Cửa hàng</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">
                                            Tài khoản
                                        </li>
                                    </ol>
                                </div>
                            </nav>

                            <h1>Tài khoản</h1>

                        </div>
                    </div>
                <c:if test="${empty user or user.fullName eq 'Default Name' or empty user.address or empty user.phone}">
                    <p style="color: red; text-align: center; margin-top: 20px;">
                        ${alertInfoMessage}
                    </p>
                </c:if>
                <c:if test="${not empty sessionScope.successPaymentMsg}">
                    <p style="color: green; text-align: center; margin-top: 20px;">
                        ${sessionScope.successPaymentMsg}
                    </p>
                    <!-- Remove the successPaymentMsg from session to avoid showing it on subsequent pages -->
                    <c:remove var="successPaymentMsg" scope="session"/>
                </c:if>




                <div class="container account-container custom-account-container">
                    <div class="row">
                        <div class="sidebar widget widget-dashboard mb-lg-0 mb-3 col-lg-3 order-0">
                            <h2 class="text-uppercase">Tài khoản</h2>
                            <ul class="nav nav-tabs list flex-column mb-0" role="tablist">


                                <li class="nav-item">
                                    <a class="nav-link ${param.tab eq 'order' ? 'active' : ''}" 
                                       href="${pageContext.request.contextPath}/dashboard?tab=order" role="tab">
                                        Đơn hàng đã mua
                                    </a>
                                </li>


                                <li class="nav-item">
                                    <a class="nav-link ${param.tab eq 'edit' ? 'active' : ''}" 
                                       href="${pageContext.request.contextPath}/dashboard?tab=edit" role="tab">
                                        Thông tin cá nhân
                                    </a>
                                </li>



                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/authen?action=logout">Đăng xuất</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-9 order-lg-last order-1 tab-content">


                            <div class="tab-pane fade ${param.tab eq 'order' ? 'show active' : ''}" id="order" role="tabpanel">
                                <div class="order-content">
                                    <h3 class="account-sub-title d-none d-md-block">
                                        <i class="sicon-social-dropbox align-middle mr-3"></i>Đơn hàng đã mua
                                    </h3>
                                    <div class="order-table-container text-center">
                                        <table class="table table-order text-left">
                                            <thead>
                                                <tr>
                                                    <th class="order-id">Mã Đơn Hàng</th>
                                                    <th class="order-date">Ngày Mua</th>
                                                    <th class="order-price">Tổng tiền</th>
                                                    <th class="order-status">Tình Trạng</th>
                                                    <th>Chi Tiết</th>
                                                    <th>Ghi chú</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:choose>
                                                    <c:when test="${not empty orderListUser}">
                                                        <c:forEach var="order" items="${orderListUser}">
                                                            <tr>
                                                                <td>#${order.orderID}</td>
                                                                <td><fmt:formatDate value="${order.formattedDate}" pattern="yyyy-MM-dd" /></td>
                                                                <td><fmt:formatNumber value="${order.getTotalAmount()}" type="currency" currencySymbol="" maxFractionDigits="0" groupingUsed="true"/> đ</td>
                                                                <td>
                                                                    <span class="badge ${order.status ? 'bg-success text-white' : 'bg-danger text-white'}">
                                                                        ${order.getStatusText()}
                                                                    </span>
                                                                </td>


                                                                <td>
                                                                    <button class="btn btn-info" data-bs-toggle="collapse" data-bs-target="#details-${order.orderID}">
                                                                        Xem Chi Tiết
                                                                    </button>
                                                                </td>
                                                                <td>
                                                                    ${order.note}
                                                                </td>
                                                            </tr>
                                                            <!-- Order Details Section -->
                                                            <tr id="details-${order.orderID}" class="collapse">
                                                                <td colspan="5">
                                                                    <table class="table">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>Tên sản phẩm</th>
                                                                                <th>Số Lượng</th>
                                                                                <th>Giá</th>
                                                                                <th>Tổng</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <c:forEach var="detail" items="${order.listOrderDetails}">
                                                                                <tr>
                                                                                    <td>${detail.getProductName(productDAO)}</td> 
                                                                                    <td>${detail.quantity}</td>
                                                                                    <td><fmt:formatNumber value="${detail.price}" type="currency" currencySymbol="" maxFractionDigits="0" groupingUsed="true"/> đ</td>
                                                                                    <td><fmt:formatNumber value="${detail.totalPrice}" type="currency" currencySymbol="" maxFractionDigits="0" groupingUsed="true"/> đ</td> 
                                                                                </tr>
                                                                            </c:forEach>


                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <tr>
                                                            <td class="text-center p-0" colspan="5">
                                                                <p class="mb-5 mt-5">Hiện tại bạn chưa có đơn hàng nào</p>
                                                            </td>
                                                        </tr>
                                                    </c:otherwise>
                                                </c:choose>

                                            </tbody>
                                        </table>
                                        <hr class="mt-0 mb-3 pb-2" />
                                        <a href="${pageContext.request.contextPath}/category" class="btn btn-dark">Mua thêm</a>
                                    </div>
                                </div>
                            </div>







                            <div class="tab-pane fade ${empty param.tab or param.tab eq 'edit' ? 'show active' : ''}" id="edit" role="tabpanel">
                                <h3 class="account-sub-title d-none d-md-block mt-0 pt-1 ml-1"><i
                                        class="icon-user-2 align-middle mr-3 pr-1"></i>Thông tin cá nhân</h3>
                                <div class="account-content">
                                    <!--                                    change user info-->
                                    <form method="POST" action="${pageContext.request.contextPath}/authen">
                                        <input type="hidden" name="action" value="change-info">

                                        <div class="row">


                                            <div class="col-md">
                                                <div class="form-group">
                                                    <label for="acc-fullname">Họ và tên <span
                                                            class="required">*</span></label>
                                                    <input type="text" class="form-control" id="acc-fullname"
                                                           name="acc-fullname" value="${user.fullName}" required />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group mb-2">
                                            <label for="acc-text">Username <span class="required">*</span></label>
                                            <input type="text" class="form-control" id="acc-text" name="acc-username"
                                                   placeholder="Editor" value="${user.username}" readonly required />

                                        </div>


                                        <div class="form-group mb-4">
                                            <label for="acc-email">Email<span class="required">*</span></label>
                                            <input type="email" class="form-control" id="acc-email" name="acc-email"
                                                   placeholder="" value="${user.email}" required />
                                        </div>

                                        <div class="form-group">
                                            <label>Số điện thoại <abbr class="required" title="required"></abbr></label>
                                            <input name="acc-phone" type="tel" class="form-control" value="${user.phone}" id="phone" maxlength="11" placeholder="" required onkeypress="return event.charCode >= 48 && event.charCode <= 57" />

                                        </div>

                                        <div class="form-group">
                                            <label>Địa chỉ <abbr class="required" title="required"></abbr></label>
                                            <input name="acc-address" type="text" class="form-control" value="${user.address}" placeholder="số nhà, tên phường, tỉnh/thành phố" required" />

                                        </div>
                                        <!--                                            alert message-->
                                        <c:if test="${not empty changeInfoSuccess}">
                                            <div class="alert alert-success">${changeInfoSuccess}</div>
                                            <% session.removeAttribute("changeInfoSuccess"); %>
                                        </c:if>

                                        <c:if test="${not empty changeInfoError}">
                                            <div class="alert alert-danger">${changeInfoError}</div>
                                            <% session.removeAttribute("changeInfoError"); %>

                                        </c:if>
                                        <div class="form-footer mt-3 mb-0">
                                            <button type="submit" class="btn btn-dark mr-0">
                                                Cập nhật
                                            </button>
                                        </div>
                                    </form>
                                    <!--                                            change password-->
                                    <form action="${pageContext.request.contextPath}/authen" method="POST">
                                        <input type="hidden" name="action" value="change-password">
                                        <div class="change-password">
                                            <h3 class="text-uppercase mb-2">Thay đổi mật khẩu</h3>

                                            <div class="form-group">
                                                <label for="acc-password">Mật khẩu hiện tại</label>
                                                <input required type="password" class="form-control" id="acc-password"
                                                       name="acc-password" />
                                            </div>

                                            <div class="form-group">
                                                <label for="acc-password">Mật khẩu mới</label>
                                                <input required type="password" class="form-control" id="acc-new-password"
                                                       name="acc-new-password" />
                                            </div>

                                            <div class="form-group">
                                                <label for="acc-password">Nhập lại mật khẩu mới</label>
                                                <input required type="password" class="form-control" id="acc-confirm-password"
                                                       name="acc-confirm-password" />
                                            </div>
                                        </div>
                                        <c:if test="${not empty changePasswordError}">
                                            <div class="alert alert-danger" role="alert">
                                                <c:out value="${changePasswordError}" />
                                            </div>
                                            <% session.removeAttribute("changePasswordError"); %>
                                        </c:if>

                                        <c:if test="${not empty changePasswordSuccess}">

                                            <div class="alert alert-success" role="alert">
                                                <c:out value="${changePasswordSuccess}" />
                                            </div>
                                            <% session.removeAttribute("changePasswordSuccess"); %>
                                        </c:if>

                                        <div class="form-footer mt-3 mb-0">
                                            <button type="submit" class="btn btn-dark mr-0">
                                                Thay đổi mật khẩu
                                            </button>
                                        </div>
                                    </form>

                                </div>
                            </div><!-- End .tab-pane -->




                        </div><!-- End .tab-content -->
                    </div><!-- End .row -->
                </div><!-- End .container -->

                <div class="mb-5"></div><!-- margin -->
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    </body>


    <!-- Mirrored from portotheme.com/html/porto_ecommerce/dashboard.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Feb 2025 03:27:31 GMT -->
</html>
