const jwt = require('jsonwebtoken');
const JWT_SECRET = process.env.JWT_SECRET;
const accessTokenOptions = { expiresIn: "2 days" };

const generateJWTToken = async (accessTokenData) => {
    const payload = {
        userid: accessTokenData.userid,
    }
    const access_token = jwt.sign(payload, JWT_SECRET);
    return access_token;
}

module.exports = { generateJWTToken };