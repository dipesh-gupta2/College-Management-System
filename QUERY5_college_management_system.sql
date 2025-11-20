SELECT 
    d.dept_no,
    d.name AS department_name,
    COUNT(s.roll_no) AS total_students
FROM Department d
LEFT JOIN Student s 
    ON d.dept_no = s.dept_no
GROUP BY d.dept_no, d.name 
HAVING COUNT(s.roll_no) = 1;
