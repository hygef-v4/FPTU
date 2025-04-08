<%-- 
    Document   : order
    Created on : Mar 23, 2025, 8:36:40 PM
    Author     : hungs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">



    <head>
        <!-- Title Meta -->
        <meta charset="utf-8" />
        <title>Danh sách đơn hàng</title>
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
        <script src="${pageContext.request.contextPath}/admin-assets//js/config.js"></script>
        <style>
            .custom-dropdown {
                width: 140px; /* Set width */
                border-radius: 8px; /* Rounded corners */
                padding: 8px; /* Space inside */
                background: white;
                border: 1px solid #ddd;
                cursor: pointer;
                transition: all 0.3s ease-in-out;
            }

            .custom-dropdown:focus {
                border-color: #28a745;
                box-shadow: 0 0 5px rgba(40, 167, 69, 0.5);
            }

            .custom-dropdown option {
                padding: 10px;
                font-size: 16px;
            }

            .custom-dropdown option[value="true"] {
                background-color: #d4edda;
                color: #155724;
            }

            .custom-dropdown option[value="false"] {
                background-color: #f8d7da;
                color: #721c24;
            }
            .badge {
                font-size: 12px;
                padding: 8px 10px;
                border-radius: 8px;
                font-weight: bold;
                text-transform: uppercase;
            }
            .table-responsive {
                overflow-x: hidden !important;  /* Hide horizontal scroll */
                white-space: nowrap;            /* Prevent text wrapping */
            }


        </style>
    </head>
    <body>
        <!-- START Wrapper -->
        <div class="wrapper">
            <!-- ========== Topbar Start ========== -->
            <jsp:include page="/view/admin-common/admin-header.jsp"></jsp:include>

                <!-- Activity Timeline -->
                <div>
                    <div
                        class="offcanvas offcanvas-end border-0"
                        tabindex="-1"
                        id="theme-activity-offcanvas"
                        style="max-width: 450px; width: 100%"
                        >
                        <div class="d-flex align-items-center bg-primary p-3 offcanvas-header">
                            <h5 class="text-white m-0 fw-semibold">Activity Stream</h5>
                            <button
                                type="button"
                                class="btn-close btn-close-white ms-auto"
                                data-bs-dismiss="offcanvas"
                                aria-label="Close"
                                ></button>
                        </div>

                        <div class="offcanvas-body p-0">
                            <div data-simplebar class="h-100 p-4">
                                <div class="position-relative ms-2">
                                    <span
                                        class="position-absolute start-0 top-0 border border-dashed h-100"
                                        ></span>
                                    <div class="position-relative ps-4">
                                        <div class="mb-4">
                                            <span
                                                class="position-absolute start-0 avatar-sm translate-middle-x bg-danger d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"
                                                ><iconify-icon
                                                    icon="iconamoon:folder-check-duotone"
                                                    ></iconify-icon
                                                ></span>
                                            <div class="ms-2">
                                                <h5
                                                    class="mb-1 text-dark fw-semibold fs-15 lh-base"
                                                    >
                                                    Report-Fix / Update
                                                </h5>
                                                <p class="d-flex align-items-center">
                                                    Add 3 files to
                                                    <span
                                                        class="d-flex align-items-center text-primary ms-1"
                                                        ><iconify-icon
                                                            icon="iconamoon:file-light"
                                                            ></iconify-icon>
                                                        Tasks</span
                                                    >
                                                </p>
                                                <div
                                                    class="bg-light bg-opacity-50 rounded-2 p-2"
                                                    >
                                                    <div class="row">
                                                        <div
                                                            class="col-lg-6 border-end border-light"
                                                            >
                                                            <div
                                                                class="d-flex align-items-center gap-2"
                                                                >
                                                                <i
                                                                    class="bx bxl-figma fs-20 text-red"
                                                                    ></i>
                                                                <a
                                                                    href="#!"
                                                                    class="text-dark fw-medium"
                                                                    >Concept.fig</a
                                                                >
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <div
                                                                class="d-flex align-items-center gap-2"
                                                                >
                                                                <i
                                                                    class="bx bxl-file-doc fs-20 text-success"
                                                                    ></i>
                                                                <a
                                                                    href="#!"
                                                                    class="text-dark fw-medium"
                                                                    >reback.docs</a
                                                                >
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <h6 class="mt-2 text-muted">
                                                    Monday , 4:24 PM
                                                </h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="position-relative ps-4">
                                        <div class="mb-4">
                                            <span
                                                class="position-absolute start-0 avatar-sm translate-middle-x bg-success d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"
                                                ><iconify-icon
                                                    icon="iconamoon:check-circle-1-duotone"
                                                    ></iconify-icon
                                                ></span>
                                            <div class="ms-2">
                                                <h5
                                                    class="mb-1 text-dark fw-semibold fs-15 lh-base"
                                                    >
                                                    Project Status
                                                </h5>
                                                <p class="d-flex align-items-center mb-0">
                                                    Marked<span
                                                        class="d-flex align-items-center text-primary mx-1"
                                                        ><iconify-icon
                                                            icon="iconamoon:file-light"
                                                            ></iconify-icon>
                                                        Design
                                                    </span>
                                                    as
                                                    <span
                                                        class="badge bg-success-subtle text-success px-2 py-1 ms-1"
                                                        >
                                                        Completed</span
                                                    >
                                                </p>
                                                <div
                                                    class="d-flex align-items-center gap-3 mt-1 bg-light bg-opacity-50 p-2 rounded-2"
                                                    >
                                                    <a href="#!" class="fw-medium text-dark"
                                                       >UI/UX Figma Design</a
                                                    >
                                                    <div class="ms-auto">
                                                        <a
                                                            href="#!"
                                                            class="fw-medium text-primary fs-18"
                                                            data-bs-toggle="tooltip"
                                                            data-bs-title="Download"
                                                            data-bs-placement="bottom"
                                                            ><iconify-icon
                                                                icon="iconamoon:cloud-download-duotone"
                                                                ></iconify-icon
                                                            ></a>
                                                    </div>
                                                </div>
                                                <h6 class="mt-3 text-muted">
                                                    Monday , 3:00 PM
                                                </h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="position-relative ps-4">
                                        <div class="mb-4">
                                            <span
                                                class="position-absolute start-0 avatar-sm translate-middle-x bg-primary d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-16"
                                                >UI</span
                                            >
                                            <div class="ms-2">
                                                <h5 class="mb-1 text-dark fw-semibold fs-15">
                                                    Reback Application UI v2.0.0
                                                    <span
                                                        class="badge bg-primary-subtle text-primary px-2 py-1 ms-1"
                                                        >
                                                        Latest</span
                                                    >
                                                </h5>
                                                <p>
                                                    Get access to over 20+ pages including a
                                                    dashboard layout, charts, kanban board,
                                                    calendar, and pre-order E-commerce &
                                                    Marketing pages.
                                                </p>
                                                <div class="mt-2">
                                                    <a href="#!" class="btn btn-light btn-sm"
                                                       >Download Zip</a
                                                    >
                                                </div>
                                                <h6 class="mt-3 text-muted">
                                                    Monday , 2:10 PM
                                                </h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="position-relative ps-4">
                                        <div class="mb-4">
                                            <span
                                                class="position-absolute start-0 translate-middle-x bg-success bg-gradient d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"
                                                ><img
                                                    src="${pageContext.request.contextPath}/admin-assets//images/users/avatar-7.jpg"
                                                alt="avatar-5"
                                                class="avatar-sm rounded-circle"
                                                /></span>
                                        <div class="ms-2">
                                            <h5
                                                class="mb-0 text-dark fw-semibold fs-15 lh-base"
                                                >
                                                Alex Smith Attached Photos
                                            </h5>
                                            <div class="row g-2 mt-2">
                                                <div class="col-lg-4">
                                                    <a href="#!">
                                                        <img
                                                            src="${pageContext.request.contextPath}/admin-assets//images/small/img-6.jpg"
                                                            alt=""
                                                            class="img-fluid rounded"
                                                            />
                                                    </a>
                                                </div>
                                                <div class="col-lg-4">
                                                    <a href="#!">
                                                        <img
                                                            src="${pageContext.request.contextPath}/admin-assets//images/small/img-3.jpg"
                                                            alt=""
                                                            class="img-fluid rounded"
                                                            />
                                                    </a>
                                                </div>
                                                <div class="col-lg-4">
                                                    <a href="#!">
                                                        <img
                                                            src="${pageContext.request.contextPath}/admin-assets//images/small/img-4.jpg"
                                                            alt=""
                                                            class="img-fluid rounded"
                                                            />
                                                    </a>
                                                </div>
                                            </div>
                                            <h6 class="mt-3 text-muted">Monday 1:00 PM</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="position-relative ps-4">
                                    <div class="mb-4">
                                        <span
                                            class="position-absolute start-0 translate-middle-x bg-success bg-gradient d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"
                                            ><img
                                                src="${pageContext.request.contextPath}/admin-assets//images/users/avatar-6.jpg"
                                                alt="avatar-5"
                                                class="avatar-sm rounded-circle"
                                                /></span>
                                        <div class="ms-2">
                                            <h5
                                                class="mb-0 text-dark fw-semibold fs-15 lh-base"
                                                >
                                                Rebecca J. added a new team member
                                            </h5>
                                            <p class="d-flex align-items-center gap-1">
                                            <iconify-icon
                                                icon="iconamoon:check-circle-1-duotone"
                                                class="text-success"
                                                ></iconify-icon>
                                            Added a new member to Front Dashboard
                                            </p>
                                            <h6 class="mt-3 text-muted">Monday 10:00 AM</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="position-relative ps-4">
                                    <div class="mb-4">
                                        <span
                                            class="position-absolute start-0 avatar-sm translate-middle-x bg-warning d-inline-flex align-items-center justify-content-center rounded-circle text-light fs-20"
                                            ><iconify-icon
                                                icon="iconamoon:certificate-badge-duotone"
                                                ></iconify-icon
                                            ></span>
                                        <div class="ms-2">
                                            <h5
                                                class="mb-0 text-dark fw-semibold fs-15 lh-base"
                                                >
                                                Achievements
                                            </h5>
                                            <p class="d-flex align-items-center gap-1 mt-1">
                                                Earned a
                                            <iconify-icon
                                                icon="iconamoon:certificate-badge-duotone"
                                                class="text-danger fs-20"
                                                ></iconify-icon
                                            >" Best Product Award"
                                            </p>
                                            <h6 class="mt-3 text-muted">Monday 9:30 AM</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a href="#!" class="btn btn-outline-dark w-100">View All</a>
                        </div>
                    </div>
                </div>
            </div>

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
                                    <h4 class="mb-0 fw-semibold">Danh sách đơn hàng</h4>
                                    <ol class="breadcrumb mb-0">
                                        <li class="breadcrumb-item">
                                            <a href="javascript: void(0);">Ecommerce</a>
                                        </li>
                                        <li class="breadcrumb-item active">Danh sách đơn hàng</li>
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
                                            class="d-flex flex-wrap gap-2 align-items-center justify-content-between"
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

