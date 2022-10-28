    DROP TABLE IF EXISTS userItem;
    DROP TABLE IF EXISTS users;





    -- Create the schema.
    CREATE TABLE users (
        ID SERIAL PRIMARY KEY,
        email varchar(50),
        name varchar(50),
        password varchar(50),
        phoneNum varchar(50),
        );

    


    CREATE TABLE userItem (
        UserID integer REFERENCES User(ID),
        time timestamp,
        categoryNum integer,
        price integer,
        description varchar(50),
        imageURL varchar(50)
        );







    -- Allow users to select data from the tables.
    GRANT SELECT ON users TO PUBLIC;
    GRANT SELECT ON UserItem TO PUBLIC;



    -- Add sample records.
    INSERT INTO users(email, name, phoneNum) VALUES ('sad@gamilc.om', 'Daniel', '7031512512')


    INSERT INTO userItem VALUES (1, '2006-06-27 08:00:00', 1, 50, 'nice lamp', '' )

