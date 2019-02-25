CREATE VIEW Films AS SELECT DISTINCT
F.Film_Name, F.Film_Title, F.Film_Information, F.Film_Duration, C.Company_Name as Maked_Company , P.Person_Name as Director_Name

FROM cinema_films F NATURAL JOIN make NATURAL JOIN producer_company C NATURAL JOIN manage NATURAL JOIN film_person P ;


CREATE VIEW FilmActors AS SELECT DISTINCT
F.Film_Name, P.Person_Name as Actor_Name

FROM cinema_films F NATURAL JOIN act NATURAL JOIN film_person P ;


CREATE VIEW FilmRating AS SELECT DISTINCT
F.Film_Name, AVG(R.Rate_Sum)

FROM cinema_films F NATURAL JOIN rate R NATURAL JOIN rating
GROUP BY F.Film_Name;


CREATE VIEW FilmComments AS SELECT DISTINCT
F.Film_Name, C.Comment_Text as CommentOnFilm, C.Comment_Like as Comment_Like

FROM cinema_films F NATURAL JOIN rcomment NATURAL JOIN tcomment C;


CREATE VIEW LogForum AS SELECT DISTINCT
L.username , L.additionalinfo as CommentOnForum

FROM activitylog L 
WHERE L.action = "Forum";


CREATE VIEW LogInsert AS SELECT DISTINCT
L.username , L.additionalinfo as CommentOnForum

FROM activitylog L 
WHERE L.action = "Insert";

