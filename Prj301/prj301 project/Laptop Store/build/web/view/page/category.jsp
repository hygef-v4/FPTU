<%-- 
    Document   : category
    Created on : Feb 26, 2025, 5:47:46 PM
    Author     : hungs
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Danh mục sản phẩm</title>

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

                <main class="main">

                    <div class="container">
                        <nav aria-label="breadcrumb" class="breadcrumb-nav">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/home"><i class="icon-home"></i></a></li>
                                <li class="breadcrumb-item active" aria-current="page"><a href="#">Danh mục</a></li>

                            </ol>
                        </nav>

                        <nav class="toolbox sticky-header horizontal-filter filter-sorts" data-sticky-options="{'mobile': true}">
                            <div class="sidebar-overlay d-lg-none"></div>
                            <a href="#" class="sidebar-toggle border-0"><svg data-name="Layer 3" id="Layer_3"
                                                                             viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg">
                                <line x1="15" x2="26" y1="9" y2="9" class="cls-1"></line>
                                <line x1="6" x2="9" y1="9" y2="9" class="cls-1"></line>
                                <line x1="23" x2="26" y1="16" y2="16" class="cls-1"></line>
                                <line x1="6" x2="17" y1="16" y2="16" class="cls-1"></line>
                                <line x1="17" x2="26" y1="23" y2="23" class="cls-1"></line>
                                <line x1="6" x2="11" y1="23" y2="23" class="cls-1"></line>
                                <path d="M14.5,8.92A2.6,2.6,0,0,1,12,11.5,2.6,2.6,0,0,1,9.5,8.92a2.5,2.5,0,0,1,5,0Z"
                                      class="cls-2"></path>
                                <path d="M22.5,15.92a2.5,2.5,0,1,1-5,0,2.5,2.5,0,0,1,5,0Z" class="cls-2"></path>
                                <path d="M21,16a1,1,0,1,1-2,0,1,1,0,0,1,2,0Z" class="cls-3"></path>
                                <path d="M16.5,22.92A2.6,2.6,0,0,1,14,25.5a2.6,2.6,0,0,1-2.5-2.58,2.5,2.5,0,0,1,5,0Z"
                                      class="cls-2"></path>
                                </svg>
                                <span>Filter</span>
                            </a>

                            <aside class="toolbox-left sidebar-shop mobile-sidebar">
                                <div class="toolbox-item toolbox-sort select-custom">
                                    <a class="sort-menu-trigger" href="#">Hãng sản xuất</a>
                                    <ul class="sort-list">
                                        <li><a href="${pageContext.request.contextPath}/category">Tất cả hãng</a></li>

                                    <c:forEach var="b" items="${brandList}">
                                        <li><a href="${pageContext.request.contextPath}/category?search=brand&brandID=${b.brandID}">${b.brandName}</a></li>
                                        </c:forEach>

                                </ul>
                            </div>
                            <!-- End .toolbox-item -->

                            <div class="toolbox-item toolbox-sort select-custom">
                                <a class="sort-menu-trigger" href="#">Nhu cầu</a>
                                <ul class="sort-list">
                                    <li><a href="${pageContext.request.contextPath}/category">Tất cả sản phẩm</a></li>
                                    <c:forEach var="c" items="${categoryList}">
                                        
                                        <li><a href="${pageContext.request.contextPath}/category?search=category&categoryID=${c.categoryID}">${c.categoryName}</a></li>
                                        </c:forEach>


                                </ul>
                            </div>
                            <!-- End .toolbox-item -->

                            <div class="toolbox-item toolbox-sort price-sort select-custom">
                                <a class="sort-menu-trigger" href="#">Giá tiền</a>
                                <div class="sort-list">
                                    <div id="price-filter-form" class="filter-price-form m-0">


                                        <!-- Predefined price ranges -->
                                        <ul class="price-range-list">
                                            <!-- Tất cả -->
                                            <li><a href="${pageContext.request.contextPath}/category?search=priceRange&min_price=&max_price=">Tất cả</a></li>
                                            <!-- Dưới 10 triệu -->
                                            <li><a href="${pageContext.request.contextPath}/category?search=priceRange&min_price=0&max_price=10000000">Dưới 10 triệu</a></li>
                                            <!-- Từ 10 - 15 triệu -->
                                            <li><a href="${pageContext.request.contextPath}/category?search=priceRange&min_price=10000000&max_price=15000000">Từ 10 - 15 triệu</a></li>
                                            <!-- Từ 15 - 20 triệu -->
                                            <li><a href="${pageContext.request.contextPath}/category?search=priceRange&min_price=15000000&max_price=20000000">Từ 15 - 20 triệu</a></li>
                                            <!-- Từ 20 - 25 triệu -->
                                            <li><a href="${pageContext.request.contextPath}/category?search=priceRange&min_price=20000000&max_price=25000000">Từ 20 - 25 triệu</a></li>
                                            <!-- Từ 25 - 30 triệu -->
                                            <li><a href="${pageContext.request.contextPath}/category?search=priceRange&min_price=25000000&max_price=30000000">Từ 25 - 30 triệu</a></li>
                                            <!-- Trên 30 triệu -->
                                            <li><a href="${pageContext.request.contextPath}/category?search=priceRange&min_price=30000000&max_price=">Trên 30 triệu</a></li>
                                            <!--                                            custom price range-->


                                        </ul>

                                        <div class="border rounded p-3" style="background-color: #f8f9fa; border-color: #ddd; padding: 20px;">
                                            <p class="mb-3 font-weight-bold" style="font-size: 16px; color: #333;">Hoặc nhập khoảng giá phù hợp với bạn:</p>
                                            <form action="category" method="get">
                                                <input type="hidden" name="search" value="priceRange">

                                                <!-- Min Price Input -->
                                                <div class="mb-3" style="margin-bottom: 15px;">
                                                    <label for="min_price" class="form-label" style="display: block; font-size: 14px; color: #555;">Giá thấp nhất</label>
                                                    <input type="number" id="min_price" name="min_price" placeholder="Min Price" 
                                                           class="form-control" 
                                                           style="width: 100%; padding: 10px; border-radius: 5px; border: 1px solid #ccc;">
                                                </div>

                                                <!-- Max Price Input -->
                                                <div class="mb-3" style="margin-bottom: 15px;">
                                                    <label for="max_price" class="form-label" style="display: block; font-size: 14px; color: #555;">Giá cao nhất</label>
                                                    <input type="number" id="max_price" name="max_price" placeholder="Max Price" 
                                                           class="form-control"
                                                           style="width: 100%; padding: 10px; border-radius: 5px; border: 1px solid #ccc;">
                                                </div>

                                                <!-- Submit Button -->
                                                <button type="submit" class="btn btn-primary w-100"
                                                        style="background-color: #007bff; border-color: #007bff; padding: 10px; font-size: 14px; border-radius: 5px;">
                                                    Áp dụng
                                                </button>
                                            </form>
                                        </div>


                                    </div>

                                </div>
                            </div>
                            <!-- End .toolbox-item -->
                        </aside>
                        <!-- End .toolbox-left -->


                        <div class="toolbox-item toolbox-sort select-custom">
                            <form id="sortForm" action="${pageContext.request.contextPath}/category" method="get" style="all: unset;">
                                <input type="hidden" name="search" value="sort">
                                <select id="orderby" name="orderby" class="form-control"
                                        onchange="document.getElementById('sortForm').submit();">
                                    <option value="default" selected="selected">Sắp xếp</option>
                                    <option value="featured">Nổi bật</option>
                                    <option value="date">Sản phẩm mới</option>
                                    <option value="price">Giá thấp nhất</option>
                                    <option value="price-desc">Giá cao nhất</option>
                                </select>
                            </form>
                        </div>

                        <!-- End .toolbox-item -->

                        <div class="toolbox-item toolbox-show ml-auto">
                            <label>Hiển thị:</label>

                            <div class="select-custom">
                                <select name="count" class="form-control">
                                    <option value="20">20</option>
                                    <option value="30">30</option>
                                    <option value="40">40</option>
                                    <option value="50">50</option>
                                </select>
                            </div>
                            <!-- End .select-custom -->
                        </div>
                        <!-- End .toolbox-item -->

                        <div class="toolbox-item layout-modes">
                            <a href="category.jsp" class="layout-btn btn-grid active" title="Grid">
                                <i class="icon-mode-grid"></i>
                            </a>
                            <a href="category-list.jsp" class="layout-btn btn-list" title="List">
                                <i class="icon-mode-list"></i>
                            </a>
                        </div>
                        <!-- End .layout-modes -->
                    </nav>

                    <div class="row">
                        <c:forEach var="p" items="${productList}">
                            <div class="col-6 col-sm-4 col-md-3">
                                <div class="product-default">
                                    <figure>
                                        <a href="${pageContext.request.contextPath}/products?productID=${p.productID}">

                                            <img src="${p.image}" width="280" height="280" alt="product" />

                                        </a>

                                        <div class="label-group">
                                            <div class="product-label label-hot">HOT</div>
                                            <div class="product-label label-sale">-20%</div>
                                        </div>
                                    </figure>

                                    <div class="product-details">
                                        

                                        <h3 class="product-title"> <a href="${pageContext.request.contextPath}/products?productID=${p.productID}">${p.productName}</a>
                                        </h3>

                                        <div class="ratings-container">
                                            <div class="product-ratings">
                                                <span class="ratings" style="width:100%"></span>
                                                <!-- End .ratings -->
                                                <span class="tooltiptext tooltip-top"></span>
                                            </div>
                                            <!-- End .product-ratings -->
                                        </div>
                                        <!-- End .product-container -->

                                        <div class="price-box">
                                            <!--                                            <span class="old-price">$90.00</span>-->
                                            <span class="product-price">
                                                <fmt:formatNumber value="${p.price}" type="number" maxFractionDigits="0"/> ₫

                                            </span>
                                        </div>
                                        <!-- End .price-box -->

                                        <div class="product-action">
                                            <a href="wishlist.jsp" class="btn-icon-wish" title="wishlist"><i
                                                    class="icon-heart"></i></a>
                                            <a href="${pageContext.request.contextPath}/products?productID=${p.productID}" class="btn-icon btn-add-cart"><i
                                                    class="fa fa-arrow-right"></i><span>Mua Ngay</span></a>
                                            <a href="ajax/product-quick-view.jsp" class="btn-quickview" title="Quick View"><i
                                                    class="fas fa-external-link-alt"></i></a>
                                        </div>
                                    </div>
                                    <!-- End .product-details -->
                                </div>

                            </div>
                            <!-- End .col-sm-4 -->
                        </c:forEach>





                    </div>
                    <!-- End .row -->

