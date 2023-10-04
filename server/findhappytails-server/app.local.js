const express = require("express");
const app = express();
const helperFunctions = require('./helper');
const mongoURL = `mongodb://localhost:27017/trainer`;

app.post("/login", (req, res, next) => helperFunctions.loginFunction(req, res, next));

app.use((req, res, next) => {
  return res.status(404).json({
    error: "Not Found",
  });
});

const port = 3000
app.listen(port)
console.log(`listening on http://localhost:${port}`)
