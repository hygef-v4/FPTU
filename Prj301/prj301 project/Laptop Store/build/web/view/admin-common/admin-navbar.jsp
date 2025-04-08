<%-- 
    Document   : admin-navbar
    Created on : Mar 18, 2025, 12:14:38 AM
    Author     : hungs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="main-nav">
        <!-- Sidebar Logo -->




        <div class="scrollbar" data-simplebar>
            <ul class="navbar-nav" id="navbar-nav">                                 
                <li class="nav-item">
                    <a
                        class="nav-link menu-arrow"
                        href="#sidebarEcommerce"

                        role="button"

                        aria-controls="sidebarEcommerce"
                        >
                        <span class="nav-icon">
                            <iconify-icon
                                icon="iconamoon:shopping-bag-duotone"
                                ></iconify-icon>
                        </span>
                        <span class="nav-text"> Admin </span>
                    </a>
                    <div id="sidebarEcommerce">
                        <ul class="nav sub-navbar-nav">
                            <li class="sub-nav-item">
                                <a
                                    class="sub-nav-link"
                                    href="${pageContext.request.contextPath}/admin/dashboard"
                                    >Sản phẩm</a
                                >
                            </li>

                            

<!--                            <li class="sub-nav-item">
                                <a
                                    class="sub-nav-link"
                                    href="apps-ecommerce-customer-list.html"
                                    >Khách hàng</a
                                >
                            </li>-->



                            <li class="sub-nav-item">
                                <a
                                    class="sub-nav-link"
                                    href="${pageContext.request.contextPath}/admin/dashboard?action=order-list"

                                    >Đơn hàng</a
                                >
                            </li>



                        </ul>
                    </div>
                </li>

                <!-- end Demo Menu Item -->

            </ul>
        </div>
    </div>
</html>
