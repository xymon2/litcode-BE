use litcode-db;
SET GLOBAL TIME_ZONE = 'Asia/Seoul';

CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    solved_id JSON,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE problems(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(255),
    description TEXT,
    sample_input TEXT
);

CREATE TABLE skeleton_code(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    problem_id INT NOT NULL,
    FOREIGN KEY (problem_id) 
    REFERENCES problems(id) 
    ON DELETE CASCADE,
    language TEXT NOT NULL,
    code TEXT NOT NULL
);

CREATE TABLE test_cases(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    problem_id INT NOT NULL,
    FOREIGN KEY (problem_id) 
    REFERENCES problems(id) 
    ON DELETE CASCADE,
    input TEXT NOT NULL,
    output TEXT NOT NULL,
    score INT DEFAULT 0
);

CREATE TABLE solving_problems(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id)
    REFERENCES users(id) 
    ON DELETE CASCADE,
    problem_id INT NOT NULL,
    FOREIGN KEY(problem_id)  
    REFERENCES problems(id)
    ON DELETE CASCADE,
    language TEXT NOT NULL,
    code TEXT,
    score INT default 0,
    time INT default 0
);