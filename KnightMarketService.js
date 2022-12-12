
/**
 * This module implements a REST-inspired webservice for the KnightMarket DB.
 * The database is hosted on ElephantSQL.
 *
 *
 * @author: kvlinden
 * @adapted by: Team BASSH
 * @date: Fall, 2022
 */

// Set up the database connection.
const pgp = require('pg-promise')();
const db = pgp({
    host: process.env.DB_SERVER,
    port: process.env.DB_PORT,
    database: process.env.DB_USER,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD
});





// Configure the server and its routes.

const express = require('express');
const app = express();
const port = process.env.PORT || 3000;
const router = express.Router();
router.use(express.json());

router.get("/", readHelloMessage);

router.get("/useritem", readUserItems);
router.get("/useritem/:userid", readUserItem);
router.put("/useritem/:id", UpdateUserItem);
router.post('/useritem', createUseritem);
router.delete('/useritem/:id', deleteUseritem);

router.get("/useritem/category/:catnum", readUserItemByCat);




router.get("/Marketusers", readMarketUsers);
router.get("/Marketusers/:id", readMarketUser);
router.put("/Marketusers/:id", UpdateMarketUser);
router.post('/Marketusers', createMarketUser);
router.delete('/Marketusers/:id', deleteMarketUser);
router.get("/Marketusers/:email/:password", findMarketUser);



app.use(router);
app.use(errorHandler);
app.listen(port, () => console.log(`Listening on port ${port}`));

// Implement the CRUD operations.

function errorHandler(err, req, res) {
    if (app.get('env') === "development") {
        console.log(err);
    }
    res.sendStatus(err.status || 500);
}

//return error message if there is no data to present
function returnDataOr404(res, data) {
    if (data == null) {
        res.sendStatus(404);
    } else {
        res.send(data);
    }
}

//display welcome message on default page 
function readHelloMessage(req, res) {
    res.send('Hello, CS 262 Team baash Knight Market service!');
}

 function readUserItems(req, res, next) {
    db.many("SELECT * FROM useritem ORDER BY id DESC")
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            next(err);
        })
}

//Read select items
function readUserItem(req, res, next) {
    db.many('SELECT * FROM useritem WHERE userid=${userid}', req.params)
        .then(data => {
            returnDataOr404(res, data);
        })
        .catch(err => {
            next(err);
        });
}

//Update item with new information in fields
function UpdateUserItem(req, res, next) {
    db.oneOrNone('UPDATE useritem SET userid=${body.userid},name=${body.name},time=${body.time}, categorynum=${body.categorynum}, price=${body.price}, description=${body.description}, imageurl=${body.imageurl} WHERE id=${params.id} RETURNING id', req)
        .then(data => {
            returnDataOr404(res, data);
        })
        .catch(err => {
            next(err);
        });
}

//Create an item instance in database
function createUseritem(req, res, next) {
    db.one('INSERT INTO useritem(userid, name, time, categorynum, price,description,imageurl) VALUES (${userid}, ${name}, ${time} , ${categorynum},${price},${description},${imageurl}) RETURNING id', req.body)
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            next(err);
        });
}

//Delete a user instance in database
function deleteUseritem(req, res, next) {
    db.oneOrNone('DELETE FROM useritem WHERE id=${id} RETURNING id', req.params)
        .then(data => {
            returnDataOr404(res, data);
        })
        .catch(err => {
            next(err);
        });
}


//Display items in certain category

router.get("/useritem/category/:catnum", readUserItemByCat);

function readUserItemByCat(req, res, next) {
    db.many('SELECT * FROM useritem WHERE categorynum=${catnum}', req.params)
        .then(data => {
            returnDataOr404(res, data);
        })
        .catch(err => {
            next(err);
        });
}






 function readMarketUsers(req, res, next) {
    db.many("SELECT * FROM users")
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            next(err);
        })
}

//Select a certain user
function readMarketUser(req, res, next) {
    db.oneOrNone('SELECT * FROM users WHERE id=${id}', req.params)

        .then(data => {
            returnDataOr404(res, data);
        })
        .catch(err => {
            next(err);
        });
}





function findMarketUser(req, res, next) {
    db.oneOrNone('SELECT * FROM users WHERE email=${email} AND password=${password}' , req.params)
        .then(data => {
            returnDataOr404(res, data);
        })
        .catch(err => {
            next(err);
        });
}



function UpdateMarketUser(req, res, next) {
    db.oneOrNone('UPDATE users SET phonenum=${body.phonenum} WHERE id=${params.id} RETURNING id', req)
        .then(data => {
            returnDataOr404(res, data);
        })
        .catch(err => {
            next(err);
        });
}


//Create a user instance in database
function createMarketUser(req, res, next) {
    db.one('INSERT INTO users(email, name, password, phonenum) VALUES (${email}, ${name} , ${password} , ${phonenum}) RETURNING id', req.body)
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            next(err);
        });
}

//Delete a certain user from database
function deleteMarketUser(req, res, next) {
    db.oneOrNone('DELETE FROM users WHERE id=${id} RETURNING id', req.params)
        .then(data => {
            returnDataOr404(res, data);
        })
        .catch(err => {
            next(err);
        });
}
