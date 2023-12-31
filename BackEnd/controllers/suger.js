const request = require("request");

const Sugar = require("../models/Sugar");
exports.AddSugar = async (req, res) => {
  const { BloodSugar, desc } = req.body;

  const sugar = await Sugar({
    Email: "hatim.allouch@e-polytechnique.ma",
    BloodSugar,
    desc,
    time: Date.now(),
  });
  try {
    await sugar.save();
    res.json({ success: true, sugar });
  } catch (error) {
    console.log(error);
  }
};
