// Lấy tham chiếu đến phần tử có ID là "myNav"
const nav = document.getElementById("myNav");

// Gắn sự kiện "click" cho phần tử
nav.addEventListener("click", function () {
    // Chỉnh sửa nội dung của phần tử khi nhấp vào
    nav.textContent = "Trang đã được chỉnh sửa!";
    // Bạn cũng có thể thêm các thay đổi khác tại đây
});