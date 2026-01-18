# 🛍️ MiMi Select

แอปพลิเคชันสำหรับแสดงรายการสินค้าและดูรายละเอียดสินค้ารายชิ้น โดยดึงข้อมูลจาก REST API 

## ✨ Features (ความสามารถของแอป)
- **Product Listing:** แสดงรายการสินค้าทั้งหมดพร้อมรูปภาพ ราคา และเรตติ้ง
- **Pull-to-Refresh:** สามารถดึงหน้าจอลงเพื่ออัปเดตข้อมูลใหม่ล่าสุด
- **Infinite Scroll:** โหลดสินค้าเพิ่มอัตโนมัติเมื่อเลื่อนลงไปถึงด้านล่าง (Pagination)
- **Product Detail:** กดเพื่อดูรายละเอียดสินค้าฉบับเต็ม

## 🛠️ Tech Stack (เทคโนโลยีที่ใช้)
- **Framework:** Flutter 
- **State Management:** GetX (เรียบง่ายและทรงพลัง)
- **Networking:** ดึงข้อมูลผ่าน REST API (DummyJSON)
- **UI Components:** SmartRefresher, Responsive UI (Sizer/ScreenUtil)

## 📁 Project Structure

โค้ดหลักจะอยู่ในโฟลเดอร์ `lib` โดยแบ่งสัดส่วนตามหน้าที่ (Pattern):

lib/
├── app/
│   ├── data/           # จัดการข้อมูล (Models, Services)
│   │   ├── models/     # คลาสสำหรับแปลง JSON เป็น Object
│   │   └── services/   # ฟังก์ชันเชื่อมต่อ API
│   ├── modules/        # แบ่งตามหน้าจอ (Features)
│   │   ├── home/       # หน้ารายการสินค้า (View, Controller)
│   │   └── detail/     # หน้ารายละเอียดสินค้า (View, Controller)
│   │   └── splash/     # หน้า Loading ก่อนเข้าแอป (View, Controller)
│   └── routes/         # จัดการเส้นทางหน้าจอ (AppRoutes, AppPages
├── core/               # ส่วนกลางที่ใช้ทั้งแอป (Themes, Colors, Constants)
└── main.dart           # จุดเริ่มต้นของแอปพลิเคชัน

## 📸 Screenshots แต่ละหน้าจอ
- หน้า Error ถ้าไม่มี Internet
<img width="512" height="512" alt="no-picture" src="https://github.com/user-attachments/assets/5e377648-a13c-4a5d-9715-636cb240d02f" />


