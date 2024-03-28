const express = require("express");
const mysqlPool = require('./connection');
const bcrypt = require('bcrypt');

const router = express.Router();

//ADD USER
router.post("/add", async (req,res) => {

        try {
            const { ime, prezime,sifra, email, uloga } = req.body;

            const sqlCheck = 'SELECT email FROM korisnik WHERE email = ?';

            mysqlPool.query(sqlCheck, [email], (error,results) => {
                if (error) {
                    console.error(error);
                    return res.status(500).send("Internal server error");
                }
            
                if (results.length != 0) {
                    return res.status(404).json({ message: 'User already exists' });
                }
                
                const sql = 'INSERT INTO korisnik (ime, prezime, sifra, email,uloga) VALUES (?, ?, ?, ?,?)';
            
                const saltRounds = 10;
                bcrypt.hash(sifra, saltRounds, (err,hashPass) => {
                    
                    mysqlPool.query(sql, [ime, prezime, hashPass, email, uloga], (error,finalResult) => {
                        
                        if (error) {
                            console.error(error);
                            return res.status(500).send('Error creating user');
                        } else {
                            return res.status(200).json({ message: 'user created successfully', "Record inserted": finalResult });
                        }
                        
                    });
                
                });
                

            });               
        
        } catch (err) {
            console.error(err.message);
            return res.status(500).json({ message: 'Internal server error' });
        }
    }
);

//GET USER

router.post("/get", async (req,res) => {

    try {
        const { email, sifra} = req.body;

        const sql = 'SELECT * FROM korisnik WHERE email = ?';
        

        mysqlPool.query(sql, [email], (err, results) => {
            if (err) {
                console.error(err);
                return res.status(500).send("Internal server error");
            }
        
            if (results.length === 0) {
                return res.status(404).json({ message: 'User not found' });
            }
        
            const user = results[0]; //Prvi korisnik od naseg rezultata
            
            
            // Uparivanje sifre iz baze i dobijene sifre od korisnika
            bcrypt.compare(sifra, user.Sifra, (compareErr, isValidPassword) => {
                if (compareErr) {
                    console.error(compareErr);
                    return res.status(500).send("Internal server error");
                }
        
                if (isValidPassword) {
                    return res.status(200).json({ message: 'Valid user', userInfo: user });
                } else {
                    return res.status(404).json({ message: 'Wrong password' });
                }
            });
        });
        


           
    } catch (err) {
        console.error(err.message);
        return res.status(500).json({ message: 'Internal server error' });
    }

})

//DELETE USER

router.delete('/', async (req,res) => {
    try {
        const { email} = req.body;

        const sql = 'DELETE FROM korisnik WHERE email = ?';
        

        mysqlPool.query(sql, [email], (err, results) => {
            if (err) {
                console.error(err);
                return res.status(500).send("Internal server error");
            }
        
            if (results.length === 0) {
                return res.status(404).json({ message: 'User not found' });
            }
        
            console.log(results)

            return res.status(200).json({ message: 'User deleted', userInfo: results });
        });
        
    
    } catch (err) {
        console.error(err.message);
        return res.status(500).json({ message: 'Internal server error' });
    }
})


module.exports = router;