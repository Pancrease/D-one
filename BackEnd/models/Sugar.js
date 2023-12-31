const mongoose = require('mongoose');

const SugarSchema = new mongoose.Schema({
    Email: {
        type: String,
        required: false,
        unique: false,
    },
    BloodSugar: {
        type: Number,
        required: true,
    },
    desc: {
        type: String,
        required: false,
    },
    time:{
        type: Date,
        required: true,
    }
});

module.exports = mongoose.model("Sugar", SugarSchema);