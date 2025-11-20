SELECT 
    roll_no,
    name,
    age
FROM Student
WHERE age > (
    SELECT AVG(age) 
    FROM Student
);
