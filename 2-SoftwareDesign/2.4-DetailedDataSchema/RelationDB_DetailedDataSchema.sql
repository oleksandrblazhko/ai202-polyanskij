/* видалення таблиць з каскадним видаленням
можливих описів цілісності */
drop table Writer CASCADE CONSTRAINTS;
drop table Somnologist_doctor CASCADE CONSTRAINTS;
drop table Message_doctor_writer CASCADE CONSTRAINTS;
drop table Writing CASCADE CONSTRAINTS;

CREATE TABLE Writer ( -- опис письменника
  id_writer INT, -- ідентифікатор
  Name VARCHAR(50), -- ім'я письменника
  Photo VARCHAR(100), -- посилання на фото
  Brief_description TEXT -- короткий опис письменника
);

-- обмеження первинного ключа
ALTER TABLE Writer ADD CONSTRAINT pk_Writer
    PRIMARY KEY (id_writer);

-- обмеження вмісту стовпчика таблиці
ALTER TABLE Writer MODIFY (Name NOT NULL);

CREATE TABLE Somnologist_doctor ( -- опис лікарів-сомнологів
  id_doctor INT, -- ідентифікатор лікаря
  Name VARCHAR(50), -- ім'я лікаря
  Photo VARCHAR(100), -- посилання на фото лікаря
  Phone_number VARCHAR(10), -- номер телефону лікаря
  Experience NUMBER(2), -- стаж роботи лікаря
);

-- обмеження первинного ключа
ALTER TABLE Somnologist_doctor ADD CONSTRAINT pk_Somnologist_doctor
    PRIMARY KEY (id_doctor);

-- обмеження вмісту стовпчика таблиці
ALTER TABLE Somnologist_doctor MODIFY (Name NOT NULL);
ALTER TABLE Somnologist_doctor MODIFY (Experience NOT NULL);
ALTER TABLE Somnologist_doctor MODIFY (Phone_number NOT NULL);

CREATE TABLE Message_doctor_writer ( -- опис повідмлення
  id_message INT, -- ідентифікатор повідомлення
  id_doctor INT, -- ідентифікатор лікаря
  id_writer INT, -- ідентифікатор письменника
  message_text TEXT, -- текст повідомлення
);

-- обмеження первинного ключа
ALTER TABLE Message_doctor_writer ADD CONSTRAINT pk_Message
    PRIMARY KEY (id_message);

-- обмеження зовнішнього ключа
ALTER TABLE Message_doctor_writer ADD CONSTRAINT fk_message_doctor
    FOREIGN KEY (id_doctor) REFERENCES Somnologist_doctor(id_doctor);

-- обмеження зовнішнього ключа
ALTER TABLE Message_doctor_writer ADD CONSTRAINT fk_message_writer
    FOREIGN KEY (id_writer) REFERENCES Writer(id_writer);

-- обмеження вмісту стовпчика таблиці
ALTER TABLE Message_doctor_writer MODIFY (message_text NOT NULL);

CREATE TABLE Writing (
    id_writing INT, -- ідентифікатор тексту
    Title VARCHAR(255), -- заголовок тексту
    Text_writig TEXT, -- текст
    Author INT, -- ідентифікатор автора, який написав текст
);

-- обмеження вмісту стовпчика таблиці
ALTER TABLE Writing MODIFY (Title NOT NULL);
ALTER TABLE Writing MODIFY (Text_writig NOT NULL);

-- обмеження первинного ключа
ALTER TABLE Writing ADD CONSTRAINT pk_writing_id_writing
    PRIMARY KEY (id_writing);

-- обмеження зовнішнього ключа
ALTER TABLE Writing ADD CONSTRAINT fk_writing_author
    FOREIGN KEY (Author) REFERENCES Writer(id_writer);

-- обмеження вмісту стовпчика таблиці
ALTER TABLE Somnologist_doctor ADD CONSTRAINT phone_template
    CHECK ( regexp_like(Phone_number,'^(\([0-9]{3}\))?[0-9]{3}-[0-9]{4}$'));