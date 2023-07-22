/* Опишите базу данных для школьного кабинета, в рамках которой можно фиксировать, кто и в какое время сидел за той или иной партой.
Место ученика — это ряд, парта, вариант.
В течение одного дня у разных классов бывает несколько уроков.
Создайте минимум 3 таблицы: «Кабинет», «Ученик» и сводная таблица, где отображаются парты и ученики.
Используйте поля «началоурока» и «конецурока» с типом данных TimeStamp. */

CREATE TABLE people (
  person_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  _row VARCHAR(10) NOT NULL
);

CREATE TABLE classes (
  class_id INT,
  class VARCHAR(30),
  FOREIGN KEY (class_id) REFERENCES people(person_id)
);

CREATE TABLE _tables (
  _tables_id INT,
  _table VARCHAR(30),
  FOREIGN KEY (_tables_id) REFERENCES people(person_id)
);

CREATE TABLE cabinets (
  cabinet_id INT,
  cabinet VARCHAR(50),
  FOREIGN KEY (cabinet_id) REFERENCES people(person_id)
);

CREATE TABLE timestamp_in (
  time_in_id INT, 
  time_in TIMESTAMP,
  FOREIGN KEY (time_in_id) REFERENCES classes(class_id)
);

CREATE TABLE timestamp_out (
  time_out_id INT, 
  time_out TIMESTAMP,
  FOREIGN KEY (time_out_id) REFERENCES classes(class_id)
);

INSERT INTO people (person_id, name, _row)
VALUES (1, 'Иванов И.И.', 'Ряд-1'), (2, 'Петров П.П.', 'Ряд-2'), (3, 'Башаров Б.Б.', 'Ряд-2'), (4, 'Сидоров С.С.', 'Ряд-3');

INSERT INTO classes (class_id, class)
VALUES (1, 'Алгебра'), (1, 'Геометрия'), (1, 'Математика'), (1, 'Русский'), (1, 'Физкультура'), (2, 'Английский'), (3, 'Английский'), (3, 'Физкультура'), (4, 'Рисование'); 

INSERT INTO _tables (_tables_id, _table)
VALUES (1, 'Парта-3'), (2, 'Парта-1'), (3, 'Парта-1'), (4, 'Парта-2');

INSERT INTO cabinets (cabinet_id, cabinet)
VALUES (1, '101'), (1, '125'), (1, '256'), (2, '48'), (3, '26'), (4, '555');

INSERT INTO timestamp_in (time_in_id, time_in)
VALUES (1, '2023-06-25 09:30'), (2, '2023-06-25 10:30'), (3, '2023-06-25 11:30'), (4, '2023-06-25 12:30');

INSERT INTO timestamp_out (time_out_id, time_out)
VALUES (1, '2023-06-25 11:00'), (2, '2023-06-25 12:00'), (3, '2023-06-25 13:00'), (4, '2023-06-25 14:00');

SELECT * From people INNER JOIN _tables ON people.person_id = _tables._tables_id INNER JOIN classes ON people.person_id = classes.class_id INNER JOIN cabinets ON people.person_id = cabinets.cabinet_id;