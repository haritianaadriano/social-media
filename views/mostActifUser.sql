/*----------DOC-----------                                                                         *
    Cette requette cree un view qui contient des requettes selects: ce fichier consiste à ------   *
    - afficher tout les userActifs d'un compte ex: id_account = 1; c'est à dire => va afficher -   *
    - toute la liste des amis les plus actifs celon leur nombres de conversation                   *
*/                                                                              
CREATE VIEW most_actifFriend AS
SELECT first_name, COUNT(message_content)
    FROM account
    INNER JOIN message
    ON account.id_account = message.id_account_receiver
    WHERE message.id_account_sender = 1
    GROUP BY first_name
    ORDER BY COUNT(message_content) DESC;

/*
first_name | count
------------+-------
 Mozell     |     4
 Heaven     |     1
 Kameron    |     1
(3 rows)
*/