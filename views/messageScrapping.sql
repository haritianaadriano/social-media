/* -------Doc------
    Ce fichier sql permet de creer un "view" sur une requette select qui va afficher toutes -
    - les messages entre deux utilisateurs du reseaux sociaux
*/

SELECT  first_name, message_datetime, message_content, seen_datetime
        FROM message
        INNER JOIN account
        ON message.id_account_sender = account.id_account
        AND message.id_account_receiver = account.id_account
        ;