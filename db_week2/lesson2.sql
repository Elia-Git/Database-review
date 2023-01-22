--Get all the tasks assigned to users whose email ends in @spotify.com
-- Tasks of users with email ends in @spotify.com
SELECT user.name,user.email, task.title,task.id
FROM task
JOIN user_task ON task.id = user_task.task_id
JOIN user ON user.id = user_task.user_id
WHERE user.email LIKE '%@spotify.com';
--Or
SELECT user.name,user.email, task.title
FROM task
LEFT JOIN user ON task.user_id = user.id
WHERE user.email LIKE '%apolak4@indiatimes.com';

-- Get all the tasks for 'Donald Duck' with status 'Not started'
SELECT task.id,user.name, task.title, task.status_id,status.name as TEXT
FROM task
JOIN user_task ON task.id = user_task.task_id
JOIN status ON task.status_id = status.id
JOIN user ON user.id = user_task.user_id
WHERE user.name LIKE 'Donald Duck' AND status.name = 'Not started';
SELECT task.id, task.title AS 'Task Name', user.name AS 'user', status.name AS status
FROM user_task
JOIN task ON user_task.task_id = task.id
JOIN user ON user_task.user_id = user.id
JOIN status ON task.status_id = status.id
WHERE status.name = "Not started" AND user.name = 'Donald Duck';

-- Get all the tasks for 'Maryrose Meadows' that were created in september (hint: month(created)=month_number)
SELECT task.id,user.name, task.title, task.created
FROM task
JOIN user_task ON task.id = user_task.task_id
JOIN user  ON user.id = user_task.user_id
WHERE user.name LIKE 'Maryrose Meadows' AND MONTH(created)=09;
-- Find how many tasks where created in each month,
SELECT COUNT(id) as nrOfMonthlyTasks ,MONTHNAME(created) as "month"
FROM task
GROUP BY month;
