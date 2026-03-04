# 🖥 Ubuntu 20.04 SDN Environment Setup  
### Mininet + Open vSwitch + Ryu (Python Virtual Environment)

---

# 📌 1. Install Ubuntu 20.04

- Cài Ubuntu 20.04 trên VMware
- Sau khi login, update hệ thống:

```bash
sudo apt update
sudo apt upgrade -y
```

---

# 🐍 2. Check Python Version

Ubuntu 20.04 mặc định dùng **Python 3.8**.

Kiểm tra:

```bash
python3 --version
```

Yêu cầu:

```
Python 3.8.x
```

---

# 🔀 3. Install Mininet + Open vSwitch

## Cài đặt:

```bash
sudo apt install -y mininet openvswitch-switch
```

## Kiểm tra Mininet:

```bash
sudo mn --test pingall
```

Kết quả mong đợi:

```
Results: 0% dropped
```

## Kiểm tra Open vSwitch:

```bash
sudo ovs-vsctl show
```

---

# 🧪 4. Create Python Virtual Environment

## Cài công cụ venv:

```bash
sudo apt install -y python3-venv
```

## Tạo môi trường ảo:

```bash
python3 -m venv ryu-venv
```

## Kích hoạt:

```bash
source ryu-venv/bin/activate
```

---

# 📦 5. Install pip, wheel, and Ryu

## Upgrade pip:

```bash
pip install --upgrade pip
```

## Install wheel (QUAN TRỌNG):

```bash
pip install wheel
```

## Cài Ryu:

```bash
pip install ryu
```

---

# ⚙ 6. Fix Eventlet Compatibility

Ryu trên Ubuntu 20.04 đôi khi lỗi với phiên bản eventlet mới.

## Hạ xuống version ổn định:

```bash
pip uninstall eventlet -y
pip install eventlet==0.30.2
```

## Kiểm tra:

```bash
pip show eventlet
```

Phải thấy:

```
Version: 0.30.2
```

---

# 🧪 Verification – Test All Components

---

## 1️⃣ Test Ryu

Trong venv:

```bash
ryu-manager ryu.app.simple_switch_13
```

Nếu chạy bình thường → ✅ OK  

Dừng bằng:

```
Ctrl + C
```

---

## 2️⃣ Test Mininet with Ryu

### 🟢 Terminal 1 (Ryu):

```bash
source ryu-venv/bin/activate
ryu-manager ryu.app.simple_switch_13
```

### 🟢 Terminal 2 (Mininet):

```bash
sudo mn --topo single,2 --controller=remote --switch ovsk,protocols=OpenFlow13
```

---

## 3️⃣ Test Ping

Trong Mininet:

```
mininet> h1 ping h2
```

Kết quả mong đợi:

```
0% packet loss
```

Nếu thành công → ✅ môi trường SDN hoạt động chính xác.

---

## 4️⃣ Cleanup

Thoát Mininet:

```
exit
```

Dọn rác:

```bash
sudo mn -c
```

---

# 📊 Environment Summary

| Component | Version |
|------------|----------|
| OS | Ubuntu 20.04 |
| Python | 3.8 |
| Mininet | Installed |
| Open vSwitch | Installed |
| Ryu | Installed (venv) |
| eventlet | 0.30.2 |

---

# 🏁 Result

Môi trường SDN đã sẵn sàng để:

- Làm lab OpenFlow
- Phát triển Ryu controller
- Mô phỏng topology nâng cao
- Thực hiện đồ án SDN

---
