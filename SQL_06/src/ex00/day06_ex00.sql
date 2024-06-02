-- Active: 1697716461946@@127.0.0.1@5432@day4
CREATE TABLE person_discounts (
    id INT PRIMARY KEY,
    person_id bigint not null ,
    pizzeria_id bigint not null ,
    discount NUMERIC,
    CONSTRAINT fk_person_discounts_person_id FOREIGN KEY (person_id) REFERENCES person (id),
    CONSTRAINT fk_person_discounts_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES pizzeria (id)
);