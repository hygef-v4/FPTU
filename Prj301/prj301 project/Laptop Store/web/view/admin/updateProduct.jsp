<%-- 
    Document   : addProduct
    Created on : Mar 23, 2025, 7:32:29 PM
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
        <title>Cập nhật sản phẩm</title>
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
        <style>
            /* Example custom textarea styling */
            #description {
                width: 100%;              /* Make it span the full width of its container */
                min-height: 150px;        /* Set a minimum height; adjust as needed */
                padding: 10px;            /* Spacing inside the textarea */
                margin-top: 5px;          /* Spacing above the textarea (optional) */

                font-size: 1rem;          /* Font size */
                line-height: 1.5;         /* Line height for readability */
                color: #495057;           /* Text color */

                background-color: #fff;   /* Background color */
                border: 1px solid #ced4da;/* Border style */
                border-radius: 4px;       /* Rounded corners */

                /* Smooth transition for focus or hover effects */
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }

            /* Optional: Add a focus state to make the textarea stand out when clicked */
            #description:focus {
                border-color: #86b7fe;
                outline: 0;
                box-shadow: 0 0 0 0.2rem rgba(13,110,253,.25);
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
                                                    src="${pageContext.request.contextPath}/admin-assets/images/users/avatar-7.jpg"
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
                                                            src="${pageContext.request.contextPath}/admin-assets/images/small/img-6.jpg"
                                                            alt=""
                                                            class="img-fluid rounded"
                                                            />
                                                    </a>
                                                </div>
                                                <div class="col-lg-4">
                                                    <a href="#!">
                                                        <img
                                                            src="${pageContext.request.contextPath}/admin-assets/images/small/img-3.jpg"
                                                            alt=""
                                                            class="img-fluid rounded"
                                                            />
                                                    </a>
                                                </div>
                                                <div class="col-lg-4">
                                                    <a href="#!">
                                                        <img
                                                            src="${pageContext.request.contextPath}/admin-assets/images/small/img-4.jpg"
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
                                                src="${pageContext.request.contextPath}/admin-assets/images/users/avatar-6.jpg"
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
                                    <h4 class="mb-0 fw-semibold">Thêm sản phẩm</h4>
                                    <ol class="breadcrumb mb-0">
                                        <li class="breadcrumb-item">
                                            <a href="javascript: void(0);">Ecommerce</a>
                                        </li>
                                        <li class="breadcrumb-item active">Thêm sản phẩm</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        <!-- ========== Page Title End ========== -->


                        <div class="row">
                            <div class="col">
                                <div class="card" id="horizontalwizard">
                                    <div class="card-header">
                                        <ul
                                            class="nav nav-tabs card-header-tabs border-0"
                                            >
                                            <li
                                                class="nav-item"
                                                data-target-form="#generalDetailForm"
                                                >
                                                <a
                                                    href="#generalDetail"
                                                    data-bs-toggle="tab"
                                                    data-toggle="tab"
                                                    class="nav-link active pb-3"
                                                    >
                                                    <i
                                                        class="bx bxs-contact me-1"
                                                        ></i>
                                                    <span class="d-none d-sm-inline"
                                                          >Thông tin chung</span
                                                    >
                                                </a>
                                            </li>
                                            <!-- end nav item -->



                                        </ul>
                                        <!-- nav pills -->
                                    </div>
                                    <div class="card-body">
                                        <div class="tab-content pt-0">
                                            <div
                                                class="tab-pane show active"
                                                id="generalDetail"
                                                >
                                                <!--                                                form add product-->
                                                <form id="generalDetailForm" method="POST" action="${pageContext.request.contextPath}/admin/dashboard">
                                                <input type="hidden" name="productID" value="${productFind.productID}">

                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <div class="mb-3">
                                                            <label
                                                                class="form-label"
                                                                for="productName"
                                                                >Tên sản phẩm
                                                            </label>
                                                            <input
                                                                type="text"
                                                                class="form-control"
                                                                id="productName"
                                                                placeholder="Nhập tên sản phẩm"
                                                                name="product-name"
                                                                value="${productFind.productName}"
                                                                required
                                                                />
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="mb-3">
                                                            <label
                                                                class="form-label"
                                                                >Mô tả</label
                                                            >
                                                            <textarea name="description" id="description">${productFind.description}</textarea>


                                                        </div>
                                                    </div>

                                                    <div class="row" style=" min-height: 100px; /* Adjust as needed */
                                                         overflow: visible; /* Ensure content is not hidden */">
                                                        <div class="col-6">
                                                            <label
                                                                for="productSummary"
                                                                class="form-label"
                                                                >Thương hiệu</label
                                                            >
                                                            <select name="brandID" class="form-control select2">

                                                                <c:forEach var="b" items="${brandList}">
                                                                    <option value="${b.brandID}" 
                                                                            <c:if test="${b.brandID eq productFind.brandID}">selected</c:if>>
                                                                        ${b.brandName}
                                                                    </option>
                                                                </c:forEach>


                                                            </select>
                                                        </div>
                                                        <div class="col-6">
                                                            <label
                                                                for="productSummary"
                                                                class="form-label"
                                                                >Thương hiệu</label
                                                            >
                                                            <select name="catID" class="form-control select2">

                                                                <c:forEach var="c" items="${categoryList}">
                                                                    <option value="${c.categoryID}"
                                                                            <c:if test="${c.categoryID eq productFind.categoryID}">selected</c:if>>
                                                                        ${c.categoryName}
                                                                    </option>
                                                                </c:forEach>


                                                            </select>
                                                        </div>

                                                        <div class="col-6">
                                                            <br>
                                                            <label 
                                                                class="form-label"
                                                                for="quantity"
                                                                >Số lượng</label
                                                            >
                                                            <input
                                                                name="quantity"
                                                                type="number"
                                                                class="form-control"
                                                                id="quantity"
                                                                placeholder="Nhập số lượng"
                                                                value="${productFind.quantity}"
                                                                min="0"

                                                                />

                                                        </div>
                                                        <div class="col-6">
                                                            <br>
                                                            <label
                                                                class="form-label"
                                                                for="price"
                                                                >Giá tiền</label
                                                            >
                                                            <input
                                                                name="price"
                                                                type="number"
                                                                class="form-control"
                                                                id="price"
                                                                value="<fmt:formatNumber value='${productFind.price}' type='number' pattern='#'/>"

                                                                required
                                                                />
                                                        </div>


                                                        <br>


                                                        <!-- importDate -->
                                                        <div class="col-6">
                                                            <br>
                                                            <label for="importDate" class="form-label">Ngày nhập hàng</label>
                                                            <input
                                                                name="date"
                                                                type="date"
                                                                class="form-control"
                                                                id="importDate"
                                                                placeholder="YYYY-MM-DD"
                                                                value="${productFind.importDate}"

                                                                />
                                                        </div>

                                                        <!-- warrantyMonths -->
                                                        <div class="col-6">
                                                            <br>
                                                            <label for="warrantyMonths" class="form-label">Thời gian bảo hành (tháng)</label>
                                                            <input
                                                                name="warranty"
                                                                type="number"
                                                                class="form-control"
                                                                id="warrantyMonths"
                                                                placeholder="Nhập số tháng bảo hành"
                                                                value="${productFind.warrantyMonths}"
                                                                min="1"
                                                                max="12"
                                                                />
                                                        </div>





                                                        <!-- CPU -->
                                                        <div class="col-6"><br>

                                                            <label for="cpu" class="form-label">CPU</label>
                                                            <input
                                                                name="cpu"
                                                                type="text"
                                                                class="form-control"
                                                                id="cpu"
                                                                placeholder=""
                                                                value="${productDetail.cpu}"
                                                                required
                                                                />
                                                        </div>

                                                        <!-- RAM -->
                                                        <div class="col-6"><br>
                                                            <label for="ram" class="form-label">RAM</label>
                                                            <input
                                                                name="ram"
                                                                type="text"
                                                                class="form-control"
                                                                id="ram"
                                                                placeholder=""
                                                                value="${productDetail.ram}"
                                                                required
                                                                />
                                                        </div>

                                                        <!-- Storage -->
                                                        <div class="col-6"><br>
                                                            <label for="storage" class="form-label">Bộ nhớ lưu trữ</label>
                                                            <input
                                                                name="storage"
                                                                type="text"
                                                                class="form-control"
                                                                id="storage"
                                                                placeholder=""
                                                                value="${productDetail.storage}"
                                                                required
                                                                />
                                                        </div>

                                                        <!-- Screen -->
                                                        <div class="col-6"><br>
                                                            <label for="screen" class="form-label">Màn hình</label>
                                                            <input
                                                                name="screen"
                                                                type="text"
                                                                class="form-control"
                                                                id="screen"
                                                                placeholder=""
                                                                value="${productDetail.screen}"
                                                                required
                                                                />
                                                        </div>

                                                        <!-- GPU -->
                                                        <div class="col-6"><br>
                                                            <label for="gpu" class="form-label">GPU</label>
                                                            <input
                                                                name="gpu"
                                                                type="text"
                                                                class="form-control"
                                                                id="gpu"
                                                                placeholder=""
                                                                value="${productDetail.gpu}"
                                                                required
                                                                />
                                                        </div>





                                                        <!-- isFeatured -->


                                                        <div class="col-6 tab-pane" id="productImages">
                                                            <br>
                                                            <h5 class="fs-14 mb-1">Hình ảnh sản phẩm</h5>
                                                            <p class="text-muted fs-13">Thêm hình ảnh sản phẩm</p>

                                                            <!-- File Upload -->
                                                            <div class="fallback">
                                                                <input id="imageFile" type="file" accept="image/*" />
                                                            </div>

                                                            <!-- OR Paste Image URL -->
                                                            <p class="text-muted fs-13 mt-2">Hoặc dán liên kết hình ảnh</p>
                                                            <input value="${productFind.image}" id="imageURL" name="imageURL" type="text" class="form-control" placeholder="Dán URL hình ảnh tại đây" required/>

                                                            <!-- Image Preview -->
                                                            <div id="imagePreview" class="mt-3">
                                                                <img id="previewImg" src="" alt="Preview" style="max-width: 100%; display: none;">
                                                            </div>
                                                        </div>
                                                        <div class="col-6 checkbox-container">
                                                            <br>
                                                            <label for="isFeatured">Sản phẩm nổi bật</label>
                                                            <input 
                                                                name="isFeatured" 
                                                                type="checkbox" 
                                                                id="isFeatured" 
                                                                value="1"
                                                                <c:if test="${productFind.isIsFeatured()}">checked="checked"</c:if>

                                                                    />
                                                            </div>
                                                        </div>



                                                        <div class="next">
                                                            <input type="hidden" name="action" value="edit">
                                                            <br>
                                                            <button type="submit" class="btn btn-primary">
                                                                Cập nhật sản phẩm </i>
                                                            </button>
                                                        </div>


                                                    </div>



                                                </form>



                                            </div>
                                            <!-- end tab content-->
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
                <script src="${pageContext.request.contextPath}/admin-assets/js/vendor.js"></script>

            <!-- App Javascript (Require in all Page) -->
            <script src="${pageContext.request.contextPath}/admin-assets/js/app.js"></script>


            <!-- Page Js -->
            <script src="${pageContext.request.contextPath}/admin-assets/js/pages/app-ecommerce-product.js"></script>
            <script>
                document.getElementById('imageURL').addEventListener('input', function () {
                    let url = this.value.trim();
                    let previewImg = document.getElementById('previewImg');

                    if (url && (url.startsWith('http://') || url.startsWith('https://'))) {
                        previewImg.src = url;
                        previewImg.style.display = 'block';
                    } else {
                        previewImg.style.display = 'none';
                    }
                });

                document.getElementById('imageFile').addEventListener('change', function (event) {
                    let file = event.target.files[0];
                    let previewImg = document.getElementById('previewImg');
                    let imageURLInput = document.getElementById('imageURL');

                    if (file) {
                        let reader = new FileReader();
                        reader.onload = function (e) {
                            previewImg.src = e.target.result;
                            previewImg.style.display = 'block';
                            imageURLInput.value = e.target.result; // Store Base64 URL
                        };
                        reader.readAsDataURL(file);
                    }
                });
            </script>
    </body>

    <!-- Mirrored from techzaa.in/reback/admin/apps-ecommerce-product-add.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 13 Mar 2025 06:09:08 GMT -->
</html>
