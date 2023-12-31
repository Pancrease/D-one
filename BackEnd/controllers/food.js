const request = require("request");

const Food = require("../models/Food");
exports.Addfood = async (req, res) => {
  const { food } = req.body;

  const options = {
    method: "POST",
    url: "https://trackapi.nutritionix.com/v2/natural/nutrients",
    headers: {
      "Content-Type": "application/json",
      "x-app-id": "959cfeaa",
      "x-app-key": "dab04b128e9cbbe61b57e99317f78387",
    },
    body: JSON.stringify({
      query: food,
    }),
  };

  request(options, async function (error, response, body) {
    if (error) {
      console.error(error);
      return;
    }
    // const nutrient205 = body.foods.full_nutrients.find(
    //   (nutrient) => nutrient.attr_id === 205
    // );
    // const valueOfAttr205 = nutrient205 ? nutrient205.value : null;
    const f = JSON.parse(body).foods[0].full_nutrients.find(
      (nutrient) => nutrient.attr_id === 205
    );
    const isNewFood = await Food({
     Email: "hatim.allouch@e-polytechnique.ma",
     Food: food,
     Carbs: f.value, 
     time: Date.now(),
    })
    if (response.statusCode === 200) {
      res.json({
        success: true,
        message: "Added",
        data: f.value,
      });
      await isNewFood.save();
    } else {
      console.error("Error:", body);
    }
  });
};
