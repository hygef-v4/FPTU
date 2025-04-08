<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">

    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Sản phẩm</title> <!-- Vietnamese title -->

        <meta name="keywords" content="HTML5 Template, Vietnamese" />
        <meta name="description" content="Porto - Bootstrap eCommerce Template">
        <meta name="author" content="SW-THEMES">

        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/icons/favicon.png">

        <script>
            WebFontConfig = {
                google: {
                    families: ['Roboto:400,700&subset=vietnamese', 'Noto+Sans:400,700&subset=vietnamese'] // Vietnamese subsets
                }
            };
            (function (d) {
                var wf = d.createElement('script'),
                        s = d.scripts[0];
                wf.src = '${pageContext.request.contextPath}/assets/js/webfont.js';
                wf.async = true;
                s.parentNode.insertBefore(wf, s);
            })(document);
        </script>

        <!-- Plugins CSS File -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

        <!-- Main CSS File -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demo4.min.css">
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
                                <li class="breadcrumb-item"><a href="#">Sản phẩm</a></li>
                            </ol>
                        </nav>

                        <div class="product-single-container product-single-default">
                            <div class="cart-message d-none">
                                <strong class="single-cart-notice">“${product.productName}”</strong>
                            <span>đã được thêm vào giỏ hàng.</span>
                        </div>

                        <div class="row">
                            <div class="col-lg-5 col-md-6 product-single-gallery">
                                <div class="product-slider-container">
                                    <div class="label-group">
                                        <div class="product-label label-hot">HOT</div>

                                        <div class="product-label label-sale">
                                            -16%
                                        </div>
                                    </div>

                                    <div class="product-single-carousel owl-carousel owl-theme show-nav-hover">
                                        <div class="product-item">
                                            <img class="product-single-image" src="${product.image}" data-zoom-image="${product.image}" width="468" height="468" alt="product" />
                                        </div>


                                    </div>
                                    <!-- End .product-single-carousel -->
                                    <span class="prod-full-screen">
                                        <i class="icon-plus"></i>
                                    </span>
                                </div>


                            </div>
                            <!-- End .product-single-gallery -->

                            <div class="col-lg-7 col-md-6 product-single-details">
                                <h1 class="product-title">${product.productName}</h1>

                                <div class="product-nav">
                                    <div class="product-prev">
                                        <a href="#">
                                            <span class="product-link"></span>

                                            <span class="product-popup">
                                                <span class="box-content">
                                                    <img alt="product" width="150" height="150"
                                                         src="${product.image}"
                                                         style="padding-top: 0px;">

                                                    <span>Circled Ultimate 3D Speaker</span>
                                                </span>
                                            </span>
                                        </a>
                                    </div>

                                    <div class="product-next">
                                        <a href="#">
                                            <span class="product-link"></span>

                                            <span class="product-popup">
                                                <span class="box-content">
                                                    <img alt="product" width="150" height="150"
                                                         src="${pageContext.request.contextPath}/assets/images/products/product-4.jpg"
                                                         style="padding-top: 0px;">

                                                    <span>Blue Backpack for the Young</span>
                                                </span>
                                            </span>
                                        </a>
                                    </div>
                                </div>

                                <div class="ratings-container">
                                    <div class="product-ratings">
                                        <span class="ratings" style="width:80%"></span>
                                        <!-- End .ratings -->
                                        <span class="tooltiptext tooltip-top"></span>
                                    </div>
                                    <!-- End .product-ratings -->

                                    <a href="#" class="rating-link">( 6 Reviews )</a>
                                </div>
                                <!-- End .ratings-container -->

                                <hr class="short-divider">

                                <div class="price-box">
                                    <!--                                    <span class="old-price">$1,999.00</span>-->
                                    <span class="new-price">
                                        <fmt:formatNumber value="${product.price}" type="number" maxFractionDigits="0"/> ₫
                                    </span>


                                </div>
                                <!-- End .price-box -->

                                <div class="product-desc">
                                    <p>
                                        ${product.description}
                                    </p>
                                </div>
                                <!-- End .product-desc -->

                                <ul class="single-info-list">

                                    <li>
                                        <c:choose>
                                            <c:when test="${product.quantity == 0}">
                                                Kho: <strong style="color: red;"> Hết hàng</strong>
                                            </c:when>
                                            <c:otherwise>
                                                Kho: <strong> ${product.quantity}</strong>
                                            </c:otherwise>
                                        </c:choose>

                                    </li>

                                    <li>
                                        Danh mục: <strong><a href="#" class="product-category">${categoryName}</a></strong>
                                    </li>

                                    <li>
                                        Brand: <strong><a href="#" class="product-category">${brandName}</a></strong>

                                    </li>
                                    
                                </ul>

                                <div class="product-action">

                                    <!-- End .product-single-qty -->

                                    <div class="product-add-form">
                                        <form action="cart?action=add-product" method="POST">
                                            <!-- Ensure product ID is properly set -->
                                            <input type="hidden" name="productID" value="${product.productID}"/>

                                            <div class="product-single-qty">
                                                <input class="horizontal-quantity form-control" type="number" name="quantity" value="1">
                                            </div> 
                                            <br>

                                            <a style="color: white" class="btn btn-dark add-cart mr-2" title="Add to Cart" onclick="return this.closest('form').submit();">
                                                Thêm Vào Giỏ Hàng
                                            </a>
                                            <a href="cart.jsp" class="btn btn-gray view-cart d-none">View cart</a>
                                        </form>
                                    </div>




                                </div>
                                <!-- End .product-action -->

                                <hr class="divider mb-0 mt-0">

                                <div class="product-single-share mb-3">
                                    <label class="sr-only">Share:</label>

                                    <div class="social-icons mr-2">
                                        <a href="#" class="social-icon social-facebook icon-facebook" target="_blank" title="Facebook"></a>
                                        <a href="#" class="social-icon social-twitter icon-twitter" target="_blank" title="Twitter"></a>
                                        <a href="#" class="social-icon social-linkedin fab fa-linkedin-in" target="_blank" title="Linkedin"></a>
                                        <a href="#" class="social-icon social-gplus fab fa-google-plus-g" target="_blank" title="Google +"></a>
                                        <a href="#" class="social-icon social-mail icon-mail-alt" target="_blank" title="Mail"></a>
                                    </div>
                                    <!-- End .social-icons -->

