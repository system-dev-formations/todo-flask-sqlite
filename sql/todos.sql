CREATE TABLE todos
(
    todo_id     INT PRIMARY KEY NOT NULL,
    title       TEXT            NOT NULL,
    text        TEXT            NOT NULL,
    done        CHAR(50),
    pub_date    DATETIME           NOT NULL
);

INSERT INTO `todos` (`todo_id`, `title`, `text`, `done`, `pub_date`) VALUES
(1, 'test', 'test', '0', '2019-11-20 10:00:00'),
(2, 'qwerty', 'yyy', '0', '2019-11-20 12:45:45');