

CREATE TABLE `Film_Type` (                
  `Type_ID` int(11),
  `Romantic` boolean,
  `Adventure` boolean,
  `Comedy` boolean,
  `Drama` boolean,
  `Horror` boolean,
  `Action` boolean,
  `Animated` boolean,
  `Science Fiction` boolean,
  `Historical` boolean,
  `Thriller` boolean,
  PRIMARY KEY (`Type_ID`)
  
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ;


CREATE TABLE IF NOT EXISTS `Cinema_Films` (     
  `Film_ID` int(11) AUTO_INCREMENT,
  `Film_Name` varchar(30) NOT NULL,
  `Film_Duration` time NOT NULL,
  `Film_Title` varchar(100) NOT NULL,
  `Film_Information` varchar(500),
  `Film_Banner` varchar(300),
  `Showing` boolean,
  `ComingSoon` boolean,
  PRIMARY KEY (`Film_ID`)
  
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ;




CREATE TABLE IF NOT EXISTS `Typing` (
  `Type_ID` int(11) ,
  `Film_ID` int(11),
   PRIMARY KEY(`Type_ID`,`Film_ID`),
   FOREIGN KEY(`Type_ID`) REFERENCES Film_Type(`Type_ID`)
   ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(`Film_ID`) REFERENCES Cinema_Films(`Film_ID`)
   ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;






CREATE TABLE IF NOT EXISTS `TComment` (
  `Comment_ID` int(11) AUTO_INCREMENT,
  `Comment_Text` varchar(1500) NOT NULL,
  `Comment_Like` int NOT NULL DEFAULT '0',
  `date` datetime Not NULL, 
  PRIMARY KEY (`Comment_ID`)
  
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ;



CREATE TABLE IF NOT EXISTS `RComment` (
  `Comment_ID` int(11) ,
  `Film_ID` int(11),
   
  PRIMARY KEY (`Comment_ID`, `Film_ID`),
  FOREIGN KEY(`Comment_ID`) REFERENCES TComment(`Comment_ID`)
  ON DELETE CASCADE
		ON UPDATE cascade ,
   FOREIGN KEY(`Film_ID`) REFERENCES Cinema_Films(`Film_ID`)
  ON DELETE CASCADE
		ON UPDATE cascade
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ;


CREATE TABLE IF NOT EXISTS `Rate` (
  `Rate_ID` int(11) AUTO_INCREMENT,
  `Rate_Size` int NOT NULL,
  `Rate_Sum` int NOT NULL,  
  PRIMARY KEY (`Rate_ID`)
  
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ;


CREATE TABLE IF NOT EXISTS `Rating` (
  `Rating_ID` int(11) AUTO_INCREMENT,
  `Rate_ID` int(11),
  `Film_ID` int(11), 
  PRIMARY KEY (`Rating_ID`),
   FOREIGN KEY(`Rate_ID`) REFERENCES Rate(`Rate_ID`)
   ON DELETE CASCADE
		ON UPDATE cascade ,
   FOREIGN KEY(`Film_ID`) REFERENCES Cinema_Films(`Film_ID`)
  ON DELETE CASCADE
		ON UPDATE cascade
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ;

CREATE TABLE IF NOT EXISTS `Guest` (
  `Guest_ID` int(11) AUTO_INCREMENT,
  PRIMARY KEY (`Guest_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ;





CREATE TABLE IF NOT EXISTS `Film_Person` (			
  
  `Person_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Person_Name` varchar(100) NOT NULL, 
  `Person_Banner` varchar(300),   
  `Person_Sex` varchar(5) NOT NULL,
  `Crew` boolean NOT NULL DEFAULT false , 
  `Director_Famous` int ,
  `Director_TotalFilm` int ,
  `Performor_Famous` int ,
  `Performer_StartYear` YEAR ,
  CONSTRAINT Psex CHECK (`Person_Sex`=`W` OR `Person_Sex`=`M` ),
  PRIMARY KEY (`Person_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ;


CREATE TABLE IF NOT EXISTS `Producer_Company`(
 `Company_ID` int(11) NOT NULL AUTO_INCREMENT,
 `Company_Name` varchar(100) NOT NULL,             
 `Company_Establishment` year NOT NULL,
 PRIMARY KEY (`Company_ID`)
 ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ;


CREATE TABLE IF NOT EXISTS `Make`(
 `Company_ID` int(11) NOT NULL,
 `Film_ID` int(11) NOT NULL,               
 `Make_Date` year NOT NULL,
 PRIMARY KEY (`Company_ID`)
 ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ;

CREATE TABLE IF NOT EXISTS `Manage`(
 `Person_ID` int(11) NOT NULL,
 `Film_ID` int(11) NOT NULL, 
 PRIMARY KEY (`Person_ID`,`Film_ID` ),
 FOREIGN KEY (`Person_ID`) REFERENCES `Film_Person`(`Person_ID`)
    ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (`Film_ID`) REFERENCES `Cinema_Films`(`Film_ID`)
    ON DELETE CASCADE ON UPDATE CASCADE
 ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ;

 
 CREATE TABLE IF NOT EXISTS `Act`(
 `Person_ID` int(11) NOT NULL,
 `Film_ID` int(11) NOT NULL, 
 PRIMARY KEY (`Person_ID`,`Film_ID` ),
 FOREIGN KEY (`Person_ID`) REFERENCES `Film_Person`(`Person_ID`)
    ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (`Film_ID`) REFERENCES `Cinema_Films`(`Film_ID`)
    ON DELETE CASCADE ON UPDATE CASCADE
 ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ;


CREATE TABLE IF NOT EXISTS `Work_Film`(
 `Person_ID` int(11) NOT NULL,
 `Film_ID` int(11) NOT NULL, 
 PRIMARY KEY (`Person_ID`,`Film_ID` ),
 FOREIGN KEY (`Person_ID`) REFERENCES `Film_Person`(`Person_ID`)
    ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (`Film_ID`) REFERENCES `Cinema_Films`(`Film_ID`)
    ON DELETE CASCADE ON UPDATE CASCADE
 ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ;




CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11),
  `username` varchar(30) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `email` varchar(100) NOT NULL,
  `isactive` tinyint(1) NOT NULL DEFAULT '0',
  `activekey` varchar(15) NOT NULL DEFAULT '0',
  `resetkey` varchar(15) NOT NULL DEFAULT '0',
  `User_Rate` int NOT NULL DEFAULT '0',
  `Admin` boolean NOT NULL DEFAULT false,
  PRIMARY KEY (`id`),
  UNIQUE (`username`),
  CONSTRAINT CUserrate CHECK (`User_Rate`> 0 ),
  CONSTRAINT CUserid CHECK (`id`> 0 )
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=73 ;




CREATE TABLE IF NOT EXISTS `comments`(
   
    `username` varchar(30) NOT NULL,
    `comment` varchar(1500) NOT NULL,
     `date` datetime Not NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=73 ;


CREATE TABLE IF NOT EXISTS `attempts` (
  `ip` varchar(15) NOT NULL,
  `count` int(11) NOT NULL,
  `expiredate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `activitylog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `username` varchar(30) NOT NULL,
  `action` varchar(100) NOT NULL,
  `additionalinfo` varchar(500) NOT NULL DEFAULT 'none',
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

CREATE TABLE IF NOT EXISTS `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `expiredate` datetime NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;


CREATE TABLE user_count (users int);

INSERT INTO user_count (users) VALUES(0);


CREATE TRIGGER increment_users
BEFORE INSERT ON users REFERENCING NEW ROW AS New
FOR EACH ROW
UPDATE user_count SET user_count.users = user_count.users+1;





