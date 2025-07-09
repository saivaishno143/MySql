CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
   
);

select * FROM posts;

SELECT * from `user`;

select * from user ORDER BY id Desc limit 1 offset 3;

select * from user limit 1 OFFSET 2;

SELECT * from user limit 1 OFFSET 1;

drop Table posts;

CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
   
);

SELECT * from posts;


INSERT into posts(id, user_id,content) VALUES
(2,2,"hello world again");

CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Foreign Key (post_id) REFERENCES posts(id),
    Foreign Key (user_id) REFERENCES user(id)
);

select * from comments;

INSERT into comments(id,post_id,user_id,content) VALUES
(1,1,1,"hi my name is got"),(2,2,2,"Nice Content");

SELECT * from comments JOIN posts where comments.post_id=posts.id;

SELECT * from comments RIGHT JOIN posts ON comments.post_id=posts.id;

SELECT * from posts Left Join comments on comments.post_id=posts.id;

SELECT * from posts  JOIN comments;