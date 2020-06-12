CREATE TABLE todos
(
    todo_id     INT PRIMARY KEY NOT NULL,
    title       TEXT            NOT NULL,
    text        TEXT            NOT NULL,
    done        CHAR(50),
    pub_date    TEXT           NOT NULL
);

INSERT INTO `todos` (`todo_id`, `title`, `text`, `done`, `pub_date`) VALUES
(1, 'test', 'test', '0', '2019-11-20'),
(2, 'qwerty', 'yyy', '0', '2019-11-20');