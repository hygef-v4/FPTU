<%-- 
    Document   : footer
    Created on : Feb 26, 2025, 3:59:23 PM
    Author     : hungs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="/view/common/chat_box.jsp"></jsp:include>

    <footer class="footer bg-dark">
        <div class="footer-middle">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="widget">
                            <h4 class="widget-title">Thông Tin Liên Hệ</h4>
                            <ul class="contact-info">
                                <li>
                                    <span class="contact-info-label">Địa chỉ:</span> SE1902, Đại Học FPT Hà Nội
                                </li>
                                <li>
                                    <span class="contact-info-label">Điện thoại:</span><a href="tel:+87327715098"> (+87) 327715098</a>
                                </li>
                                <li>
                                    <span class="contact-info-label">Email:</span> <a href="hungsct1702@gmail.com">hungsct1702@gmail.com</a>
                                </li>
                                <li>
                                    <span class="contact-info-label">Giờ làm việc:</span> Thứ 2 - Thứ 7 / 9:00 AM - 9:00 PM
                                </li>
                            </ul>
                            <div class="social-icons">
                                <a href="https://www.facebook.com/chal7z" class="social-icon social-facebook icon-facebook" target="_blank" title="Facebook"></a>
                                <a href="#" class="social-icon social-twitter icon-twitter" target="_blank" title="Twitter"></a>
                                <a href="#" class="social-icon social-instagram icon-instagram" target="_blank"></a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-sm-6">
                        <div class="widget">
                            <h4 class="widget-title">Dịch Vụ Khách Hàng</h4>
                            <ul class="links">
                                <li><a href="#">Câu hỏi thường gặp & Hỗ trợ</a></li>
                                <li><a href="#">Theo dõi đơn hàng</a></li>
                                <li><a href="#">Vận chuyển & Giao hàng</a></li>
                                <li><a href="#">Chính sách đổi trả</a></li>
                                <li><a href="#">Bảo hành & Sửa chữa</a></li>
                                <li><a href="dashboard.html">Tài khoản của tôi</a></li>
                                <li><a href="about.html">Về chúng tôi</a></li>
                                <li><a href="#">Bán hàng doanh nghiệp</a></li>
                                <li><a href="#">Chính sách bảo mật</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-lg-3 col-sm-6">
                        <div class="widget">
                            <h4 class="widget-title">Thẻ Phổ Biến</h4>
                            <div class="tagcloud">
                                <a href="#">Laptop Gaming</a>
                                <a href="#">Ultrabook</a>
                                <a href="#">MacBook</a>
                                <a href="#">Laptop Windows</a>
                                <a href="#">Laptop Doanh Nghiệp</a>
                                <a href="#">Phụ kiện</a>
                                <a href="#">Bàn phím</a>
                                <a href="#">Chuột</a>
                                <a href="#">Màn hình</a>
                                <a href="#">Ổ cứng SSD & Lưu trữ</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-sm-6">
                        <div class="widget widget-newsletter">
                            <h4 class="widget-title">Đăng ký nhận bản tin</h4>
                            <p>Nhận tất cả thông tin mới nhất về sự kiện, khuyến mãi và ưu đãi. Đăng ký nhận bản tin:
                            </p>
                            <form action="#" class="mb-0">
                                <input type="email" class="form-control m-b-3" placeholder="Địa chỉ email" required>

                                <input type="submit" class="btn btn-primary shadow-none" value="Đăng ký">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="footer-bottom">
                <div class="container d-sm-flex align-items-center">
                    <div class="footer-left">
                        <span class="footer-copyright">© Cửa Hàng Laptop 2025. Mọi quyền được bảo lưu</span>
                    </div>

                    <div class="footer-right ml-auto mt-1 mt-sm-0">
                        <div class="payment-icons">
                            <span class="payment-icon visa" style="background-image: url('${pageContext.request.contextPath}/assets/images/payments/payment-visa.svg')"></span>
                        <span class="payment-icon paypal" style="background-image: url('${pageContext.request.contextPath}/assets/images/payments/payment-paypal.svg')"></span>
                        <span class="payment-icon stripe" style="background-image: url('${pageContext.request.contextPath}/assets/images/payments/payment-stripe.png')"></span>
                        <span class="payment-icon verisign" style="background-image: url('${pageContext.request.contextPath}/assets/images/payments/payment-verisign.svg')"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
