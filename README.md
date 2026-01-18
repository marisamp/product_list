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
- **Google AI Studio :** ใช้ในการออกแบบ Layout ของ UI
- **Google Gemini :** ใช้ในการหาข้อมูลเพิ่มเติม

## 📁 Project Structure

โค้ดหลักจะอยู่ในโฟลเดอร์ `lib` โดยแบ่งสัดส่วนตามหน้าที่ (Pattern):

```text
lib/
├── app/
│   ├── data/           # จัดการข้อมูล (Models, Services, Providers)
│   │   ├── models/     # คลาสสำหรับแปลง JSON เป็น Object
│   │   └── services/   # ฟังก์ชันเชื่อมต่อ API
│   ├── modules/        # แบ่งตามหน้าจอ (Features)
│   │   ├── home/       # หน้ารายการสินค้า (View, Controller, Binding)
│   │   ├── detail/     # หน้ารายละเอียดสินค้า (View, Controller, Binding)
│   │   └── splash/     # หน้า Loading ก่อนเข้าแอป
│   └── routes/         # จัดการเส้นทางหน้าจอ (AppRoutes, AppPages)
├── core/               # ส่วนกลางที่ใช้ทั้งแอป (Themes, Colors, Constants)
└── main.dart           # จุดเริ่มต้นของแอปพลิเคชัน
```

## 🧠 State Management Logic

ในโปรเจกต์นี้มีการจัดการสถานะของข้อมูล (State) ในหน้า Product List โดยใช้ GetX ดังนี้:

- **Loading State:** แสดง `LoadingAnimationWidget` เมื่อเริ่มดึงข้อมูลจาก API โดยใช้ตัวแปร `.obs` ในการเช็กสถานะ
- **Data State:** เมื่อดึงข้อมูลสำเร็จ จะทำการอัปเดต UI ทันทีผ่าน `Obx` เพื่อแสดงรายการสินค้าที่ได้รับจาก Model
- **Error State:** มีการจัดการกรณีดึงข้อมูลไม่สำเร็จด้วย `try-catch` และแสดง Error Message พร้อมปุ่มให้ผู้ใช้สามารถกดโหลดข้อมูลใหม่ (Retry) ได้
- **Image Handling:** ใช้ `loadingBuilder` และ `errorBuilder` ใน `Image.network` เพื่อจัดการรูปภาพที่กำลังโหลดหรือลิ้งก์เสีย ไม่ให้กระทบต่อการแสดงผลรวมของแอป

## 📸 Screenshots แต่ละหน้าจอ
- หน้า Error ถ้าไม่มี Internet
<img width="233" height="507" alt="no-internet" src="https://github.com/user-attachments/assets/92b143a0-11dd-47ef-b15f-0ab5ba0b3d96" />

- หน้า Splash ก่อนเข้า App
<img width="232" height="505" alt="splash-view" src="https://github.com/user-attachments/assets/dc35af6e-25f8-42a3-b185-03d6ced6354b" />



