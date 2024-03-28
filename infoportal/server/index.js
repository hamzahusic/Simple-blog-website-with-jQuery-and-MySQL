const express = require("express");
const userRoutes = require("./userRoutes");
const objavaRoutes = require("./objavaRoutes");
const bodyParser = require('body-parser');
const app = express();
const cors = require('cors');

app.use(express.json());
app.use(bodyParser.json())
app.use(cors());
//Port
const PORT = 8080;

app.use("/user",userRoutes);
app.use("/objava",objavaRoutes);

app.listen(PORT, () => {
    console.log("Server is listening to port " + PORT)
})