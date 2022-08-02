/* -------Doc------
    Ce fichier sql permet de creer un "View" sur une requette select et d'afficher toutes les invitations -
    - non accepeter, envoyer par un "account" spécifique.
*/

CREATE VIEW invitation_non_accepted AS 
SELECT nickname, is_accepted 
        FROM send_invite
        INNER JOIN account
        ON send_invite.id_account_receiver = account.id_account
        WHERE send_invite.is_accepted = false
        AND send_invite.id_account_sender = 1
        ;

/*
social_media=# SELECT * FROM invitation_non_accepted;
 nickname | is_accepted
----------+-------------
 Rahee    | f
(1 row)

*/