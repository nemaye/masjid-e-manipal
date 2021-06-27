const express = require("express");
const bodyParser = require("body-parser");
const mongoose = require("mongoose");
const app = express();
const router = require("./route/routes");
require("dotenv").config();



app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(router);

app.listen(8080, () => {
  console.log("server listening...");
});
