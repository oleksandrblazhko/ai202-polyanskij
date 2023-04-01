-- Створюємо нового користувача
DECLARE
   new_user User := Writer(1, 'John', 'http://example.com/photo.jpg', 'A writer');
BEGIN
   -- Відправляємо повідомлення до лікаря
   new_user.SendMessage('Hello, doctor!', 2);
END;
/

-- Створюємо нового лікаря
DECLARE
   new_doctor Doctor := SomnologistDoctor(2, 'Dr. Smith', 'http://example.com/photo.jpg', '096-555-5678', 4);
BEGIN
   -- Отримуємо повідомлення від користувача
   new_doctor.ReceiveMessage(1);
END;
/
