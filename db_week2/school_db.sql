-- creating class table
CREATE TABLE `class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(15) NOT NULL,
  `begins` date NULL,
  `ends` date NULL
  );
  select* from class;
  -- creating student table
CREATE TABLE `student` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(15) NOT NULL,
  `email` varchar(25) NULL,
  `phone` varchar(15) NULL,
  `class_id` int(10) unsigned NOT NULL,
  CONSTRAINT `fk_class` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
  );
CREATE INDEX
  idx_studname
ON
  student (name);
ALTER TABLE class
ADD status ENUM("not started", "ongoing", "finished");




