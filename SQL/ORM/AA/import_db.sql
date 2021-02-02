DROP TABLE question_likes;
DROP TABLE replies;
DROP TABLE question_follows;
DROP TABLE questions;
DROP TABLE users;

PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname CHAR(255),
    lname CHAR(255)
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title CHAR(255),
    body VARCHAR(255),
    author_id INTEGER,
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER,
    user_id INTEGER,
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    body VARCHAR(255),
    parent_id INTEGER,
    author_id INTEGER,
    question_id INTEGER,
    FOREIGN KEY (parent_id)  REFERENCES replies(id),
    FOREIGN KEY (author_id)  REFERENCES users(id),
    FOREIGN KEY (question_id)  REFERENCES questions(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    question_id INTEGER,
    FOREIGN KEY (user_id)  REFERENCES users(id),
    FOREIGN KEY (question_id)  REFERENCES questions(id)
);

INSERT INTO 
    users (fname, lname)
VALUES
    ("Andre", "Beer"), ("Rachid", "Amin"), ("Dre", "Console"), ("Alex", "Blet");

INSERT INTO
    questions (title, body, author_id)
SELECT 
    "What is the best oatmeal recipe?", "I really like oatmeal", u1.id
FROM
    users u1
WHERE
    u1.fname = "Alex" AND u1.lname = "Blet";

INSERT INTO
    questions (title, body, author_id)
SELECT
    "Why is usel.ink so useful?", "I've been using usel.ink for a while and I make big $$", u2.id
FROM
    users u2
WHERE
    fname = "Rachid" AND lname = "Amin";

INSERT INTO
    question_follows (question_id, user_id)
VALUES
    ((SELECT questions.id FROM questions WHERE title = "What is the best oatmeal recipe?"),
    (SELECT users.id FROM users WHERE fname = "Andre" AND lname= "Beer"));

INSERT INTO
    question_follows (question_id, user_id)
VALUES
    ((SELECT questions.id FROM questions WHERE title = "Why is usel.ink so useful?"),
    (SELECT users.id FROM users WHERE fname = "Dre" AND lname= "Console"));

INSERT INTO
    question_follows (question_id, user_id)
VALUES
    ((SELECT questions.id FROM questions WHERE title = "Why is usel.ink so useful?"),
    (SELECT users.id FROM users WHERE fname = "Andre" AND lname= "Beer"));

INSERT INTO
    replies (body, parent_id, author_id, question_id)
VALUES
    ("Because they have very competent founders",
    (NULL),
    (SELECT users.id FROM users WHERE users.fname = "Rachid" AND users.lname = "Amin"),
    (SELECT questions.id FROM questions WHERE questions.title = "Why is usel.ink so useful?"));

INSERT INTO
    replies (body, parent_id, author_id, question_id)
VALUES
    ("Idk but my mum makes good oatmeal too bro",
    (NULL),
    (SELECT users.id FROM users WHERE users.fname = "Andre" AND users.lname = "Beer"),
    (SELECT questions.id FROM questions WHERE questions.title = "What is the best oatmeal recipe?"));

INSERT INTO
    replies (body, parent_id, author_id, question_id)
VALUES
    ("I bet she does m8",
    (SELECT id FROM replies WHERE body = "Idk but my mum makes good oatmeal too bro"),
    (SELECT users.id FROM users WHERE users.fname = "Alex" AND users.lname = "Blet"),
    (SELECT questions.id FROM questions WHERE questions.title = "What is the best oatmeal recipe?"));

INSERT INTO
    question_likes (user_id, question_id)
VALUES
    ((SELECT users.id FROM users WHERE users.fname = "Alex" AND users.lname = "Blet"),
    (SELECT questions.id FROM questions WHERE questions.title = "Why is usel.ink so useful?"));