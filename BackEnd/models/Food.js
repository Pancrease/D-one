const mongoose = require("mongoose");


const FoodSchema = new mongoose.Schema({
  Email: {
    type: String,
    required: false,
    unique: false,
  },
  Food: {
    type: String,
    required: true,
  },
  Carbs: {
    type: Number,
    required: true,
  },
  time:{
    type: Date,
    required: true,
  }
});

module.exports = mongoose.model("Food", FoodSchema);
