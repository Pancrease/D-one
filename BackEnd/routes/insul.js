const express = require("express");
const router = express.Router();
const { Isauth } = require("../Middlewares/auth");

const { AddInsul } = require("../controllers/insul");

router.post("/post-insul", AddInsul);

module.exports = router;
