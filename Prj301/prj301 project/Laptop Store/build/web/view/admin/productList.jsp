<%-- 
    Document   : dashboard
    Created on : Mar 15, 2025, 4:09:17 PM
    Author     : hungs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">

    <head>
        <!-- Title Meta -->
        <meta charset="utf-8" />
        <title>Danh sách sản phẩm</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta
            name="description"
            content="A fully responsive premium admin dashboard template"
            />
        <meta name="author" content="Techzaa" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <!-- App favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/admin-assets/images/favicon.ico" />

        <!-- Vendor css (Require in all Page) -->
        <link href="${pageContext.request.contextPath}/admin-assets/css/vendor.min.css" rel="stylesheet" type="text/css" />

        <!-- Icons css (Require in all Page) -->
        <link href="${pageContext.request.contextPath}/admin-assets/css/icons.min.css" rel="stylesheet" type="text/css" />

        <!-- App css (Require in all Page) -->
        <link href="${pageContext.request.contextPath}/admin-assets/css/app.min.css" rel="stylesheet" type="text/css" />

        <!-- Theme Config js (Require in all Page) -->
        <script src="${pageContext.request.contextPath}/admin-assets/js/config.js"></script>

    </head>

    <body>
        <!-- START Wrapper -->
        <div class="wrapper">
            <!-- ========== Topbar Start ========== -->
            <jsp:include page="/view/admin-common/admin-header.jsp"></jsp:include>




                <!-- Right Sidebar (Theme Settings) -->
                <div>
                    <div
                        class="offcanvas offcanvas-end border-0"
                        tabindex="-1"
                        id="theme-settings-offcanvas"
                        >
                        <div class="d-flex align-items-center bg-primary p-3 offcanvas-header">
                            <h5 class="text-white m-0">Theme Settings</h5>
                            <button
                                type="button"
                                class="btn-close btn-close-white ms-auto"
                                data-bs-dismiss="offcanvas"
                                aria-label="Close"
                                ></button>
                        </div>

                        <div class="offcanvas-body p-0">
                            <div data-simplebar class="h-100">
                                <div class="p-3 settings-bar">
                                    <div>
                                        <h5 class="mb-3 font-16 fw-semibold">Color Scheme</h5>

                                        <div class="form-check mb-2">
                                            <input
                                                class="form-check-input"
                                                type="radio"
                                                name="data-bs-theme"
                                                id="layout-color-light"
                                                value="light"
                                                />
                                            <label
                                                class="form-check-label"
                                                for="layout-color-light"
                                                >Light</label
                                            >
                                        </div>

                                        <div class="form-check mb-2">
                                            <input
                                                class="form-check-input"
                                                type="radio"
                                                name="data-bs-theme"
                                                id="layout-color-dark"
                                                value="dark"
                                                />
                                            <label
                                                class="form-check-label"
                                                for="layout-color-dark"
                                                >Dark</label
                                            >
                                        </div>
                                    </div>

                                    <div>
                                        <h5 class="my-3 font-16 fw-semibold">Topbar Color</h5>

                                        <div class="form-check mb-2">
                                            <input
                                                class="form-check-input"
                                                type="radio"
                                                name="data-topbar-color"
                                                id="topbar-color-light"
                                                value="light"
                                                />
                                            <label
                                                class="form-check-label"
                                                for="topbar-color-light"
                                                >Light</label
                                            >
                                        </div>
                                        <div class="form-check mb-2">
                                            <input
                                                class="form-check-input"
                                                type="radio"
                                                name="data-topbar-color"
                                                id="topbar-color-dark"
                                                value="dark"
                                                />
                                            <label
                                                class="form-check-label"
                                                for="topbar-color-dark"
                                                >Dark</label
                                            >
                                        </div>
                                    </div>

                                    <div>
                                        <h5 class="my-3 font-16 fw-semibold">Menu Color</h5>

                                        <div class="form-check mb-2">
                                            <input
                                                class="form-check-input"
                                                type="radio"
                                                name="data-menu-color"
                                                id="leftbar-color-light"
                                                value="light"
                                                />
                                            <label
                                                class="form-check-label"
                                                for="leftbar-color-light"
                                                >
                                                Light
                                            </label>
                                        </div>

                                        <div class="form-check mb-2">
                                            <input
                                                class="form-check-input"
                                                type="radio"
                                                name="data-menu-color"
                                                id="leftbar-color-dark"
                                                value="dark"
                                                />
                                            <label
                                                class="form-check-label"
                                                for="leftbar-color-dark"
                                                >
                                                Dark
                                            </label>
                                        </div>
                                    </div>

                                    <div>
                                        <h5 class="my-3 font-16 fw-semibold">Sidebar Size</h5>

                                        <div class="form-check mb-2">
                                            <input
                                                class="form-check-input"
                                                type="radio"
                                                name="data-menu-size"
                                                id="leftbar-size-default"
                                                value="default"
                                                />
                                            <label
                                                class="form-check-label"
                                                for="leftbar-size-default"
                                                >
                                                Default
                                            </label>
                                        </div>

                                        <div class="form-check mb-2">
                                            <input
                                                class="form-check-input"
                                                type="radio"
                                                name="data-menu-size"
                                                id="leftbar-size-small"
                                                value="condensed"
                                                />
                                            <label
                                                class="form-check-label"
                                                for="leftbar-size-small"
                                                >
                                                Condensed
                                            </label>
                                        </div>

                                        <div class="form-check mb-2">
                                            <input
                                                class="form-check-input"
                                                type="radio"
                                                name="data-menu-size"
                                                id="leftbar-hidden"
                                                value="hidden"
                                                />
                                            <label
                                                class="form-check-label"
                                                for="leftbar-hidden"
                                                >
                                                Hidden
                                            </label>
                                        </div>

                                        <div class="form-check mb-2">
                                            <input
                                                class="form-check-input"
                                                type="radio"
                                                name="data-menu-size"
                                                id="leftbar-size-small-hover-active"
                                                value="sm-hover-active"
                                                />
                                            <label
                                                class="form-check-label"
                                                for="leftbar-size-small-hover-active"
                                                >
                                                Small Hover Active
                                            </label>
                                        </div>

                                        <div class="form-check mb-2">
                                            <input
                                                class="form-check-input"
                                                type="radio"
                                                name="data-menu-size"
                                                id="leftbar-size-small-hover"
                                                value="sm-hover"
                                                />
                                            <label
                                                class="form-check-label"
                                                for="leftbar-size-small-hover"
                                                >
                                                Small Hover
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="offcanvas-footer border-top p-3 text-center">
                            <div class="row">
                                <div class="col">
                                    <button
                                        type="button"
                                        class="btn btn-danger w-100"
                                        id="reset-layout"
                                        >
                                        Reset
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- ========== Topbar End ========== -->

                <!-- ========== App Menu Start ========== -->
            <jsp:include page="/view/admin-common/admin-navbar.jsp"></jsp:include>

                <!-- ========== App Menu End ========== -->


                <!-- ==================================================== -->
                <!-- Start right Content here -->
                <!-- ==================================================== -->

                <div class="page-content">
                    <!-- Start Container -->
                    <div class="container-xxl">
                        <!-- ========== Page Title Start ========== -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <h4 class="mb-0 fw-semibold">Danh sách sản phẩm</h4>
                                    <ol class="breadcrumb mb-0">
                                        <li class="breadcrumb-item">
                                            <a href="javascript: void(0);">Ecommerce</a>
                                        </li>
                                        <li class="breadcrumb-item active">Danh sách sản phẩm</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        <!-- ========== Page Title End ========== -->


                        <div class="row">
                            <div class="col">
                                <div class="card">
                                    <div class="card-body">
                                        <div
                                            class="d-flex flex-wrap justify-content-between gap-3"
                                            >
                                            <div class="search-bar">
                                                <span
                                                    ><i class="bx bx-search-alt"></i
                                                    ></span>
                                                <input
                                                    type="search"
                                                    class="form-control"
                                                    id="search"
                                                    placeholder="Search ..."
                                                    />
                                            </div>
                                            <div>
                                                <a
                                                    href="${pageContext.request.contextPath}/admin/dashboard?action=add-product"
                                                class="btn btn-primary d-flex align-items-center"
                                                >
                                                <i class="bx bx-plus me-1"></i
                                                >Thêm sản phẩm
                                            </a>
                                        </div>
                                    </div>
                                    <!-- end row -->
                                </div>
                                <div>
                                    <div
                                        class="table-responsive table-centered"
                                        >
                                        <table class="table text-nowrap mb-0">
                                            <thead
                                                class="bg-light bg-opacity-50"
                                                >
                                                <tr>
                                                    <th>Tên sản phẩm</th>
                                                    <th>Danh mục</th>
                                                    <th>Giá tiền</th>
                                                    <th>Tình trạng kho</th>
                                                    <th>Hành động</th>
                                                </tr>
                                            </thead>
                                            <!-- end thead-->
                                            <tbody>

                                                <c:forEach var="p" items="${sessionScope.productList}">
                                                    <tr>
                                                        <td>
                                                            <div
                                                                class="d-flex align-items-center"
                                                                >
                                                                <div
                                                                    class="flex-shrink-0 me-3"
                                                                    >
                                                                    <a
                                                                        href="${pageContext.request.contextPath}/products?productID=${p.productID}"
                                                                        ><img
                                                                            src="${p.image}"
                                                                            alt="product-1(1)"
                                                                            class="img-fluid avatar-sm"
                                                                            /></a>
                                                                </div>
                                                                <div
                                                                    class="flex-grow-1"
                                                                    >
                                                                    <h5
                                                                        class="mt-0 mb-1"
                                                                        >
                                                                        <a
                                                                            href="${pageContext.request.contextPath}/products?productID=${p.productID}"
                                                                            class="text-reset"
                                                                            >${p.productName}</a
                                                                        >
                                                                    </h5>
                                                                    <span
                                                                        class="fs-13"
                                                                        >${p.description}</span
                                                                    >
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>${p.categoryID}</td>
                                                        <td><fmt:formatNumber value="${p.price}" type="currency" currencySymbol="₫" maxFractionDigits="0" /></td>
                                                        <td class="text-primary">

                                                            <c:choose>
                                                                <c:when test="${p.quantity == 0}">
                                                                    <span class="text-danger">Hết hàng</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    Còn ${p.quantity} sản phẩm
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>

                                                        <td>
                                                            <a href="${pageContext.request.contextPath}/admin/dashboard?action=edit&productID=${p.productID}" 
                                                               class="btn btn-sm btn-soft-secondary me-1">
                                                                <i class="bx bx-edit fs-18"></i>
                                                            </a>

                                                            <button type="button" class="btn btn-sm btn-soft-danger" 
                                                                    onclick="confirmDelete(this)" 
                                                                    data-href="${pageContext.request.contextPath}/admin/dashboard?action=delete&productID=${p.productID}">
                                                                <i class="bx bx-trash fs-18"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>

                                            </tbody>
                                            <!-- end tbody -->
                                        </table>
                                        <!-- end table -->
                                    </div>
                                    <!-- table responsive -->
                                    <div
                                        class="align-items-center justify-content-between row g-0 text-center text-sm-start p-3 border-top"
                                        >
                                        <div class="col-sm">
                                            <div class="text-muted">
                                                Showing
                                                <span class="fw-semibold"
                                                      >7</span
                                                >
                                                of
                                                <span class="fw-semibold"
                                                      >15</span
                                                >
                                                Results
                                            </div>
                                        </div>
                                        <div class="col-sm-auto mt-3 mt-sm-0">
                                            <ul
                                                class="pagination pagination-rounded m-0"
                                                >
                                                <li class="page-item">
                                                    <a
                                                        href="#"
                                                        class="page-link"
                                                        ><i
                                                            class="bx bx-left-arrow-alt"
                                                            ></i
                                                        ></a>
                                                </li>
                                                <li class="page-item active">
                                                    <a
                                                        href="#"
                                                        class="page-link"
                                                        >1</a
                                                    >
                                                </li>
                                                <li class="page-item">
                                                    <a
                                                        href="#"
                                                        class="page-link"
                                                        >2</a
                                                    >
                                                </li>
                                                <li class="page-item">
                                                    <a
                                                        href="#"
                                                        class="page-link"
                                                        >3</a
                                                    >
                                                </li>
                                                <li class="page-item">
                                                    <a
                                                        href="#"
                                                        class="page-link"
                                                        ><i
                                                            class="bx bx-right-arrow-alt"
                                                            ></i
                                                        ></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- end card body -->
                            </div>
                            <!-- end card -->
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end row -->
                </div>
                <!-- End Container -->

                <jsp:include page="/view/admin-common/admin-footer.jsp"></jsp:include>


                </div>
                <!-- ==================================================== -->
                <!-- End Page Content -->
                <!-- ==================================================== -->
            </div>
            <!-- END Wrapper -->

            <!-- Vendor Javascript (Require in all Page) -->
            <script src="${pageContext.request.contextPath}/admin-assets/js/vendor.js"></script>

        <!-- App Javascript (Require in all Page) -->
        <script src="${pageContext.request.contextPath}/admin-assets/js/app.js"></script>

        <!--        delete button-->
        <script>
                                                                        function confirmDelete(button) {
                                                                            let confirmDelete = confirm("Bạn có chắc chắn muốn xóa mục này?");
                                                                            if (confirmDelete) {
                                                                                window.location.href = button.getAttribute("data-href");
                                                                            }
                                                                        }
        </script>
    </body>

    <!-- Mirrored from techzaa.in/reback/admin/apps-ecommerce-product-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 13 Mar 2025 06:09:23 GMT -->
</html>

