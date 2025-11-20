SELECT DISTINCT
    f.faculty_id,
    f.faculty_name
FROM Faculty f
JOIN Faculty_Course fc 
    ON f.faculty_id = fc.faculty_id
WHERE fc.course_id IN (
    SELECT sc.course_id
    FROM Student_Course sc
    WHERE sc.roll_no = 1001
);
