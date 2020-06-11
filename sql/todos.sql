CREATE TABLE TODOS
(
    TODO_ID     INT PRIMARY KEY NOT NULL,
    TITLE       TEXT            NOT NULL,
    TEXT        TEXT            NOT NULL,
    DONE        CHAR(50),
    PUB_DATE    DATETIME        NOT NULL
);

INSERT INTO `todos` (`todo_id`, `title`, `text`, `done`, `pub_date`) VALUES
(1, 'test', 'test', '0', '2019-11-20'),
(2, 'qwerty', 'yyy', '0', '2019-11-20');