<!--                                    <a href="wishlist.html" class="btn-icon-wish add-wishlist" title="Add to Wishlist"><i
                                            class="icon-wishlist-2"></i><span>Add to
                                            Wishlist</span></a>-->
                                </div>
                                <!-- End .product single-share -->
                            </div>
                            <!-- End .product-single-details -->
                        </div>
                        <!-- End .row -->
                    </div>
                    <!-- End .product-single-container -->

                    <div class="product-single-tabs">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="product-tab-tags" data-toggle="tab" href="#product-tags-content" role="tab" aria-controls="product-tags-content" aria-selected="false">Thông số chi tiết</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " id="product-tab-desc" data-toggle="tab" href="#product-desc-content" role="tab" aria-controls="product-desc-content" aria-selected="true">Mô tả</a>
                            </li>





                            <li class="nav-item">
                                <a class="nav-link" id="product-tab-reviews" data-toggle="tab" href="#product-reviews-content" role="tab" aria-controls="product-reviews-content" aria-selected="false">Đánh giá (1)</a>
                            </li>
                        </ul>

                        <div class="tab-content">
                            <div class="tab-pane fade " id="product-desc-content" role="tabpanel" aria-labelledby="product-tab-desc">
                                <div class="product-desc-content">
                                    <p>${product.description}</p>
                                    <div class="service-description">
                                        <h2>Dịch Vụ Của Chúng Tôi</h2>
                                        <ul>
                                            <li><strong>Đa Dạng Sản Phẩm Laptop</strong> – Từ gaming, văn phòng đến cao cấp, phù hợp mọi nhu cầu.</li>
                                            <li><strong>Cấu Hình Mạnh - Giá Cả Cạnh Tranh</strong> – Đảm bảo hiệu năng cao và mức giá tốt nhất.</li>
                                            <li><strong>Sản Phẩm Chính Hãng - Bảo Hành Uy Tín</strong> – Cam kết 100% chính hãng, bảo hành từ nhà sản xuất.</li>
                                            <li><strong>Mua Sắm Dễ Dàng - Thanh Toán Linh Hoạt</strong> – Hỗ trợ nhiều hình thức thanh toán, giao hàng toàn quốc.</li>
                                        </ul>
                                        <p><strong>Khám phá ngay mẫu laptop phù hợp nhất với bạn!</strong></p>
                                    </div>


                                </div>
                                <!-- End .product-desc-content -->
                            </div>
                            <!-- End .tab-pane -->                     

                            <div class="tab-pane fade show active" id="product-tags-content" role="tabpanel" aria-labelledby="product-tab-tags">
                                <table class="table table-striped mt-2">
                                    <tbody>
                                        <tr>
                                            <th>CPU</th>
                                            <td>${productDetail.cpu}</td>
                                        </tr>

                                        <tr>
                                            <th>Ram</th>
                                            <td>${productDetail.ram}</td>
                                        </tr>

                                        <tr>
                                            <th>Bộ nhớ</th>
                                            <td>${productDetail.storage}</td>
                                        </tr>

                                        <tr>
                                            <th>Màn hình</th>
                                            <td>${productDetail.screen}</td>
                                        </tr>
                                        <tr>
                                            <th>Card đồ họa</th>
                                            <td>${productDetail.gpu}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- End .tab-pane -->

                            <div class="tab-pane fade" id="product-reviews-content" role="tabpanel" aria-labelledby="product-tab-reviews">
                                <div class="product-reviews-content">
                                    <h3 class="reviews-title">1 review</h3>

                                    <div class="comment-list">
                                        <div class="comments">
                                            <figure class="img-thumbnail">
                                                <img src="${pageContext.request.contextPath}/assets/images/blog/author.jpg" alt="author" width="80" height="80">
                                            </figure>

                                            <div class="comment-block">
                                                <div class="comment-header">
                                                    <div class="comment-arrow"></div>

                                                    <div class="ratings-container float-sm-right">
                                                        <div class="product-ratings">
                                                            <span class="ratings" style="width:60%"></span>
                                                            <!-- End .ratings -->
                                                            <span class="tooltiptext tooltip-top"></span>
                                                        </div>
                                                        <!-- End .product-ratings -->
                                                    </div>

                                                    <span class="comment-by">
                                                        <strong>Hung</strong> – April 12, 2024
                                                    </span>
                                                </div>

                                                <div class="comment-content">
                                                    <p>Excellent.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="divider"></div>

                                    <div class="add-product-review">
                                        <h3 class="review-title">Add a review</h3>

                                        <form action="#" class="comment-form m-0">
                                            <div class="rating-form">
                                                <label for="rating">Your rating <span class="required">*</span></label>
                                                <span class="rating-stars">
                                                    <a class="star-1" href="#">1</a>
                                                    <a class="star-2" href="#">2</a>
                                                    <a class="star-3" href="#">3</a>
                                                    <a class="star-4" href="#">4</a>
                                                    <a class="star-5" href="#">5</a>
                                                </span>

                                                <select name="rating" id="rating" required="" style="display: none;">
                                                    <option value="">Rate…</option>
                                                    <option value="5">Perfect</option>
                                                    <option value="4">Good</option>
                                                    <option value="3">Average</option>
                                                    <option value="2">Not that bad</option>
                                                    <option value="1">Very poor</option>
                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <label>Your review <span class="required">*</span></label>
                                                <textarea cols="5" rows="6" class="form-control form-control-sm"></textarea>
                                            </div>
                                            <!-- End .form-group -->


                                            <div class="row">
                                                <div class="col-md-6 col-xl-12">
                                                    <div class="form-group">
                                                        <label>Name <span class="required">*</span></label>
                                                        <input type="text" class="form-control form-control-sm" required>
                                                    </div>
                                                    <!-- End .form-group -->
                                                </div>

                                                <div class="col-md-6 col-xl-12">
                                                    <div class="form-group">
                                                        <label>Email <span class="required">*</span></label>
                                                        <input type="text" class="form-control form-control-sm" required>
                                                    </div>
                                                    <!-- End .form-group -->
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" id="save-name" />
                                                        <label class="custom-control-label mb-0" for="save-name">Save my
                                                            name, email, and website in this browser for the next time I
                                                            comment.</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <input type="submit" class="btn btn-primary" value="Submit">
                                        </form>
                                    </div>
                                    <!-- End .add-product-review -->
                                </div>
                                <!-- End .product-reviews-content -->
                            </div>
                            <!-- End .tab-pane -->
                        </div>
                        <!-- End .tab-content -->
                    </div>
                    <!-- End .product-single-tabs -->

                    <div class="products-section pt-0">
                        <h2 class="section-title">Sản phẩm liên quan</h2>

                        <div class="products-slider owl-carousel owl-theme dots-top dots-small">
                            <c:forEach var="p" items="${relatedProducts}">
                                <div class="product-default">
                                    <figure>
                                        <a href="${pageContext.request.contextPath}/products?productID=${p.productID}">

                                            <img src="${p.image}" width="280" height="280" alt="product">
                                        </a>
                                        <div class="label-group">
                                            <div class="product-label label-hot">HOT</div>
                                            <div class="product-label label-sale">-20%</div>
                                        </div>
                                    </figure>
                                    <div class="product-details">

                                        <h3 class="product-title">
                                            <a href="${pageContext.request.contextPath}/products?productID=${p.productID}">${p.productName}</a>
                                        </h3>
                                        <div class="ratings-container">
                                            <div class="product-ratings">
                                                <span class="ratings" style="width:80%"></span>
                                                <!-- End .ratings -->
                                                <span class="tooltiptext tooltip-top"></span>
                                            </div>
                                            <!-- End .product-ratings -->
                                        </div>
                                        <!-- End .product-container -->
                                        <div class="price-box">

                                            <span class="product-price">
                                                <fmt:formatNumber value="${p.price}" type="number" maxFractionDigits="0"/> ₫
                                            </span>
                                        </div>
                                        <!-- End .price-box -->
                                        <div class="product-action">
                                            <a href="wishlist.html" title="Wishlist" class="btn-icon-wish"><i
                                                    class="icon-heart"></i></a>
                                            <a href="${pageContext.request.contextPath}/products?productID=${p.productID}" class="btn-icon btn-add-cart"><i
                                                    class="fa fa-arrow-right"></i><span>Mua Ngay</span></a>
                                            <a href="ajax/product-quick-view.html" class="btn-quickview" title="Quick View"><i
                                                    class="fas fa-external-link-alt"></i></a>
                                        </div>
                                    </div>
                                    <!-- End .product-details -->
                                </div>
                            </c:forEach>

                        </div>
                        <!-- End .products-slider -->
                    </div>
                    <!-- End .products-section -->




                    <!-- End .row -->
                </div>
                <!-- End .container -->
            </main>
            <!-- End .main -->
            <!-- start of .footer -->
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
                            <li><a href="home.jsp">Home</a></li>
                            <li>
                                <a href="category.html">Categories</a>
                                <ul>
                                    <li><a href="category.html">Full Width Banner</a></li>
                                    <li><a href="category-banner-boxed-slider.html">Boxed Slider Banner</a></li>
                                    <li><a href="category-banner-boxed-image.html">Boxed Image Banner</a></li>
                                    <li><a href="https://www.portotheme.com/html/porto_ecommerce/category-sidebar-left.html">Left Sidebar</a></li>
                                    <li><a href="category-sidebar-right.html">Right Sidebar</a></li>
                                    <li><a href="category-off-canvas.html">Off Canvas Filter</a></li>
                                    <li><a href="category-horizontal-filter1.html">Horizontal Filter 1</a></li>
                                    <li><a href="category.html">Horizontal Filter 2</a></li>
                                    <li><a href="#">List Types</a></li>
                                    <li><a href="category-infinite-scroll.html">Ajax Infinite Scroll<span
                                                class="tip tip-new">New</span></a></li>
                                    <li><a href="category.html">3 Columns Products</a></li>
                                    <li><a href="category-4col.html">4 Columns Products</a></li>
                                    <li><a href="category-5col.html">5 Columns Products</a></li>
                                    <li><a href="category-6col.html">6 Columns Products</a></li>
                                    <li><a href="category-7col.html">7 Columns Products</a></li>
                                    <li><a href="category-8col.html">8 Columns Products</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="product.html">Products</a>
                                <ul>
                                    <li>
                                        <a href="#" class="nolink">PRODUCT PAGES</a>
                                        <ul>
                                            <li><a href="product.html">SIMPLE PRODUCT</a></li>
                                            <li><a href="product-variable.html">VARIABLE PRODUCT</a></li>
                                            <li><a href="product.html">SALE PRODUCT</a></li>
                                            <li><a href="product.html">FEATURED & ON SALE</a></li>
                                            <li><a href="product-sticky-info.html">WIDTH CUSTOM TAB</a></li>
                                            <li><a href="product-sidebar-left.html">WITH LEFT SIDEBAR</a></li>
                                            <li><a href="product-sidebar-right.html">WITH RIGHT SIDEBAR</a></li>
                                            <li><a href="product-addcart-sticky.html">ADD CART STICKY</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#" class="nolink">PRODUCT LAYOUTS</a>
                                        <ul>
                                            <li><a href="product-extended-layout.html">EXTENDED LAYOUT</a></li>
                                            <li><a href="product-grid-layout.html">GRID IMAGE</a></li>
                                            <li><a href="product-full-width.html">FULL WIDTH LAYOUT</a></li>
                                            <li><a href="product-sticky-info.html">STICKY INFO</a></li>
                                            <li><a href="product-sticky-both.html">LEFT & RIGHT STICKY</a></li>
                                            <li><a href="product-transparent-image.html">TRANSPARENT IMAGE</a></li>
                                            <li><a href="product-center-vertical.html">CENTER VERTICAL</a></li>
                                            <li><a href="#">BUILD YOUR OWN</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">Pages<span class="tip tip-hot">Hot!</span></a>
                                <ul>
