✅ PHẦN 0 — Chuẩn bị trên Windows 11
☐ Cài VMware Workstation 17
☐ Download Ubuntu 20.04 ISO (khuyên dùng 20.04 LTS)
✅ PHẦN 1 — Tạo VM Ubuntu 20.04
☐ Create New Virtual Machine

Type: Linux

Version: Ubuntu 64-bit

RAM: ≥ 4GB (khuyên 6–8GB nếu có)

CPU: ≥ 2 cores

Disk: ≥ 30GB

Network: NAT (dễ nhất)

☐ Install Ubuntu 20.04

Normal installation

Install third-party software

Tạo user và password

✅ PHẦN 2 — Update hệ thống

Sau khi login vào Ubuntu:

sudo apt update
sudo apt upgrade -y
✅ PHẦN 3 — Cài công cụ cơ bản
sudo apt install -y git curl build-essential net-tools
✅ PHẦN 4 — Cài Python + pip + wheel (QUAN TRỌNG)
sudo apt install -y python3 python3-pip python3-dev
🔥 Cài wheel (bạn nhắc đúng, rất quan trọng)
pip3 install --upgrade pip
pip3 install wheel

👉 wheel giúp build package nhanh và tránh lỗi khi cài Ryu.

✅ PHẦN 5 — Cài Mininet
sudo apt install -y mininet

Test:

sudo mn --test pingall

Nếu thấy:

Results: 0% dropped

→ OK

✅ PHẦN 6 — Cài Open vSwitch
sudo apt install -y openvswitch-switch

Kiểm tra:

sudo ovs-vsctl show
✅ PHẦN 7 — Cài Ryu Controller
pip3 install ryu

Kiểm tra:

ryu-manager --version
✅ PHẦN 8 — Cài Wireshark
sudo apt install -y wireshark

Khi hỏi:

Allow non-superusers to capture packets?

👉 Chọn Yes

Thêm user vào group:

sudo usermod -aG wireshark $USER

Sau đó:

newgrp wireshark

Hoặc logout/login lại.

✅ PHẦN 9 — Test SDN hoàn chỉnh
🟢 Terminal 1 — Chạy Ryu
ryu-manager ryu.app.simple_switch_13
🟢 Terminal 2 — Chạy Mininet
sudo mn --topo single,2 --controller=remote --switch ovsk,protocols=OpenFlow13

Nếu thành công, bên Ryu sẽ hiện:

Switch connected
🟢 Test ping

Trong Mininet:

mininet> h1 ping h2

Kết quả mong đợi:

0% packet loss
✅ PHẦN 10 — Test Wireshark (Optional)
wireshark

Chọn interface: lo

Filter: openflow_v4

Ping lại → thấy:

PACKET_IN

FLOW_MOD

✅ PHẦN 11 — Cleanup

Thoát Mininet:

exit

Dọn rác:

sudo mn -c
