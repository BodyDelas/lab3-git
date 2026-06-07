CREATE TABLE hub_student (
    student_hash_key VARCHAR(64) PRIMARY KEY,
    student_id INTEGER NOT NULL,
    load_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    record_source VARCHAR(100) NOT NULL
);

CREATE TABLE hub_exam (
    exam_hash_key VARCHAR(64) PRIMARY KEY,
    exam_id INTEGER NOT NULL,
    load_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    record_source VARCHAR(100) NOT NULL
);

CREATE TABLE hub_topic (
    topic_hash_key VARCHAR(64) PRIMARY KEY,
    topic_id INTEGER NOT NULL,
    load_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    record_source VARCHAR(100) NOT NULL
);

CREATE TABLE link_study_plan (
    study_plan_hash_key VARCHAR(64) PRIMARY KEY,
    student_hash_key VARCHAR(64) NOT NULL REFERENCES hub_student(student_hash_key),
    exam_hash_key VARCHAR(64) NOT NULL REFERENCES hub_exam(exam_hash_key),
    load_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    record_source VARCHAR(100) NOT NULL
);

CREATE TABLE link_plan_topic (
    plan_topic_hash_key VARCHAR(64) PRIMARY KEY,
    study_plan_hash_key VARCHAR(64) NOT NULL REFERENCES link_study_plan(study_plan_hash_key),
    topic_hash_key VARCHAR(64) NOT NULL REFERENCES hub_topic(topic_hash_key),
    load_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    record_source VARCHAR(100) NOT NULL
);

CREATE TABLE link_practice_test (
    practice_test_hash_key VARCHAR(64) PRIMARY KEY,
    student_hash_key VARCHAR(64) NOT NULL REFERENCES hub_student(student_hash_key),
    topic_hash_key VARCHAR(64) NOT NULL REFERENCES hub_topic(topic_hash_key),
    load_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    record_source VARCHAR(100) NOT NULL
);

CREATE TABLE sat_student (
    student_hash_key VARCHAR(64) NOT NULL REFERENCES hub_student(student_hash_key),
    load_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(100),
    registration_date DATE,
    record_source VARCHAR(100) NOT NULL,
    PRIMARY KEY (student_hash_key, load_date)
);

CREATE TABLE sat_exam (
    exam_hash_key VARCHAR(64) NOT NULL REFERENCES hub_exam(exam_hash_key),
    load_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    exam_name VARCHAR(150) NOT NULL,
    exam_date DATE NOT NULL,
    record_source VARCHAR(100) NOT NULL,
    PRIMARY KEY (exam_hash_key, load_date)
);

CREATE TABLE sat_topic (
    topic_hash_key VARCHAR(64) NOT NULL REFERENCES hub_topic(topic_hash_key),
    load_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    topic_name VARCHAR(150) NOT NULL,
    description TEXT,
    record_source VARCHAR(100) NOT NULL,
    PRIMARY KEY (topic_hash_key, load_date)
);

CREATE TABLE sat_study_plan (
    study_plan_hash_key VARCHAR(64) NOT NULL REFERENCES link_study_plan(study_plan_hash_key),
    load_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    record_source VARCHAR(100) NOT NULL,
    PRIMARY KEY (study_plan_hash_key, load_date)
);

CREATE TABLE sat_plan_topic (
    plan_topic_hash_key VARCHAR(64) NOT NULL REFERENCES link_plan_topic(plan_topic_hash_key),
    load_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    completion_status VARCHAR(50) NOT NULL,
    record_source VARCHAR(100) NOT NULL,
    PRIMARY KEY (plan_topic_hash_key, load_date)
);

CREATE TABLE sat_practice_test (
    practice_test_hash_key VARCHAR(64) NOT NULL REFERENCES link_practice_test(practice_test_hash_key),
    load_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    score INTEGER NOT NULL,
    attempt_date DATE NOT NULL,
    record_source VARCHAR(100) NOT NULL,
    PRIMARY KEY (practice_test_hash_key, load_date)
);