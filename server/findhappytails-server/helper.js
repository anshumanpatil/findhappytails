const getFunction = (req, res, next) => {
    return res.status(200).json({
        message: req.body,
    });
}
const getPathFunction = (req, res, next) => {
    return res.status(200).json({
        message: "Hello from path!",
    });
}
const loginFunction = (req, res, next) => {
    console.log("loginFunction", req.body)
    return res.status(200).json({
        message: "Hello from path!",
    });
}
module.exports = { getFunction, getPathFunction, loginFunction }