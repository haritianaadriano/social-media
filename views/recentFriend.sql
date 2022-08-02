/* -------Doc------
    Ce fichier sql permet de creer un "view" sur une requette select qui va afficher tous -
    - les amis les plus recents.
*/
CREATE VIEW recent_friend AS
SELECT first_name, last_name 
        FROM friend_list
        ORDER BY friendship_birthday DESC
        LIMIT 9
        ;

/*
social_media=# SELECT * from recent_friend;
 first_name | last_name
------------+-----------
 Mozell     | Keebler
 Jena       | Mertz
 Harmon     | Sauer
 Raven      | Bahringer
(4 rows)
*/