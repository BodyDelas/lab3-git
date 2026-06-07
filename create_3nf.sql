CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(100) UNIQUE,
    registration_date DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE exams (
    exam_id SERIAL PRIMARY KEY,
    exam_name VARCHAR(150) NOT NULL,
    exam_date DATE NOT NULL
);

CREATE TABLE topics (
    topic_id SERIAL PRIMARY KEY,
    topic_name VARCHAR(150) NOT NULL,
    description TEXT
);

CREATE TABLE study_materials (
    material_id SERIAL PRIMARY KEY,
    topic_id INTEGER NOT NULL REFERENCES topics(topic_id),
    title VARCHAR(200) NOT NULL,
    material_type VARCHAR(50) NOT NULL
);

CREATE TABLE study_plan (
    plan_id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL REFERENCES students(student_id),
    exam_id INTEGER NOT NULL REFERENCES exams(exam_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE plan_topics (
    plan_topic_id SERIAL PRIMARY KEY,
    plan_id INTEGER NOT NULL REFERENCES study_plan(plan_id),
    topic_id INTEGER NOT NULL REFERENCES topics(topic_id),
    completion_status VARCHAR(50) NOT NULL
);

CREATE TABLE practice_tests (
    test_id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL REFERENCES students(student_id),
    topic_id INTEGER NOT NULL REFERENCES topics(topic_id),
    score INTEGER NOT NULL,
    attempt_date DATE NOT NULL
);

CREATE TABLE exam_results (
    result_id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL REFERENCES students(student_id),
    exam_id INTEGER NOT NULL REFERENCES exams(exam_id),
    grade VARCHAR(20) NOT NULL
);