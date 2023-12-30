const express = require("express");
const router = express.Router();
const { Isauth } = require("../Middlewares/auth");

const {
  Addfood,
} = require("../controllers/food");

router.post("/post-food",  Addfood);

module.exports = router;
