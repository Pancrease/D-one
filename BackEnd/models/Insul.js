const mongoose = require("mongoose");

const InsulSchema = new mongoose.Schema({
  Email: {
    type: String,
    required: false,
    unique: false,
  },
  InsulSug: {
    type: Number,
    required: true,
  },
  time: {
    type: Date,
    required: true,
  },
});

module.exports = mongoose.model("Insul", InsulSchema);
