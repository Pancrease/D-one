const request = require("request");

const Insul = require("../models/Insul");
exports.AddInsul = async (req, res) => {
  const { InsulSug } = req.body;

  const insul = await Insul({
    Email: "hatim.allouch@e-polytechnique.ma",
    InsulSug,
    time: Date.now(),
  });
  try {
    await insul.save();
    res.json({ success: true, insul });
  } catch (error) {
    console.log(error);
  }
};
