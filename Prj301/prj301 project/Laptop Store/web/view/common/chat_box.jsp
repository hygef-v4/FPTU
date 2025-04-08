<%-- 
    Document   : chat_box
    Created on : Feb 28, 2025, 10:29:41 PM
    Author     : hungs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div id="chat-box" style="
         display: flex;
         align-items: center;
         background: #fff;
         padding: 10px 15px;
         border-radius: 10px;
         box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
         position: fixed;
         bottom: 20px;
         right: 20px;
         z-index: 1000;
         transition: all 0.3s ease;">
        <!-- Nút "Đóng" -->
        <button onclick="hideChatBox()" style="
                position: absolute;
                top: -17px;
                right: -17px;
                background-color: transparent;
                border: none;
                color: #aaa;
                font-size: 16px;
                cursor: pointer;">
            ✖
        </button>
        <a href="https://zalo.me/0327715098" 
           rel="nofollow" 
           target="_blank" 
           style="
           display: flex;
           align-items: center;
           text-decoration: none;">
            <!-- Biểu tượng Zalo -->
            <div style="
                 display: flex;
                 justify-content: center;
                 align-items: center;
                 width: 40px;
                 height: 40px;
                 border-radius: 50%;
                 margin-right: 10px;">
                <img src="https://img.icons8.com/?size=100&id=RgfZkJBmlaIK&format=png&color=000000" alt="Zalo Icon" style="
                     width: 100%;
                     height: auto;
                     max-width: 40px;
                     max-height: 40px;">
            </div>
            <!-- Nội dung -->
            <div style="
                 font-family: Arial, sans-serif;
                 color: #000;
                 transition: all 0.3s ease;">
                <b style="font-size: 14px;">Chat Zalo</b>
                <span style="display:block; font-size:12px;">(8h30-21h)</span>
            </div>
        </a>
    </div>
    <style>
        /* Hiệu ứng khi hover */
        #chat-box:hover {
            transform: translateY(-5px); /* Di chuyển lên trên một chút */
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2); /* Tăng bóng khi hover */
        }

        #chat-box a div:last-child b {
            transition: color 0.3s ease, opacity 0.3s ease; /* Hiệu ứng màu chữ và độ mờ */
        }

        #chat-box:hover a div:last-child b {
            color: #2962ff; /* Đổi màu chữ khi hover */
            opacity: 0.8; /* Giảm độ mờ */
        }

        #chat-box:hover a div:last-child span {
            color: #2962ff; /* Đổi màu chữ cho phần giờ hoạt động */
        }

        /* Hiệu ứng hover cho nút đóng */
        button:hover {
            color: red; /* Đổi màu sang đỏ khi hover */
            transform: scale(1.2); /* Phóng to nhẹ */
            transition: all 0.2s ease-in-out; /* Hiệu ứng mượt */
        }
    </style>

    <script>
        // Hàm để hide chat box
        function hideChatBox() {
            const chatBox = document.getElementById('chat-box');
            chatBox.style.display = 'none';
        }
        // Hàm để hide chat box
        function hideChatBox() {
            const chatBox = document.getElementById('chat-box');
            chatBox.style.display = 'none';
        }
    </script>
</html>
