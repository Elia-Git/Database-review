-- Find out how many tasks are in the task table
SELECT count(*) FROM task;
-- Find out how many tasks in the task table do not have a valid due date
SELECT COUNT(*) FROM task WHERE due_date IS NULL;
--Alternative
SELECT task.id,task.title,task.due_date FROM task
WHERE due_date is NULL;
-- Find all the tasks that are marked as done
SELECT task.id,title,due_date,status.name FROM task
JOIN status ON task.status_id=status.id
WHERE status.name="Done";
-- Find all the tasks that are not marked as
SELECT task.id,title,due_date,status.name FROM task
JOIN status ON task.status_id=status.id
WHERE status.name!="Done";
-- Alter COUNT each
SELECT COUNT(*) FROM task
JOIN status ON task.status_id=status.id
WHERE status.name!="Done" AND status.name!="In progress";
-- Get all the tasks, sorted with the most recently created first
SELECT id,title,created
FROM task
ORDER BY created DESC;
-- Get the single most recently created task
SELECT id,title,created
FROM task
ORDER BY created DESC LIMIT 0,1;
-- Get the title and due date of all tasks where the title or description contains database
SELECT id,title,description,due_date
FROM task
WHERE title like "%database%" OR description like "%databse%";
-- Get the title and status (as text) of all tasks
SELECT title,status.name as TEXT
FROM task
JOIN status ON task.status_id=status.id
ORDER BY status.name;
-- Get the name of each status, along with a count of how many tasks have that status
SELECT COUNT(*),status.name
FROM task
JOIN status ON task.status_id=status.id
GROUP BY status.name;
-- Get the names of all statuses, sorted by the status with most tasks first
SELECT COUNT(*),status.name FROM task
JOIN status ON task.status_id=status.id
GROUP BY status.name
ORDER BY COUNT(*) DESC;
