/* -------Doc------
    Ce fichier sql permet de creer un "view" sur une requette select qui va afficher toutes -
    - les listes d'amis d'un utilisateur spécifique.
*/

CREATE VIEW friend_list AS
SELECT first_name, last_name, nickname, profile_pic, friendship_birthday
        FROM account
        INNER JOIN send_invite
        ON account.id_account = send_invite.id_account_receiver
        WHERE send_invite.is_accepted = true
        AND send_invite.id_account_sender = 1
        ;

/*
    social_media=# select * from friend_list;
 first_name | last_name | nickname | profile_pic | friendship_birthday
------------+-----------+----------+-------------+---------------------
 Mozell     | Keebler   | Mozel    | Mozell.png  | 2022-07-30
 Jena       | Mertz     | Jena     | Jena.png    | 2022-07-30
 Harmon     | Sauer     | Harmo    | Harmon.png  | 2022-07-30
 Raven      | Bahringer | Raven    | Raven.png   | 2022-07-30
(4 rows)

*/