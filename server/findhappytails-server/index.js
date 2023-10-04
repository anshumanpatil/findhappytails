const serverless = require("serverless-http");
const express = require("express");
const app = express();
const bodyParser = require('body-parser');
const helperFunctions = require('./helper');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(bodyParser.raw());




app.post("/login", (req, res, next) => helperFunctions.loginFunction(req, res, next));
app.post("/register", (req, res, next) => helperFunctions.registerFunction(req, res, next));

app.use((req, res, next) => {
  return res.status(404).json({
    error: "Not Found",
  });
});

module.exports.handler = serverless(app);
