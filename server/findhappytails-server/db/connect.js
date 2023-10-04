const mongoose = require('mongoose');

let conn = null;
const getProdURI = () => {
  const username = encodeURIComponent("appadmin");
  const password = encodeURIComponent("Yajju@1506");
  return `mongodb+srv://${username}:${password}@mobapp.i1ctwtf.mongodb.net/tails`;
}

const uri = process.env.NODE_ENV=='lambda' ? getProdURI() : `mongodb://localhost:27017/tails`;

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
