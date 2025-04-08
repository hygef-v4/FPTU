<%-- 
    Document   : admin-header
    Created on : Mar 17, 2025, 11:32:31 PM
    Author     : hungs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <header class="topbar">
        <div class="container-xxl">
            <div class="navbar-header">
                <div class="d-flex align-items-center gap-2">
                    <!-- Menu Toggle Button -->
                    <div class="topbar-item">
                        <button type="button" class="button-toggle-menu">
                            <iconify-icon
                                icon="iconamoon:menu-burger-horizontal"
                                class="fs-22"
                                ></iconify-icon>
                        </button>
                    </div>

                    <!-- App Search-->
                    <form class="app-search d-none d-md-block me-auto">
                        <div class="position-relative">
                            <input
                                type="search"
                                class="form-control"
                                placeholder="Search..."
                                autocomplete="off"
                                value=""
                                />
                            <iconify-icon
                                icon="iconamoon:search-duotone"
                                class="search-widget-icon"
                                ></iconify-icon>
                        </div>
                    </form>
                </div>

                <div class="d-flex align-items-center gap-1">
                    <!-- Theme Color (Light/Dark) -->
                    <div class="topbar-item">
                        <button
                            type="button"
                            class="topbar-button"
                            id="light-dark-mode"
                            >
                            <iconify-icon
                                icon="iconamoon:mode-dark-duotone"
                                class="fs-24 align-middle"
                                ></iconify-icon>
                        </button>
                    </div>




                    <!-- Theme Setting -->
                    <div class="topbar-item">
                        <button
                            type="button"
                            class="topbar-button"
                            id="theme-settings-btn"
                            data-bs-toggle="offcanvas"
                            data-bs-target="#theme-settings-offcanvas"
                            aria-controls="theme-settings-offcanvas"
                            >
                            <iconify-icon
                                icon="iconamoon:settings-duotone"
                                class="fs-24 align-middle"
                                ></iconify-icon>
                        </button>
                    </div>



                    <!-- User -->
                    <div class="dropdown topbar-item">
                        <a
                            type="button"
                            class="topbar-button"
                            id="page-header-user-dropdown"
                            data-bs-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false"
                            >
                            <span class="d-flex align-items-center">
                                <img
                                    class="rounded-circle"
                                    width="32"
                                    src="${pageContext.request.contextPath}/admin-assets/images/users/avatar-1.jpg"
                                    alt="avatar-3"
                                    />
                            </span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end">
                            <!-- item-->
                            <h6 class="dropdown-header">Welcome ${user.username}!</h6>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/dashboard">
                                <i
                                    class="bx bx-user-circle text-muted fs-18 align-middle me-1"
                                    ></i
                                ><span class="align-middle">Profile</span>
                            </a>


                            <div class="dropdown-divider my-1"></div>

                            <a
                                class="dropdown-item text-danger"
                                href="${pageContext.request.contextPath}/authen?action=logout"
                                >
                                <i class="bx bx-log-out fs-18 align-middle me-1"></i
                                ><span class="align-middle">Đăng xuất</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Alert Messages -->
            <c:if test="${not empty sessionScope.updateProductMessage}">
                <div class="alert alert-success alert-dismissible fade show mt-2" role="alert">
                    ${sessionScope.updateProductMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <c:remove var="updateProductMessage" scope="session"/>
            </c:if>

            <c:if test="${not empty sessionScope.deleteProductMessage}">
                <div class="alert alert-success alert-dismissible fade show mt-2" role="alert">
                    ${sessionScope.deleteProductMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <c:remove var="deleteProductMessage" scope="session"/>
            </c:if>

            <c:if test="${not empty sessionScope.addProductMessage}">
                <div class="alert alert-success alert-dismissible fade show mt-2" role="alert">
                    ${sessionScope.addProductMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <c:remove var="addProductMessage" scope="session"/>
            </c:if>
        </div>
        <script>
            setTimeout(function () {
                let alerts = document.querySelectorAll(".alert");
                alerts.forEach(function (alert) {
                    alert.classList.add("fade");
                    setTimeout(() => alert.remove(), 500);
                });
            }, 3000); // Hides after 3 seconds
        </script>

    </header>
</html>
