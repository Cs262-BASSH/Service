-- Get the users.
SELECT *
  FROM users
  ;

-- Get the items.
SELECT * 
  FROM userItem
  ;

-- Get all items uploaded by user 1
SELECT *
  FROM userItem
 WHERE UserID = 1
 ;

-- Get the items in category 2.
  SELECT *
    FROM userItem
    WHERE categoryNum = 2
ORDER BY score DESC
   LIMIT 3
   ;

-- Get the cross-product of all the tables.
SELECT *
  FROM users, userItem
  ;