/* ----------DOC ----------
    Cette requette consiste à creer une View sur des requettes SELECT qui va nous  -
    - renvoyer la liste des messages entre deux utilisateurs
    */
CREATE VIEW message_by_sender AS
SELECT message_content, first_name, seen_datetime
    FROM message
    INNER JOIN account
    ON message.id_account_sender = account.id_account
    WHERE account.id_account = 1
    AND message.id_account_receiver = 2
    ORDER BY seen_datetime DESC;
       
CREATE VIEW message_by_receiver AS
SELECT message_content, first_name, seen_datetime
    FROM message
    INNER JOIN account
    ON message.id_account_receiver = account.id_account
    WHERE account.id_account = 2
    AND message.id_account_sender = 1
    ORDER BY seen_datetime DESC;

CREATE VIEW message_with_multipleUser AS
SELECT * FROM message_by_sender
UNION
SELECT * FROM message_by_receiver;

SELECT * FROM message_with_multipleUser;

/*
social_media=# SELECT * FROM message_with_multipleUser;
                   message_content                    | first_name |       seen_datetime
------------------------------------------------------+------------+----------------------------
 Hello !                                              | Heaven     | 2022-08-03 20:44:54.628997
 Hello !                                              | Mozell     | 2022-08-03 20:44:54.628997
 I am doing good, is our date still okay for 6:00pm ? | Heaven     | 2022-08-03 20:45:01.628997
 I am doing good, is our date still okay for 6:00pm ? | Mozell     | 2022-08-03 20:45:01.628997
 I just grabbed some tickets to see the avengers...   | Heaven     | 2022-08-03 20:45:04.628997
 I just grabbed some tickets to see the avengers...   | Mozell     | 2022-08-03 20:45:04.628997
 Okay, later !                                        | Heaven     |
 Okay, later !                                        | Mozell     |
(8 rows)
*/