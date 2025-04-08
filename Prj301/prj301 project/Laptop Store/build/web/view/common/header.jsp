<%-- 
    Document   : header
    Created on : Feb 26, 2025, 4:45:43 PM
    Author     : hungs
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="header">
    <div class="header-top">
        <div class="container">

            <!-- End .header-left -->

            <div class="header-right header-dropdowns ml-0 ml-sm-auto w-sm-100">

                <div class="header-dropdown dropdown-expanded d-none d-lg-block">
                    <a href="#">Links</a>
                    <div class="header-menu">


                        <ul>
                            <c:if test="${user != null}">
                                <c:if test="${user.roleID == 2}">
                                    <li><a href="${pageContext.request.contextPath}/dashboard">Tài khoản</a></li>
                                    </c:if>

                                <c:if test="${user.roleID == 1}">
                                    <li><a href="${pageContext.request.contextPath}/admin/dashboard">Admin</a></li>
                                    </c:if>
                                </c:if>

<!--                            <li><a href="${pageContext.request.contextPath}/view/page/wishlist.jsp">Yêu thích</a></li>-->
                            <li><a href="${pageContext.request.contextPath}/cart">Giỏ hàng</a></li>
                                <c:choose>
                                    <c:when test="${user == null}">
                                    <li><a href="${pageContext.request.contextPath}/authen?action=login">Đăng nhập</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li><a href="${pageContext.request.contextPath}/authen?action=logout">Đăng xuất</a></li>
                                    </c:otherwise>
                                </c:choose>
                        </ul>
                    </div>
                    <!-- End .header-menu -->
                </div>
                <!-- End .header-dropown -->

                <span class="separator"></span>

                <div class="header-dropdown">
                    <a href="#"><i class="flag-vn flag"></i>VN</a>
                    <div class="header-menu">
                        <ul>
                            <li><a href="#"><i class="flag-vn flag mr-2"></i>VN</a></li>
                            <li><a href="#"><i class="flag-us flag mr-2"></i>ENG</a>
                            </li>

                        </ul>
                    </div>
                    <!-- End .header-menu -->
                </div>
                <!-- End .header-dropown -->

                <div class="header-dropdown mr-auto mr-sm-3 mr-md-0">
                    <a href="#">VNĐ</a>
                    <div class="header-menu">
                        <ul>
                            <li><a href="#">VNĐ</a></li>
                            <li><a href="#">USD</a></li>
                        </ul>
                    </div>
                    <!-- End .header-menu -->
                </div>
                <!-- End .header-dropown -->

                <span class="separator"></span>

                <div class="social-icons">
                    <a href="#" class="social-icon social-facebook icon-facebook" target="_blank"></a>
                    <a href="#" class="social-icon social-twitter icon-twitter" target="_blank"></a>
                    <a href="#" class="social-icon social-instagram icon-instagram" target="_blank"></a>
                </div>
                <!-- End .social-icons -->
            </div>
            <!-- End .header-right -->
        </div>
        <!-- End .container -->
    </div>
    <!-- End .header-top -->

    <div class="header-middle sticky-header" data-sticky-options="{'mobile': true}">
        <div class="container">
            <div class="header-left col-lg-2 w-auto pl-0">
                <button class="mobile-menu-toggler text-primary mr-2" type="button">
                    <i class="fas fa-bars"></i>
                </button>

                <a href="${pageContext.request.contextPath}/home" class="logo">
                    <img src="${pageContext.request.contextPath}/assets/images/logo.png" width="111" height="44" alt="Porto Logo">
                </a>
            </div>
            <!-- End .header-left -->

            <div class="header-right w-lg-max">
                <div class="header-icon header-search header-search-inline header-search-category w-lg-max text-right mt-0">
                    <a href="#" class="search-toggle" role="button"><i class="icon-search-3"></i></a>

                    <!--                    form search -->
                    <form action="category?" method="get">
                        <input type="hidden" name="search" value="searchByKeyword" />
                        <div class="header-search-wrapper">
                            <input type="search" class="form-control" name="keyword" id="q" placeholder="Tìm kiếm sản phẩm..." required>

                            <button class="btn icon-magnifier p-0" title="search" type="submit"></button>
                        </div>
                        <!-- End .header-search-wrapper -->
                    </form>
                </div>
                <!-- End .header-search -->

<!--                <div class="header-contact d-none d-lg-flex pl-4 pr-4">
                    <img alt="phone" src="${pageContext.request.contextPath}/assets/images/phone.png" width="30" height="30" class="pb-1">
                    <h6><span>Gọi ngay</span><a href="tel:84327715098" class="text-dark font1">0123456789</a></h6>
                </div>-->

                <a href="${pageContext.request.contextPath}/authen?action=login" class="header-icon" title="login"><i class="icon-user-2"></i></a>

<!--                <a href="${pageContext.request.contextPath}/view/page/wishlist.jsp" class="header-icon" title="wishlist"><i class="icon-wishlist-2"></i></a>-->

                <div class="dropdown cart-dropdown">
                    <a href="${pageContext.request.contextPath}/cart" title="Cart">
                        <i class="minicart-icon"></i>
                        <!--                        <span class="cart-count badge-circle">3</span>-->
                    </a>

                    <div class="cart-overlay"></div>


                    <!-- End .dropdown-menu -->
                </div>
                <!-- End .dropdown -->
            </div>
            <!-- End .header-right -->
        </div>
        <!-- End .container -->
    </div>
    <!-- End .header-middle -->

    <div class="header-bottom sticky-header d-none d-lg-block" data-sticky-options="{'mobile': false}">
        <div class="container">
            <nav class="main-nav w-100">
                <ul class="menu">
                    <li class="active">
                        <a href="${pageContext.request.contextPath}/home">TRANG CHỦ</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/category">DANH MỤC</a>
                        <div class="megamenu megamenu-fixed-width megamenu-3cols">
                            <div class="row">
                                <div class="col-lg-6">
                                    <a href="#" class="nolink">Thương hiệu</a>
                                    <ul class="submenu">
                                        <c:forEach var="b" items="${brandList}">
                                            <li><a href="${pageContext.request.contextPath}/category?search=brand&brandID=${b.brandID}">${b.brandName}</a></li>
                                            </c:forEach>

                                    </ul>
                                </div>
                                <div class="col-lg-6">
                                    <a href="#" class="nolink">Nhu cầu</a>
                                    <ul class="submenu">
                                        <c:forEach var="c" items="${categoryList}">
                                            <li><a href="${pageContext.request.contextPath}/category?search=category&categoryID=${c.categoryID}">${c.categoryName}</a></li>
                                            </c:forEach>
                                    </ul>
                                </div>

                            </div>
                        </div>
                        <!-- End .megamenu -->
                    </li>
                    <li>

                        <a href="${pageContext.request.contextPath}/products?productID=1">SẢN PHẨM</a>

                        <!-- End .megamenu -->
                    </li>
                    <li>
                        <a href="#">Trang</a>
                        <ul>

                            <li><a href="${pageContext.request.contextPath}/cart">Giỏ hàng</a></li>

                            <li><a href="${pageContext.request.contextPath}/dashboard">Tài khoản</a></li>
                            <li><a href="${pageContext.request.contextPath}/authen?action=login">Đăng nhập</a></li>
<!--                            <li><a href="forgot-password.jsp">Quên mật khẩu</a></li>-->
                        </ul>
                    </li>


                    <li><a href="${pageContext.request.contextPath}/view/page/contact.jsp">LIÊN HỆ</a></li>

                </ul>
            </nav>
        </div>
        <!-- End .container -->
    </div>
    <!-- End .header-bottom -->
</header>
