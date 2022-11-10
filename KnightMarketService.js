/**
 * This module implements a REST-inspired webservice for the Monopoly DB.
 * The database is hosted on ElephantSQL.
 *
 * Currently, the service supports the player table only.
 *
 * To guard against SQL injection attacks, this code uses pg-promise's built-in
 * variable escaping. This prevents a client from issuing this URL:
 *     https://cs262-monopoly-service.herokuapp.com/players/1%3BDELETE%20FROM%20PlayerGame%3BDELETE%20FROM%20Player
 * which would delete records in the PlayerGame and then the Player tables.
 * In particular, we don't use JS template strings because it doesn't filter
 * client-supplied values properly.
 *
 * TODO: Consider using Prepared Statements.
 *      https://vitaly-t.github.io/pg-promise/PreparedStatement.html
 *
 * @author: kvlinden
 * @date: Summer, 2020
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

router.get("/users", readUsers);
router.get("/users/:id", readUser);
router.put("/users/:id", UpdateUser);
router.post('/users', createUser);
router.delete('/users/:id', deleteUser);




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

function returnDataOr404(res, data) {
    if (data == null) {
        res.sendStatus(404);
    } else {
        res.send(data);
    }
}

function readHelloMessage(req, res) {
    res.send('Hello, CS 262 Team baash Knight Market service!');
}

 function readUserItems(req, res, next) {
    db.many("SELECT * FROM useritem")
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            next(err);
        })
}

function readUserItem(req, res, next) {
    db.oneOrNone('SELECT * FROM useritem WHERE userid=${userid}', req.params)
        .then(data => {
            returnDataOr404(res, data);
        })
        .catch(err => {
            next(err);
        });
}

function UpdateUserItem(req, res, next) {
    db.oneOrNone('UPDATE useritem SET userid=${body.userid},name=${body.name},time=${body.time}, categorynum=${body.categorynum}, price=${body.price}, description=${body.description}, imageurl=${body.imageurl} WHERE id=${params.id} RETURNING id', req)
        .then(data => {
            returnDataOr404(res, data);
        })
        .catch(err => {
            next(err);
        });
}

function createUseritem(req, res, next) {
    db.one('INSERT INTO useritem(userid, name, time, categorynum, price,description,imageurl) VALUES (${userid}, ${name} , ${time} , ${categorynum},${price},${description},${imageurl}) RETURNING id', req.body)
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            next(err);
        });
}

function deleteUseritem(req, res, next) {
    db.oneOrNone('DELETE FROM useritem WHERE id=${id} RETURNING id', req.params)
        .then(data => {
            returnDataOr404(res, data);
        })
        .catch(err => {
            next(err);
        });
}




 function readUsers(req, res, next) {
    db.many("SELECT * FROM user")
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            next(err);
        })
}



function readUser(req, res, next) {
    db.oneOrNone('SELECT * FROM user WHERE id=${id}', req.params)
        .then(data => {
            returnDataOr404(res, data);
        })
        .catch(err => {
            next(err);
        });
}

function UpdateUser(req, res, next) {
    db.oneOrNone('UPDATE useritem SET email=${body.email}, name=${body.name}, password=${body.password}, phonenum=${body.phonenum} WHERE id=${params.id} RETURNING id', req)
        .then(data => {
            returnDataOr404(res, data);
        })
        .catch(err => {
            next(err);
        });
}

function createUser(req, res, next) {
    db.one('INSERT INTO useritem(email, name, password, phonenum) VALUES (${email}, ${name} , ${password} , ${phonenum}) RETURNING id', req.body)
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            next(err);
        });
}

function deleteUser(req, res, next) {
    db.oneOrNone('DELETE FROM useritem WHERE id=${id} RETURNING id', req.params)
        .then(data => {
            returnDataOr404(res, data);
        })
        .catch(err => {
            next(err);
        });
}
