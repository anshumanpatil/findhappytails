const db = require('./db/connect');
const User = require('./db/user')

const loginFunction = async (req, res, next) => {
    await db.connect();
    const user = await User.find({ email: req.body.email, password: req.body.password });
    if (user.length) {
        return res.status(200).json({
            user
        });
    }
    return res.status(404).json({
        "error": "User not found"
    });
}

const registerFunction = async (req, res, next) => {
    await db.connect();
    const user = await User.create({ ...req.body });
    return res.status(200).json({
        user
    });
}
module.exports = { registerFunction, loginFunction }