const express = require("express");
require("dotenv").config();
require("./models/db");

const userRouter = require("./routes/user");
const foodRouter = require("./routes/food");
const sugarRouter = require("./routes/sugar");
const insulRouter = require("./routes/insul");
const User = require("./models/user");
const app = express();

// app.use((req, res, next) => {
//   req.on("data", (chunk) => {
//     const data =JSON.parse(chunk);
//     req.body = data
//     next();
//   });
// });

app.use(express.json());
app.use(userRouter);
app.use(foodRouter);
app.use(sugarRouter);
app.use(insulRouter);

// const test = async (Email, Password) =>{
//   const user = await User.findOne({Email: Email});
//   const result = await user.ComparePassword(Password);
//   console.log(result);
// }
// test('aaaaallouchhatim@gmail.com', 'hallouch13qq7@');
// *******************************************
// testing done and noice

app.get("/test", (req, res) => {
  res.send("please");
});

app.get("/", (req, res) => {
  res.json({ success: true, message: "Back End Zone 🔥" });
});

app.listen(5002, () => {
  console.log("listening!!");
});
