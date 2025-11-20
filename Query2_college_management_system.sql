SELECT 
    f.faculty_id,
    f.faculty_name,
    c.course_code,
    c.course_name,
    d.name AS department_name
FROM Faculty f
JOIN Faculty_Course fc 
    ON f.faculty_id = fc.faculty_id
JOIN Course c 
    ON fc.course_id = c.course_id
JOIN Department d 
    ON f.dept_no = d.dept_no
ORDER BY f.faculty_id, c.course_code
LIMIT 10;
