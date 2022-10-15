SELECT si.roll_number, si.name
FROM student_information AS si
INNER JOIN faculty_information AS fi
ON si.advisor = fi.employee_id
WHERE 
(fi.gender = 'M' AND fi.salary > 15000)
OR
(fi.gender = 'F' AND fi.salary > 20000);