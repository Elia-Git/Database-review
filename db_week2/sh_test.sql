SELECT student.id, student.name,student.email,student.phone 
from class 
join student on student.class_id=class.id
where class.name='Class 23';