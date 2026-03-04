# SDN Labs with Mininet & Ryu

## Environment
- Host OS: Windows 11
- VMware 17
- Ubuntu 20.04
- Mininet
- Open vSwitch
- Ryu Controller
- Wireshark

---

## Quick Start

```bash
git clone <repo-url>
cd <repo-name>
make setup
```

---
## 📝 Hướng dẫn cài đặt thủ công (Manual Setup)

Nếu bạn muốn tự cài đặt từng thành phần **một cách thủ công** (không sử dụng script Quick Start), vui lòng xem hướng dẫn chi tiết tại:

👉 **[Xem hướng dẫn Manual Setup](./manual-setup.md)**

Tài liệu này sẽ hướng dẫn bạn từng bước:

- Cài đặt Ubuntu 20.04 trên VMware  
- Cập nhật hệ thống  
- Cài đặt Mininet và Open vSwitch  
- Tạo môi trường ảo Python (venv) cho Ryu  
- Cài đặt Ryu và xử lý lỗi tương thích với eventlet  
- Kiểm tra và xác nhận toàn bộ hệ thống hoạt động đúng  

Hướng dẫn phù hợp nếu bạn muốn hiểu rõ cách từng thành phần được thiết lập và hoạt động trong môi trường SDN.
