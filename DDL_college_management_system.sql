CREATE TABLE Department (
    dept_no INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    id VARCHAR(10)  NOT NULL UNIQUE, 
    phone_ext  VARCHAR(10),
    mailing_address VARCHAR(255),
    location  VARCHAR(100),
    hod_name VARCHAR(100)
);

CREATE TABLE Section (
    section_id     INT PRIMARY KEY ,
    name   VARCHAR(50) NOT NULL,
    max_capacity   INT NOT NULL,
    no_of_students INT DEFAULT 0,
    dept_no       INT NOT NULL,
    CONSTRAINT fk_section_dept
        FOREIGN KEY (dept_no) REFERENCES Department(dept_no)
        ON DELETE CASCADE,
    CONSTRAINT uq_section_dept_name
        UNIQUE (dept_no, name)
);


CREATE TABLE Mini_Project (
    project_id     INT PRIMARY KEY,
    project_name   VARCHAR(150) NOT NULL,
    domain         VARCHAR(100),
    subject        VARCHAR(100),
    description    VARCHAR(500)   
);



CREATE TABLE Student (
    roll_no        INT PRIMARY KEY,
    name   VARCHAR(100) NOT NULL,
    dob            DATE,
    age            INT,
    gender         CHAR(1),
    address        VARCHAR(255),
    phone_no       VARCHAR(15),
    hobby          VARCHAR(100),
    dept_no        INT NOT NULL,
    section_id     INT,
    project_id INT,
    CONSTRAINT chk_student_gender
        CHECK (gender IN ('M','F','O')),
    CONSTRAINT fk_student_dept
        FOREIGN KEY (dept_no) REFERENCES Department(dept_no),
    
    CONSTRAINT fk_student_section
        FOREIGN KEY (section_id) REFERENCES Section(section_id),

    CONSTRAINT fk_student_project
        FOREIGN KEY (project_id) REFERENCES Mini_Project(project_id)
);



CREATE TABLE Faculty (
    faculty_id     INT PRIMARY KEY,
    faculty_name   VARCHAR(100) NOT NULL,
    designation    VARCHAR(100),
    doj            DATE,              -- date of joining
    dob            DATE,
    age            INT,
    gender         CHAR(1),
    address        VARCHAR(255),
    phone_no       VARCHAR(15),
    salary         DECIMAL(10,2),
    dept_no        INT NOT NULL,
    CONSTRAINT chk_faculty_gender
        CHECK (gender IN ('M','F','O')),
    CONSTRAINT fk_faculty_dept
        FOREIGN KEY (dept_no) REFERENCES Department(dept_no)

);



CREATE TABLE Course (
    course_id      INT PRIMARY KEY,
    course_code    VARCHAR(20) NOT NULL UNIQUE,
    course_name    VARCHAR(100) NOT NULL,
    credits        INT NOT NULL,
    dept_no        INT NOT NULL,
    CONSTRAINT fk_course_dept
        FOREIGN KEY (dept_no) REFERENCES Department(dept_no)

);


CREATE TABLE Research_Project (
    rproject_id    INT PRIMARY KEY,
    project_title  VARCHAR(150) NOT NULL,
    funded_by      VARCHAR(20) NOT NULL,
    start_date     DATE,
    end_date       DATE,
    status         VARCHAR(50),       -- e.g. 'ONGOING','COMPLETED'
    dept_no        INT,               -- main department owning the project (optional)
    CONSTRAINT chk_rp_funded_by
        CHECK (funded_by IN ('GOVERNMENT','INDUSTRY','COLLEGE')),
    CONSTRAINT fk_rp_dept
        FOREIGN KEY (dept_no) REFERENCES Department(dept_no)
  
);




CREATE TABLE Student_Course (
    roll_no        INT,
    course_id      INT,
    PRIMARY KEY (roll_no, course_id),
    CONSTRAINT fk_sc_student
        FOREIGN KEY (roll_no) REFERENCES Student(roll_no)
        ON DELETE CASCADE,
    CONSTRAINT fk_sc_course
        FOREIGN KEY (course_id) REFERENCES Course(course_id)
        ON DELETE CASCADE
);



CREATE TABLE Faculty_Course (
    faculty_id     INT,
    course_id      INT,
    PRIMARY KEY (faculty_id, course_id),
    CONSTRAINT fk_fc_faculty
        FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_fc_course
        FOREIGN KEY (course_id) REFERENCES Course(course_id)
        ON DELETE CASCADE
);


CREATE TABLE Faculty_Research_Project (
    faculty_id     INT,
    rproject_id    INT,
    role           VARCHAR(100),      -- optional: e.g. 'PI','Co-PI','Member'
    PRIMARY KEY (faculty_id, rproject_id),
    CONSTRAINT fk_frp_faculty
        FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_frp_project
        FOREIGN KEY (rproject_id) REFERENCES Research_Project(rproject_id)
        ON DELETE CASCADE
);


CREATE TABLE DEPARTMENT_PROJECT (
    dept_no        INT,
    project_id      INT,
    PRIMARY KEY (dept_no, project_id),
    CONSTRAINT fk_sc_department_project1
        FOREIGN KEY (dept_no) REFERENCES DEPARTMENT(dept_no)
        ON DELETE CASCADE,
    CONSTRAINT fk_sc_department_project2
        FOREIGN KEY (project_id) REFERENCES MINI_PROJECT(project_id)
        ON DELETE CASCADE
);


CREATE TABLE FACULTY_PROJECT (
    faculty_id        INT,
    project_id      INT,
    PRIMARY KEY (faculty_id, project_id),
    CONSTRAINT fk_sc_faculty_project1
        FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_sc_faculty_project2
        FOREIGN KEY (project_id) REFERENCES MINI_PROJECT(project_id)
        ON DELETE CASCADE
);

CREATE TABLE STUDENT_FACULTY(
    roll_no        INT,
    faculty_id      INT,
    PRIMARY KEY (roll_no, faculty_id),
    CONSTRAINT fk_sc_student_faculty1
        FOREIGN KEY (roll_no) REFERENCES Student(roll_no)
        ON DELETE CASCADE,
    CONSTRAINT fk_sc_student_faculty2
        FOREIGN KEY (faculty_id) REFERENCES FACULTY(faculty_id)
        ON DELETE CASCADE
);



CREATE TABLE FACULTY_SEC(
    section_id       INT,
    faculty_id      INT,
    PRIMARY KEY (section_id, faculty_id),
    CONSTRAINT fk_sc_faculty_sec1
        FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_sc_faculty_sec2
        FOREIGN KEY (section_id) REFERENCES section(section_id)
        ON DELETE CASCADE
);



CREATE TABLE COURSE_SEC(
    section_id       INT,
    course_id      INT,
    PRIMARY KEY (course_id, section_id),
    CONSTRAINT fk_sc_course_sec1
        FOREIGN KEY (course_id) REFERENCES course(course_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_sc_course_sec2
        FOREIGN KEY (section_id) REFERENCES section(section_id)
        ON DELETE CASCADE
);




CREATE TABLE MINIPROJECT_SEC(
    project_id       INT,
    section_id      INT,
    PRIMARY KEY (section_id, project_id),
    CONSTRAINT fk_sc_project_sec1
        FOREIGN KEY (project_id) REFERENCES MINI_PROJECT(project_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_sc_project_sec2
        FOREIGN KEY (section_id) REFERENCES section(section_id)
        ON DELETE CASCADE
);