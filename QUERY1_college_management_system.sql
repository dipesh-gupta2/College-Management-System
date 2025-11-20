SELECT 
    s.roll_no,
    s.name AS student_name,
    d.name AS department_name,
    sec.name AS section_name
FROM Student s
JOIN Department d 
    ON s.dept_no = d.dept_no
LEFT JOIN Section sec 
    ON s.section_id = sec.section_id
ORDER BY s.roll_no
LIMIT 10;
