const serverless = require("serverless-http");
const express = require("express");
const app = express();
const bodyParser = require('body-parser');
const helperFunctions = require('./helper');

app.post("/login", (req, res, next) => helperFunctions.loginFunction(req, res, next));
// app.get("/path", helperFunctions.getPathFunction);

app.use((req, res, next) => {
  return res.status(404).json({
    error: "Not Found",
  });
});

module.exports.handler = serverless(app);
