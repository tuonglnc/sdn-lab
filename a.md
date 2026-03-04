# 🖥️ HƯỚNG DẪN CÀI ĐẶT MÔI TRƯỜNG SDN
## Windows 11 + Ubuntu 20.04 + Mininet + Ryu + Open vSwitch + Wireshark

---

# 📌 MỤC LỤC

1. [Chuẩn bị trên Windows 11](#-phần-0--chuẩn-bị-trên-windows-11)
2. [Tạo VM Ubuntu 20.04](#-phần-1--tạo-vm-ubuntu-2004)
3. [Update hệ thống](#-phần-2--update-hệ-thống)
4. [Cài công cụ cơ bản](#-phần-3--cài-công-cụ-cơ-bản)
5. [Cài Python + pip + wheel](#-phần-4--cài-python--pip--wheel-quan-trọng)
6. [Cài Mininet](#-phần-5--cài-mininet)
7. [Cài Open vSwitch](#-phần-6--cài-open-vswitch)
8. [Cài Ryu Controller](#-phần-7--cài-ryu-controller)
9. [Cài Wireshark](#-phần-8--cài-wireshark)
10. [Test SDN hoàn chỉnh](#-phần-9--test-sdn-hoàn-chỉnh)
11. [Test Wireshark](#-phần-10--test-wireshark-optional)
12. [Cleanup](#-phần-11--cleanup)

---

# ✅ PHẦN 0 — Chuẩn bị trên Windows 11

- [ ] Cài VMware Workstation 17  
- [ ] Download Ubuntu 20.04 LTS ISO  

---

# ✅ PHẦN 1 — Tạo VM Ubuntu 20.04

## 🔧 Cấu hình máy ảo

| Thành phần | Giá trị khuyến nghị |
|------------|--------------------|
| Type | Linux |
| Version | Ubuntu 64-bit |
| RAM | ≥ 4GB (khuyên 6–8GB nếu có) |
| CPU | ≥ 2 cores |
| Disk | ≥ 30GB |
| Network | NAT |

## 📦 Cài Ubuntu

- Chọn **Normal installation**
- Tick **Install third-party software**
- Tạo user và password

---

# ✅ PHẦN 2 — Update hệ thống

```bash
sudo apt update
sudo apt upgrade -y
```

---

# ✅ PHẦN 3 — Cài công cụ cơ bản

```bash
sudo apt install -y git curl build-essential net-tools
```

---

# ✅ PHẦN 4 — Cài Python + pip + wheel (QUAN TRỌNG)

```bash
sudo apt install -y python3 python3-pip python3-dev
```

### 🔥 Cài wheel

```bash
pip3 install --upgrade pip
pip3 install wheel
```

> `wheel` giúp build package nhanh và tránh lỗi khi cài Ryu.

---

# ✅ PHẦN 5 — Cài Mininet

```bash
sudo apt install -y mininet
```

## 🧪 Test

```bash
sudo mn --test pingall
```

Nếu thấy:

```
Results: 0% dropped
```

→ ✅ Mininet hoạt động bình thường

---

# ✅ PHẦN 6 — Cài Open vSwitch

```bash
sudo apt install -y openvswitch-switch
```

Kiểm tra:

```bash
sudo ovs-vsctl show
```

---

# ✅ PHẦN 7 — Cài Ryu Controller

```bash
pip3 install ryu
```

Kiểm tra version:

```bash
ryu-manager --version
```

---

# ✅ PHẦN 8 — Cài Wireshark

```bash
sudo apt install -y wireshark
```

Khi được hỏi:

```
Allow non-superusers to capture packets?
```

👉 Chọn **Yes**

Thêm user vào group:

```bash
sudo usermod -aG wireshark $USER
```

Sau đó:

```bash
newgrp wireshark
```

Hoặc logout/login lại.

---

# ✅ PHẦN 9 — Test SDN hoàn chỉnh

## 🟢 Terminal 1 — Chạy Ryu

```bash
ryu-manager ryu.app.simple_switch_13
```

Nếu thành công sẽ thấy:

```
Switch connected
```

---

## 🟢 Terminal 2 — Chạy Mininet

```bash
sudo mn --topo single,2 --controller=remote --switch ovsk,protocols=OpenFlow13
```

---

## 🟢 Test ping

Trong Mininet:

```
mininet> h1 ping h2
```

Kết quả mong đợi:

```
0% packet loss
```

---

# ✅ PHẦN 10 — Test Wireshark (Optional)

Chạy:

```bash
wireshark
```

- Interface: `lo`
- Filter:

```
openflow_v4
```

Ping lại → sẽ thấy:

- PACKET_IN
- FLOW_MOD

---

# ✅ PHẦN 11 — Cleanup

Thoát Mininet:

```
exit
```

Dọn rác:

```bash
sudo mn -c
```

---

# 🎯 KẾT QUẢ MONG ĐỢI

✔ Ryu Controller hoạt động  
✔ Switch kết nối thành công  
✔ Ping giữa host hoạt động  
✔ Wireshark bắt được OpenFlow  
✔ Không có packet loss  

---

# 🏁 HOÀN THÀNH

Môi trường SDN đã sẵn sàng để:
- Làm lab OpenFlow
- Phát triển controller
- Mô phỏng topology nâng cao
- Thực hiện đồ án SDN
