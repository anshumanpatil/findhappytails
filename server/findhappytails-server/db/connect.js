const mongoose = require('mongoose');

let conn = null;
const getProdURI = () => {
  const username = encodeURIComponent(process.env.DB_USERNAME);
  const password = encodeURIComponent(process.env.DB_PASSWORD);
  return `mongodb+srv://${username}:${password}@${process.env.DB_URL}/${process.env.DB_TABLE}`;
}

const uri = process.env.NODE_ENV=='lambda' ? getProdURI() : `mongodb://localhost:27017/tails`;
console.log("uri", uri);
exports.connect = async function() {
  if (conn == null) {
    conn = mongoose.connect(uri, {
      serverSelectionTimeoutMS: 5000
    }).then(() => mongoose);

    // `await`ing connection after assigning to the `conn` variable
    // to avoid multiple function calls creating new connections
    await conn;
  }

  return conn;
};
