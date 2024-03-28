const express = require("express");
const mysqlPool = require('./connection');
const multer = require("multer");
const router = express.Router();
const fs = require("fs");

const uploadStorage = multer({ dest: "posts/" });
  
//CREATE OBJAVU
router.post('/',uploadStorage.single("putanja_slike"), async (req,res) => {

    try {
        const {naslov,sadrzaj,datum_objave,kategorija,idKorisnik} = req.body;
    
        const sql = "INSERT INTO objava (Naslov,Sadrzaj,Datum_objave,Putanja_slike,kategorija,korisnik_idkorisnik) VALUES (?,?,?,?,?,?)";
    
        mysqlPool.query(sql,[naslov,sadrzaj,datum_objave,req.file.filename,kategorija,idKorisnik], (err,result) => {
            if (err) {
                console.error(err);
                return res.status(500).send('Error creating objava');
            } else {
                return res.status(200).json({ message: 'objava created successfully', "Record inserted": result });
            }
        })
    } catch (error) {
        console.error(err.message);
        return res.status(500).json({ message: 'Internal server error' });
    }

})

//GET JEDNU OBJAVU
router.get('/one/:idObjava', async (req,res) => {
    try {
        const {idObjava} = req.params;
    
        const sql = "SELECT * FROM objava INNER JOIN korisnik ON korisnik_idkorisnik = idkorisnik WHERE idobjava = ?; ";
    
        mysqlPool.query(sql,[idObjava], (err,result) => {
            if (err) {
                console.error(err);
                return res.status(500).send('Error updating objava');
            } else {
                return res.status(200).json({ message: 'objava selected successfully', "Data": result });
            }
        })
    } catch (error) {
        console.error(err.message);
        return res.status(500).json({ message: 'Internal server error' });
    }
})

//GET SVE OBJAVE
router.get('/all', async (req,res) => {
    try {

        const sql = "SELECT * FROM objava INNER JOIN korisnik ON korisnik_idkorisnik = idkorisnik";
    
        mysqlPool.query(sql, (err,result) => {
            if (err) {
                console.error(err);
                return res.status(500).send('Error updating objava');
            } else {
                return res.status(200).json({ message: 'objava selected successfully', "Data": result });
            }
        })
    } catch (error) {
        console.error(err.message);
        return res.status(500).json({ message: 'Internal server error' });
    }
})

//UPDATE OBJAVU
router.put('/',uploadStorage.single("putanja_slike"), async (req,res) => {
    try {
        const {naslov,sadrzaj,datum_objave,kategorija,idObjava,stara_slika} = req.body;
        
        if(req.file){
            try {
                fs.unlinkSync(`./posts/${stara_slika}`);
            } catch (error) {
                console.log("No image found!");
            }
        }
        else{
            req.file = { filename: stara_slika };
        }

        const sql = "UPDATE objava SET Naslov = ?, Sadrzaj = ?, Datum_objave = ?, kategorija = ?, Putanja_slike = ? WHERE idobjava = ?; ";
    
        mysqlPool.query(sql,[naslov,sadrzaj,datum_objave,kategorija,req.file.filename,idObjava], (err,result) => {
            if (err) {
                console.error(err);
                return res.status(500).send('Error updating objava');
            } else {
                return res.status(200).json({ message: 'objava updated successfully', "Data": result });
            }
        })
    } catch (error) {
        console.error(err.message);
        return res.status(500).json({ message: 'Internal server error' });
    }
})

//DELETE OBJAVU
router.delete('/', async (req,res) => {
    try {
        const {idObjava,ime_slike} = req.body;
    
        const sql = "DELETE FROM objava WHERE idobjava = ?;";
    
        mysqlPool.query(sql,[idObjava], (err,result) => {
            if (err) {
                console.error(err);
                return res.status(500).send('Error deleting objava');
            } else {
                try {
                    fs.unlinkSync(`./posts/${ime_slike}`);
                } catch (error) {
                    console.log("No image found!");
                }
                return res.status(200).json({ message: 'objava deleted successfully', "Record deleted": result });
            }
        })
    } catch (error) {
        console.error(err.message);
        return res.status(500).json({ message: 'Internal server error' });
    }
})


module.exports = router;