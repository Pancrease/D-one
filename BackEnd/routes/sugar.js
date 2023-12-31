const express = require("express");
const router = express.Router();
const { Isauth } = require("../Middlewares/auth");

const {
    AddSugar,
} = require("../controllers/suger");

router.post("/post-sugar", AddSugar);

module.exports = router;