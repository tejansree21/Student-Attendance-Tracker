# 🧑‍🏫 Student Attendance Tracker (SQL Project)

## 📘 Overview
The **Student Attendance Tracker** is an SQL-based project that allows schools and colleges to efficiently manage student attendance data.  
It maintains records of students, subjects, and attendance logs — and enables quick reporting of attendance percentages, subject-wise analysis, and low attendance alerts.

---

## 🏗️ Database Schema

### 🗃️ Tables:
1. **Students** – Contains student details like roll number, class, and department.  
2. **Subjects** – Holds subject information and corresponding faculty details.  
3. **Attendance** – Records daily attendance status (Present/Absent/Late) for each student and subject.

---

## 🧩 Features
- Add new students and subjects  
- Record attendance by date and subject  
- Calculate attendance percentage per student  
- Filter attendance by class, date, or subject  
- Identify students with less than 75% attendance  

---

## 🗂️ Example Queries
- **View all attendance records:**
  ```sql
  SELECT * FROM Attendance;
