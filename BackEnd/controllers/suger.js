const request = require("request");

const Sugar = require("../models/Sugar");
exports.AddSugar = async (req, res) => {
    const { Email, BloodSugar,desc, time } = req.body;

    const sugar = await Sugar({
        Email,
        BloodSugar,
        desc,
        time : Date.now(),
    })
    try {
        await sugar.save();
        res.json({ success: true, sugar });
    }
    catch (error) {
        console.log(error);
    }

};
    