CREATE DATABASE IF NOT EXISTS student_dashboard;
USE student_dashboard;

-- Students Table
CREATE TABLE students (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  gender ENUM('male', 'female'),
  subject VARCHAR(50),
  grade INT,
  passed BOOLEAN
);

-- Attendance Table
CREATE TABLE attendance (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT,
  status ENUM('present', 'absent', 'late'),
  date DATE,
  FOREIGN KEY (student_id) REFERENCES students(id)
);

-- Sample Data
INSERT INTO students (name, gender, subject, grade, passed) VALUES
('Alice', 'female', 'Math', 85, TRUE),
('Bob', 'male', 'Science', 70, TRUE),
('Carol', 'female', 'Math', 60, FALSE),
('David', 'male', 'English', 90, TRUE),
('Eva', 'female', 'Science', 72, TRUE),
('Frank', 'male', 'Math', 55, FALSE),
('Grace', 'female', 'English', 88, TRUE),
('Henry', 'male', 'Science', 62, TRUE),
('Ivy', 'female', 'Math', 78, TRUE),
('Jake', 'male', 'English', 45, FALSE);

INSERT INTO attendance (student_id, status, date) VALUES
(1, 'present', '2024-05-01'),
(2, 'absent', '2024-05-01'),
(3, 'late', '2024-05-01'),
(4, 'present', '2024-05-01'),
(5, 'present', '2024-05-01'),
(6, 'late', '2024-05-01'),
(7, 'present', '2024-05-01'),
(8, 'absent', '2024-05-01'),
(9, 'present', '2024-05-01'),
(10, 'absent', '2024-05-01');
