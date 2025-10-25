-- Create Database
CREATE DATABASE StudentAttendanceTracker;
USE StudentAttendanceTracker;

-- Create Tables
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100),
    roll_no VARCHAR(20) UNIQUE,
    class VARCHAR(50),
    department VARCHAR(50)
);

CREATE TABLE Subjects (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(100),
    subject_code VARCHAR(20) UNIQUE,
    teacher_name VARCHAR(100)
);

CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    subject_id INT,
    attendance_date DATE,
    status ENUM('Present', 'Absent', 'Late'),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
);

-- Insert Sample Data
INSERT INTO Students (student_name, roll_no, class, department) VALUES
('Amit Kumar', 'CSE101', 'CSE-3A', 'Computer Science'),
('Priya Sharma', 'CSE102', 'CSE-3A', 'Computer Science'),
('Rohit Singh', 'ECE201', 'ECE-2B', 'Electronics'),
('Neha Patel', 'ME301', 'ME-3A', 'Mechanical');

INSERT INTO Subjects (subject_name, subject_code, teacher_name) VALUES
('Database Management Systems', 'DBMS101', 'Dr. R. Mehta'),
('Operating Systems', 'OS102', 'Prof. S. Rao'),
('Data Structures', 'DS103', 'Dr. K. Verma');

-- Insert Attendance Records
INSERT INTO Attendance (student_id, subject_id, attendance_date, status) VALUES
(1, 1, '2025-10-10', 'Present'),
(1, 2, '2025-10-10', 'Absent'),
(2, 1, '2025-10-10', 'Present'),
(3, 3, '2025-10-10', 'Late'),
(4, 2, '2025-10-10', 'Present');

-- Example Queries
-- 1. View All Attendance Records
SELECT * FROM Attendance;

-- 2. Get Attendance Percentage of Each Student
SELECT 
    s.student_name,
    COUNT(CASE WHEN a.status = 'Present' THEN 1 END) * 100 / COUNT(*) AS attendance_percentage
FROM Attendance a
JOIN Students s ON a.student_id = s.student_id
GROUP BY s.student_name;

-- 3. View Attendance for a Specific Subject
SELECT 
    s.student_name,
    sub.subject_name,
    a.attendance_date,
    a.status
FROM Attendance a
JOIN Students s ON a.student_id = s.student_id
JOIN Subjects sub ON a.subject_id = sub.subject_id
WHERE sub.subject_name = 'Database Management Systems';

-- 4. Find Students with Low Attendance (<75%)
SELECT 
    s.student_name,
    COUNT(CASE WHEN a.status = 'Present' THEN 1 END) * 100 / COUNT(*) AS attendance_percentage
FROM Attendance a
JOIN Students s ON a.student_id = s.student_id
GROUP BY s.student_name
HAVING attendance_percentage < 75;
