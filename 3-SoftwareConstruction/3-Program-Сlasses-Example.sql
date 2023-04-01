CREATE OR REPLACE TYPE Writer AS OBJECT (
  id_writer INT,
  name VARCHAR2(50),
  photo VARCHAR2(100),
  brief_description VARCHAR2(4000),
  СONSTRUCTOR FUNCTION Writer RETURN SELF AS RESULT,
  MEMBER PROCEDURE SendMessage(Message_text VARCHAR2, Receiver_id INT),
  MEMBER PROCEDURE ReceiveMessage(Sender_id INT),
  MEMBER PROCEDURE CreateWriting(Title VARCHAR2, Text_writing TEXT),
  MEMBER PROCEDURE PROCEDURE display
);
/

REATE TYPE Writer_List IS TABLE OF Writer;
/

CREATE OR REPLACE TYPE SomnologistDoctor AS OBJECT (
  id_doctor INT,
  name VARCHAR2(50),
  photo VARCHAR2(100),
  phone_number VARCHAR2(10),
  experience NUMBER(2),
  CONSTRUCTOR FUNCTION Doctor RETURN SELF AS RESULT,
  MEMBER PROCEDURE SendMessage(Message_text VARCHAR2, Receiver_id INT),
  MEMBER PROCEDURE ReceiveMessage(Sender_id INT)
  MEMBER PROCEDURE PROCEDURE display
);
/

REATE TYPE SomnologistDoctor_List IS TABLE OF SomnologistDoctor;
/

CREATE OR REPLACE TYPE Message AS OBJECT (
   Message_text VARCHAR2(2000),
   Sender_id INT,
   Receiver_id INT,
   Sent_time DATE DEFAULT SYSDATE,
   Is_read BOOLEAN DEFAULT FALSE
);
/

REATE TYPE Message_List IS TABLE OF Message;
/

CREATE OR REPLACE TYPE Writing AS OBJECT (
  id_writing INT,
  Title VARCHAR2(255),
  Text_writing TEXT,
  Author INT,
  CONSTRUCTOR FUNCTION Writing RETURN SELF AS RESULT
);
/

REATE TYPE Writing_List IS TABLE OF Writing;
/