<!--                                            <div
                                                class="d-flex flex-wrap gap-2 justify-content-end"
                                                >
                                                <div class="dropdown">
                                                    <a
                                                        href="javascript:void(0);"
                                                        class="btn btn-light dropdown-toggle"
                                                        data-bs-toggle="dropdown"
                                                        aria-expanded="false"
                                                        >
                                                        <i
                                                            class="bx bx-sort me-1"
                                                            ></i
                                                        >Filter
                                                    </a>
                                                    <div
                                                        class="dropdown-menu dropdown-menu-end"
                                                        >
                                                        <a
                                                            href="javascript:void(0);"
                                                            class="dropdown-item"
                                                            >By Date</a
                                                        >
                                                        <a
                                                            href="javascript:void(0);"
                                                            class="dropdown-item"
                                                            >By Order ID</a
                                                        >
                                                        <a
                                                            href="javascript:void(0);"
                                                            class="dropdown-item"
                                                            >By Status</a
                                                        >
                                                    </div>
                                                </div>
                                                
                                            </div>-->
                                        </div>
                                    </div>
                                    <!-- end card body -->
                                    <div class="table-responsive table-centered">
                                        <table class="table text-nowrap mb-0">
                                            <thead class="bg-light bg-opacity-50">
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Ngày đặt</th>
                                                    <th>Tên khách hàng</th>
                                                    <th>Số điện thoại</th>
                                                    <th>Địa chỉ</th>
                                                    <th>Số tiền</th>
                                                    <th>Trạng thái</th>
                                                    <th>Chi tiết</th>
                                                    <th>Hành động</th>
                                                </tr>
                                            </thead>
                                            <!-- end thead-->
                                            <tbody>
                                                <!--                                            don hang-->



                                            <c:forEach var="order" items="${sessionScope.orderListAll}">
                                                <tr>
                                                    <td>#${order.orderID}</td>
                                                    <td><fmt:formatDate value="${order.formattedDate}" pattern="yyyy-MM-dd" /></td>
                                                    <td>${order.fullname}</td> 
                                                    <td>${order.phone}</td> 
                                                    <td>${order.address}</td> 
                                                    <td><fmt:formatNumber value="${order.getTotalAmount()}" type="currency" currencySymbol="" maxFractionDigits="0" groupingUsed="true"/> đ</td>
                                                    <td>
                                                        <span class="badge ${order.status ? 'bg-success' : 'bg-danger'}">
                                                            ${order.getStatusText()}
                                                        </span>
                                                    </td>

                                                    <td>
                                                        <button class="btn btn-info" data-toggle="collapse" data-target="#details-${order.orderID}">
                                                            Xem Chi Tiết
                                                        </button>
                                                    </td>
                                                    <!-- Action Button (Change Order Status) -->

                                                    <td>
                                                        <select class="form-select status-dropdown custom-dropdown" onchange="location.href = this.value;">
                                                            <option value="#" disabled selected>${order.statusText}</option>
                                                            <option value="${pageContext.request.contextPath}/admin/dashboard?action=update-status&orderID=${order.orderID}&status=true">
                                                                ✅ Đã giao hàng
                                                            </option>
                                                            <option value="${pageContext.request.contextPath}/admin/dashboard?action=update-status&orderID=${order.orderID}&status=false">
                                                                ⏳ Đang giao hàng
                                                            </option>
                                                        </select>
                                                    </td>


                                                </tr>
                                                <!-- Order Details Section -->
                                                <!-- Order Details Collapsible Section -->


                                                <tr id="details-${order.orderID}" class="collapse">
                                                    <td colspan="8"> <!-- Span all columns -->
                                                        <div class="card card-body">
                                                            <table class="table table-bordered">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Tên sản phẩm</th>
                                                                        <th>Số Lượng</th>
                                                                        <th>Giá</th>
                                                                        <th>Tổng</th>
                                                                        <th>Ghi chú</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach var="od" items="${order.listOrderDetails}">
                                                                        <tr>
                                                                            <td>${od.getProductName(productDAO)}</td> 
                                                                            <td>${od.quantity}</td>
                                                                            <td><fmt:formatNumber value="${od.price}" type="currency" currencySymbol="" maxFractionDigits="0" groupingUsed="true"/> đ</td>
                                                                            <td><fmt:formatNumber value="${od.totalPrice}" type="currency" currencySymbol="" maxFractionDigits="0" groupingUsed="true"/> đ</td>
                                                                            <td>${order.note}</td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>

                                            </c:forEach>



                                            <!--                                            ket thuc don hang-->
                                        </tbody>
                                        <!-- end tbody -->
                                    </table>
                                    <!-- end table -->
                                </div>
                                <!-- table responsive -->
                                <div
                                    class="align-items-center justify-content-between row g-0 text-center text-sm-start p-3 border-top"
                                    >
                                    <!--                                    <div class="col-sm">
                                                                            <div class="text-muted">
                                                                                Showing
                                                                                <span class="fw-semibold">10</span>
                                                                                of
                                                                                <span class="fw-semibold"
                                                                                    >90,521</span
                                                                                >
                                                                                orders
                                                                            </div>
                                                                        </div>-->
                                    <div class="col-sm-auto mt-3 mt-sm-0">
                                        <ul
                                            class="pagination pagination-rounded m-0"
                                            >
                                            <li class="page-item">
                                                <a href="#" class="page-link"
                                                   ><i
                                                        class="bx bx-left-arrow-alt"
                                                        ></i
                                                    ></a>
                                            </li>
                                            <li class="page-item active">
                                                <a href="#" class="page-link"
                                                   >1</a
                                                >
                                            </li>
                                            <li class="page-item">
                                                <a href="#" class="page-link"
                                                   >2</a
                                                >
                                            </li>
                                            <li class="page-item">
                                                <a href="#" class="page-link"
                                                   >3</a
                                                >
                                            </li>
                                            <li class="page-item">
                                                <a href="#" class="page-link"
                                                   ><i
                                                        class="bx bx-right-arrow-alt"
                                                        ></i
                                                    ></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- end card -->
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end row -->
                </div>
                <!-- End Container -->

                <!-- ========== Footer Start ========== -->
                <jsp:include page="/view/admin-common/admin-footer.jsp"></jsp:include>

                    <!-- ========== Footer End ========== -->

                </div>
                <!-- ==================================================== -->
                <!-- End Page Content -->
                <!-- ==================================================== -->
            </div>
            <!-- END Wrapper -->

            <!-- Vendor Javascript (Require in all Page) -->
            <script src="${pageContext.request.contextPath}/admin-assets//js/vendor.js"></script>

        <!-- App Javascript (Require in all Page) -->
        <script src="${pageContext.request.contextPath}/admin-assets//js/app.js"></script>
        <!-- Bootstrap JS (Include this before closing </body>) -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>




    </body>

</html>
