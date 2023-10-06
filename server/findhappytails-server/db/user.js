const mongoose = require('mongoose');

var userSchema = new mongoose.Schema({
    userid: {
        type: String,
        unique: true
    },
    email: String,
    password: String,
    name: String,
    mobile: String,
    status: {
        type: String,
        enum : ['Active', 'Inactive'],
        default: 'Active'
    },
    created_at: Date,
    updated_at: Date
}, { versionKey: false });

userSchema.pre("save", async function (next) {
    const user = this;
    user.userid = user._id;
    next();
});

userSchema.statics.findOneOrCreate = function (condition, doc, callback) {
    const self = this;
    self.findOne(condition, '-_id', (err, result) => {
        return result
            ? callback(err, { created: false, ...result.toObject() })
            : self.create(doc, (err, result) => {
                return callback(err, { created: true, ...result.toObject() });
            });
    });
};

const User = mongoose.model("User", userSchema);

module.exports = User;