<!--                    <nav class="toolbox toolbox-pagination">
                        <div class="toolbox-item toolbox-show">
                            <label>Show:</label>

                            <div class="select-custom">
                                <select name="count" class="form-control">
                                    <option value="12">12</option>
                                    <option value="24">24</option>
                                    <option value="36">36</option>
                                </select>
                            </div>
                             End .select-custom 
                        </div>
                         End .toolbox-item 

                        <ul class="pagination toolbox-item">
                            <li class="page-item disabled">
                                <a class="page-link page-link-btn" href="#"><i class="icon-angle-left"></i></a>
                            </li>
                            <li class="page-item active">
                                <a class="page-link" href="#">1 <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><span class="page-link">...</span></li>
                            <li class="page-item">
                                <a class="page-link page-link-btn" href="#"><i class="icon-angle-right"></i></a>
                            </li>
                        </ul>
                    </nav>-->
                </div>
                <!-- End .container -->

                <div class="mb-4"></div>
                <!-- margin -->
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

            <div class="mobile-menu-overlay"></div>
            <!-- End .mobil-menu-overlay -->

            <div class="mobile-menu-container">
                <div class="mobile-menu-wrapper">
                    <span class="mobile-menu-close"><i class="fa fa-times"></i></span>
                    <nav class="mobile-nav">
                        <ul class="mobile-menu">
                            <li><a href="demo4.jsp">Home</a></li>
                            <li>
                                <a href="category.jsp">Categories</a>
                                <ul>
                                    <li><a href="category.jsp">Full Width Banner</a></li>
                                    <li><a href="category-banner-boxed-slider.jsp">Boxed Slider Banner</a></li>
                                    <li><a href="category-banner-boxed-image.jsp">Boxed Image Banner</a></li>
                                    <li><a href="https://www.portotheme.com/html/porto_ecommerce/category-sidebar-left.jsp">Left Sidebar</a></li>
                                    <li><a href="category-sidebar-right.jsp">Right Sidebar</a></li>
                                    <li><a href="category-off-canvas.jsp">Off Canvas Filter</a></li>
                                    <li><a href="category-horizontal-filter1.jsp">Horizontal Filter 1</a></li>
                                    <li><a href="category.jsp">Horizontal Filter 2</a></li>
                                    <li><a href="#">List Types</a></li>
                                    <li><a href="category-infinite-scroll.jsp">Ajax Infinite Scroll<span
                                                class="tip tip-new">New</span></a></li>
                                    <li><a href="category.jsp">3 Columns Products</a></li>
                                    <li><a href="category-4col.jsp">4 Columns Products</a></li>
                                    <li><a href="category-5col.jsp">5 Columns Products</a></li>
                                    <li><a href="category-6col.jsp">6 Columns Products</a></li>
                                    <li><a href="category-7col.jsp">7 Columns Products</a></li>
                                    <li><a href="category-8col.jsp">8 Columns Products</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="product.jsp">Products</a>
                                <ul>
                                    <li>
                                        <a href="#" class="nolink">PRODUCT PAGES</a>
                                        <ul>
                                            <li><a href="product.jsp">SIMPLE PRODUCT</a></li>
                                            <li><a href="product-variable.jsp">VARIABLE PRODUCT</a></li>
                                            <li><a href="product.jsp">SALE PRODUCT</a></li>
                                            <li><a href="product.jsp">FEATURED & ON SALE</a></li>
                                            <li><a href="product-sticky-info.jsp">WIDTH CUSTOM TAB</a></li>
                                            <li><a href="product-sidebar-left.jsp">WITH LEFT SIDEBAR</a></li>
                                            <li><a href="product-sidebar-right.jsp">WITH RIGHT SIDEBAR</a></li>
                                            <li><a href="product-addcart-sticky.jsp">ADD CART STICKY</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#" class="nolink">PRODUCT LAYOUTS</a>
                                        <ul>
                                            <li><a href="product-extended-layout.jsp">EXTENDED LAYOUT</a></li>
                                            <li><a href="product-grid-layout.jsp">GRID IMAGE</a></li>
                                            <li><a href="product-full-width.jsp">FULL WIDTH LAYOUT</a></li>
                                            <li><a href="product-sticky-info.jsp">STICKY INFO</a></li>
                                            <li><a href="product-sticky-both.jsp">LEFT & RIGHT STICKY</a></li>
                                            <li><a href="product-transparent-image.jsp">TRANSPARENT IMAGE</a></li>
                                            <li><a href="product-center-vertical.jsp">CENTER VERTICAL</a></li>
                                            <li><a href="#">BUILD YOUR OWN</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">Pages<span class="tip tip-hot">Hot!</span></a>
                                <ul>
                                    <li>
                                        <a href="wishlist.jsp">Wishlist</a>
                                    </li>
                                    <li>
                                        <a href="cart.jsp">Shopping Cart</a>
                                    </li>
                                    <li>
                                        <a href="checkout.jsp">Checkout</a>
                                    </li>
                                    <li>
                                        <a href="dashboard.jsp">Dashboard</a>
                                    </li>
                                    <li>
                                        <a href="login.jsp">Login</a>
                                    </li>
                                    <li>
                                        <a href="forgot-password.jsp">Forgot Password</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="blog.jsp">Blog</a></li>
                            <li><a href="#">Elements</a>
                                <ul class="custom-scrollbar">
                                    <li><a href="element-accordions.jsp">Accordion</a></li>
                                    <li><a href="element-alerts.jsp">Alerts</a></li>
                                    <li><a href="element-animations.jsp">Animations</a></li>
                                    <li><a href="element-banners.jsp">Banners</a></li>
                                    <li><a href="element-buttons.jsp">Buttons</a></li>
                                    <li><a href="element-call-to-action.jsp">Call to Action</a></li>
                                    <li><a href="element-countdown.jsp">Count Down</a></li>
                                    <li><a href="element-counters.jsp">Counters</a></li>
                                    <li><a href="element-headings.jsp">Headings</a></li>
                                    <li><a href="element-icons.jsp">Icons</a></li>
                                    <li><a href="element-info-box.jsp">Info box</a></li>
                                    <li><a href="element-posts.jsp">Posts</a></li>
                                    <li><a href="element-products.jsp">Products</a></li>
                                    <li><a href="element-product-categories.jsp">Product Categories</a></li>
                                    <li><a href="element-tabs.jsp">Tabs</a></li>
                                    <li><a href="element-testimonial.jsp">Testimonials</a></li>
                                </ul>
                            </li>
                        </ul>

                        <ul class="mobile-menu mt-2 mb-2">
                            <li class="border-0">
                                <a href="#">
                                    Special Offer!
                                </a>
                            </li>
                            <li class="border-0">
                                <a href="#" target="_blank">
                                    Buy Porto!
                                    <span class="tip tip-hot">Hot</span>
                                </a>
                            </li>
                        </ul>

                        <ul class="mobile-menu">
                            <li><a href="login.jsp">My Account</a></li>
                            <li><a href="contact.jsp">Contact Us</a></li>
                            <li><a href="blog.jsp">Blog</a></li>
                            <li><a href="wishlist.jsp">My Wishlist</a></li>
                            <li><a href="cart.jsp">Cart</a></li>
                            <li><a href="login.jsp" class="login-link">Log In</a></li>
                        </ul>
                    </nav>
                    <!-- End .mobile-nav -->

                    <form class="search-wrapper mb-2" action="#">
                        <input type="text" class="form-control mb-0" placeholder="Search..." required />
                        <button class="btn icon-search text-white bg-transparent p-0" type="submit"></button>
                    </form>

                    <div class="social-icons">
                        <a href="#" class="social-icon social-facebook icon-facebook" target="_blank">
                        </a>
                        <a href="#" class="social-icon social-twitter icon-twitter" target="_blank">
                        </a>
                        <a href="#" class="social-icon social-instagram icon-instagram" target="_blank">
                        </a>
                    </div>
                </div>
                <!-- End .mobile-menu-wrapper -->
            </div>
            <!-- End .mobile-menu-container -->

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
        <script src="${pageContext.request.contextPath}/assets/js/nouislider.min.js"></script>

        <!-- Main JS File -->
        <script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>

        <!--        script to assign price value-->
        <!--        <script>
                    document.querySelectorAll('.price-range-link').forEach(link => {
                        link.addEventListener('click', function (event) {
                            event.preventDefault(); // Prevent default link behavior
        
                            // Get min and max values from the link's data attributes
                            const minPrice = this.getAttribute('data-min');
                            const maxPrice = this.getAttribute('data-max');
        
                            // Set the hidden input values
                            document.getElementById('min_price').value = minPrice;
                            document.getElementById('max_price').value = maxPrice;
        
                            // Optionally, submit the form automatically
                            document.getElementById('price-filter-form').submit();
                        });
                    });
        
                </script>-->
    </body>


    <!-- Mirrored from portotheme.com/html/porto_ecommerce/category-horizontal-filter2.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Feb 2025 03:28:15 GMT -->
</html>
