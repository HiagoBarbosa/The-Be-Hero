const express = require('json-server');
const router = express.Router();

const OngController = require("./controllers/ong");

router.get("/ong", OngController.all);
router.post("/ong", OngController.create);

module.exports = router;