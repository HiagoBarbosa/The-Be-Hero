const express = require("express");
const router = express.Router();

const OngController = require("./controllers/Ongs");


router.get("/ongs", OngController.all);
router.post("/ong",OngController.create);

//router.get("/caso", OngController.)


module.exports = router;