<!--                                    <li>
                                        <a href="wishlist.html">Wishlist</a>
                                    </li>-->
                                    <li>
                                        <a href="cart.jsp">Shopping Cart</a>
                                    </li>
                                    <li>
                                        <a href="checkout.html">Checkout</a>
                                    </li>
                                    <li>
                                        <a href="dashboard.html">Dashboard</a>
                                    </li>
                                    <li>
                                        <a href="login.html">Login</a>
                                    </li>
                                    <li>
                                        <a href="forgot-password.html">Forgot Password</a>
                                    </li>
                                </ul>
                            </li>

                            <li><a href="#">Elements</a>
                                <ul class="custom-scrollbar">
                                    <li><a href="element-accordions.html">Accordion</a></li>
                                    <li><a href="element-alerts.html">Alerts</a></li>
                                    <li><a href="element-animations.html">Animations</a></li>
                                    <li><a href="element-banners.html">Banners</a></li>
                                    <li><a href="element-buttons.html">Buttons</a></li>
                                    <li><a href="element-call-to-action.html">Call to Action</a></li>
                                    <li><a href="element-countdown.html">Count Down</a></li>
                                    <li><a href="element-counters.html">Counters</a></li>
                                    <li><a href="element-headings.html">Headings</a></li>
                                    <li><a href="element-icons.html">Icons</a></li>
                                    <li><a href="element-info-box.html">Info box</a></li>
                                    <li><a href="element-posts.html">Posts</a></li>
                                    <li><a href="element-products.html">Products</a></li>
                                    <li><a href="element-product-categories.html">Product Categories</a></li>
                                    <li><a href="element-tabs.html">Tabs</a></li>
                                    <li><a href="element-testimonial.html">Testimonials</a></li>
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
                            <li><a href="login.html">My Account</a></li>
                            <li><a href="contact.html">Contact Us</a></li>

<!--                            <li><a href="wishlist.html">My Wishlist</a></li>-->
                            <li><a href="cart.jsp">Cart</a></li>
                            <li><a href="login.html" class="login-link">Log In</a></li>
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
                    <a href="home.jsp">
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
    </body>


    <!-- Mirrored from portotheme.com/html/porto_ecommerce/product.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Feb 2025 03:28:20 GMT -->
</html>
