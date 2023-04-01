CREATE TYPE BODY Writer AS
   CONSTRUCTOR FUNCTION Writer RETURN SELF AS RESULT IS
   BEGIN
      RETURN;
   END;

   MEMBER PROCEDURE SendMessage(Message_text VARCHAR2, Receiver_id INT) IS
      msg Message := Message(Message_text, self.id_writer, Receiver_id);
      INSERT INTO Messages VALUES msg;
   END;

   MEMBER PROCEDURE ReceiveMessage(Sender_id INT) IS
      CURSOR message_cursor IS SELECT * FROM Messages
      WHERE Sender_id = Sender_id AND Receiver_id = self.id_writer ORDER BY Sent_time;
      msg Message;
   BEGIN
      FOR msg IN message_cursor LOOP
         DBMS_OUTPUT.PUT_LINE(msg.Message_text);
         UPDATE Messages SET Is_read = TRUE WHERE Message_id = msg.Message_id;
      END LOOP;
   END;
   MEMBER PROCEDURE display IS
   BEGIN
    DBMS_OUTPUT.PUT_LINE('Writer ID: ' || id_writer);
    DBMS_OUTPUT.PUT_LINE('Name: ' || name);
    DBMS_OUTPUT.PUT_LINE('Photo: ' || photo);
    DBMS_OUTPUT.PUT_LINE('Brief Description: ' || brief_description);
   END;
END;
