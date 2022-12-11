    -- delete Drop table commend after confirm
    DROP TABLE IF EXISTS userItem;
    DROP TABLE IF EXISTS users;





    -- Create the schema.
    CREATE TABLE users (
        ID SERIAL PRIMARY KEY,
        email varchar(50),
        name varchar(50),
        password varchar(50),
        phoneNum varchar(50)
        );

    


    CREATE TABLE userItem (
        ID SERIAL PRIMARY KEY,
        UserID integer REFERENCES users(ID),
        name varchar(50),
        time timestamp,
        categoryNum integer,
        price integer,
        description varchar(50),
        imageURL varchar(3000)
        );







    -- Allow users to select data from the tables.
    GRANT SELECT ON users TO PUBLIC;
    GRANT SELECT ON UserItem TO PUBLIC;



    -- Add sample records.
    INSERT INTO users(email, name, password, phoneNum) VALUES ('sad@gmail.com', 'Daniel', 'joeymai', '6165267111');
    INSERT INTO users(email, name, password, phoneNum) VALUES ('gw3@gmail.com', 'Ginny', 'charmander', '7036112512');
    INSERT INTO users(email, name, password, phoneNum) VALUES ( 'll8@gmail.com', 'Luna', 'squirtle', '7031577512');
    INSERT INTO users(email, name, password, phoneNum) VALUES ('tn4@gmail.com', 'Theodore', 'kingkong', '7031512882');
    INSERT INTO users(email, name, password, phoneNum) VALUES ('rw1@gmail.com', 'Ronald', 'gardevoir', '7031512512');
    INSERT INTO users(email, name, password, phoneNum) VALUES ('bz9@gmail.com', 'Blaise', 'skittles', '7031558512');
    INSERT INTO users(email, name, password, phoneNum) VALUES ('hg16@gmail.com', 'Hermione', 'joemamas', '7095512512');
    INSERT INTO users(email, name, password, phoneNum) VALUES ('hjp@gmail.com', 'Harry', 'haribo', '7031510012');
    INSERT INTO users(email, name, password, phoneNum) VALUES ('dm11@gmail.com', 'Draco', 'dracomalfoy', '7341512512');
    INSERT INTO users(email, name, phoneNum) VALUES ('sad@gamilc.om', 'Daniel', '7031512512');
    INSERT INTO users(email, name, phoneNum) VALUES ('asf@gamilc.om', 'Kwon', '730231928');
    INSERT INTO users(email, name, password, phoneNum) VALUES ('a', 'b', 'c', '730231928'); 


    INSERT INTO userItem(UserID, name, time, categoryNum, price, description, imageURL) VALUES (1, 'Cute lamp', '2006-06-27 08:00:00', 1, 50, 'a nice lamp, like new', 'https://tse4.mm.bing.net/th?id=OIP.EbYmxg_tZuqNed4AVC-E5AHaLt&pid=Api&P=0' );

    INSERT INTO userItem(UserID, name, time, categoryNum, price, description, imageURL) VALUES (2, 'Moon lamp', '2007-06-27 08:00:00', 1, 70, 'floating moon lamp', 'https://tse1.mm.bing.net/th?id=OIP.svOGhGHraEX8rvOywC_GtAHaHa&pid=Api&rs=1&c=1&qlt=95&w=122&h=122' );

    INSERT INTO userItem(UserID, name, time, categoryNum, price, description, imageURL) VALUES (7, 'Gaming chair', '2006-06-17 08:00:00', 2, 150, 'comfortable gaming chair', 'https://tse3.mm.bing.net/th?id=OIP.ck8jF-QBqAWKTjKiCE7BpQHaHa&pid=Api&P=0' ); 

    INSERT INTO userItem(UserID, name, time, categoryNum, price, description, imageURL) VALUES (2, 'Standing Desk', '2006-12-27 08:00:00', 3, 90, 'standing desk that’s good for your back', 'https://tse1.mm.bing.net/th?id=OIP.ErIpt7tvXtNQIB_nw50snwHaHa&pid=Api&P=0' ) ;

    INSERT INTO userItem(UserID, name, time, categoryNum, price, description, imageURL) VALUES (1, 'Xbox', '2006-06-27 08:00:00', 4, 180, 'xbox in working order', 'https://tse1.mm.bing.net/th?id=OIP.Rg2x5XoYQVbIj0y7Jgw7yAHaEg&pid=Api&P=0' ) ;

    INSERT INTO userItem(UserID, name, time, categoryNum, price, description, imageURL) VALUES (8, 'Old laptop', '2010-05-27 08:00:00', 5, 145, 'legacy laptop', 'https://tse1.mm.bing.net/th?id=OIP.rgsPredS4vrVoteY2kqFUQHaJ4&pid=Api&P=0' ) ;

    INSERT INTO userItem(UserID, name, time, categoryNum, price, description, imageURL) VALUES (9, 'Sofa', '2009-06-27 08:00:00', 6, 450, 'expensive sofa, like new', 'https://tse1.mm.bing.net/th?id=OIP.pMkwm1FE6YPf5m8cCnB-ZgHaGO&pid=Api&P=0') ;

    INSERT INTO userItem(UserID, name, time, categoryNum, price, description, imageURL) VALUES (6, 'Manga', '2006-08-27 08:00:00', 7, 150, 'naruto boxset', 'https://tse3.mm.bing.net/th?id=OIP.wVNA5dPbTSHGnm4LFu3vkQHaHa&pid=Api&P=0' ) ;

    INSERT INTO userItem(UserID, name, time, categoryNum, price, description, imageURL) VALUES (2, 'Twin lamps', '2007-06-27 08:00:00', 1, 75, 'twin lamps', 'https://tse2.mm.bing.net/th?id=OIP.81iPowM7AA4ClJ83qmTmKgHaHa&pid=Api&P=0' ) ;

    INSERT INTO userItem(UserID, name, time, categoryNum, price, description, imageURL) VALUES (1, 'Good Chair', '2006-06-17 08:00:00', 2, 350, 're-upholstered chair', 'https://tse1.mm.bing.net/th?id=OIP.I4jtMYxllVGU7i9rwgmNuwHaJ4&pid=Api&P=0' ) ;

    INSERT INTO userItem(UserID, name, time, categoryNum, price, description, imageURL) VALUES (2, 'Desk', '2006-12-27 08:00:00', 3, 110, 'living room desk', 'https://tse3.mm.bing.net/th?id=OIP.RDhY7jY9oVkeafGzxwyiegHaHa&pid=Api&P=0' ) ;

    INSERT INTO userItem(UserID, name, time, categoryNum, price, description, imageURL) VALUES (1, 'Coffee maker', '2006-06-27 08:00:00', 4, 40, 'high tech coffee maker', 'https://tse2.mm.bing.net/th?id=OIP.O5PEVhER1z9ASi6LzIBlVQHaHa&pid=Api&P=0' ) ;

    INSERT INTO userItem(UserID, name, time, categoryNum, price, description, imageURL) VALUES (1, 'Scale', '2006-06-27 08:00:00', 4, 55, 'measuring scale', 'https://tse3.mm.bing.net/th?id=OIP.WNUzmFi3lrhXs49OEPJZJgHaHa&pid=Api&P=0'); 

    INSERT INTO userItem(UserID, name, time, categoryNum, price, description, imageURL) VALUES (4, 'Pressure cooker', '2006-06-27 08:00:00', 4, 90, 'pressure cooker', 'https://tse1.mm.bing.net/th?id=OIP.is_keQCjlVncnbzh7RKN0AHaII&pid=Api&P=0') ;

    INSERT INTO userItem(UserID, name, time, categoryNum, price, description, imageURL) VALUES (1, 'Mixer', '2006-06-27 08:00:00', 4, 60, 'industrial standard mixer', 'https://tse3.mm.bing.net/th?id=OIP.xQqiiR78wvRnq0oe6Y9A6gHaHX&pid=Api&P=0') ;

    INSERT INTO userItem(UserID, name, time, categoryNum, price, description, imageURL) VALUES (8, 'Gaming setup', '2010-05-27 08:00:00', 5, 270, 'full gaming setup', 'https://tse1.mm.bing.net/th?id=OIP.ndrUOCNwDav4J2gvcF57NwHaHa&pid=Api&P=0' ) ;

    INSERT INTO userItem(UserID, name, time, categoryNum, price, description, imageURL) VALUES (9, 'Loveseat', '2009-06-27 08:00:00', 6, 265, 'velvet loveseat', 'https://tse2.mm.bing.net/th?id=OIP.1kNsldthEblUHDZ8c7Cp6QHaE8&pid=Api&P=0' ) ;

    INSERT INTO userItem(UserID, name, time, categoryNum, price, description, imageURL) VALUES (5, 'Compsci textbook', '2006-08-27 08:00:00', 7, 50, 'Computer science C++ textbook', 'https://tse1.mm.bing.net/th?id=OIP.1jRwP0MWOX9YjzykVAES-wAAAA&pid=Api&P=0' ) ;

    INSERT INTO userItem(UserID, name, time, categoryNum, price, description, imageURL) VALUES (5, 'Plant', '2006-08-27 08:00:00', 7, 15, 'cute plant', 'https://tse2.mm.bing.net/th?id=OIP.OwTXk2H_46H302u0v3sYewHaHs&pid=Api&P=0') ;

    INSERT INTO userItem(UserID, name, time, categoryNum, price, description, imageURL) VALUES (3, 'Mason jar', '2006-08-27 08:00:00', 7, 35, 'mason jar set', 'https://tse1.mm.bing.net/th?id=OIP.ICsYU44uCRJ1ELzwWj-8cgHaFj&pid=Api&rs=1&c=1&qlt=95&w=144&h=108') ;
    INSERT INTO userItem(UserID, name, time, categoryNum, price, description, imageURL) VALUES (5, 'Backpack', '2006-08-27 08:00:00', 7, 28, 'used backpack', 'https://tse1.mm.bing.net/th?id=OIP.Bp4FVWIm0gm8TV4jWfH95gHaLH&pid=Api&P=0') ;
