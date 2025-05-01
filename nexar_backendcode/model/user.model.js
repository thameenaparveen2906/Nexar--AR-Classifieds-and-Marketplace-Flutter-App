const mongoose = require('mongoose');
const bcrypt = require("bcrypt");
const db = require('../config/db');

const{ Schema } = mongoose;

const userSchema = new Schema({
    username:{
        type: String,
        required: true,  
        unique: true,    
        minlength: 5,    
        maxlength: 30,   
        trim: true,      
        match: /^[a-zA-Z0-9_]+$/,

    },
    email:{
        type:String,
        lowercase:true,
        required:true,
        unique:true,
    },
    password:{
        type:String,
        required:true,
    }
});

userSchema.pre('save',async function () {
    try{
        var user = this;
        const salt = await(bcrypt.genSalt(10));
        const hashpass = await bcrypt.hash(user.password,salt);
        user.password = hashpass;
    }catch(error){
        throw error;
    }
    
});
userSchema.methods.comparePassword = async function(userPassword){
    try {
        const isMatch = await bcrypt.compare(userPassword,this.password);
        return isMatch;
    } catch (error) {
        throw error;
    }
};
const UserModel = db.model('user',userSchema);

module.exports = UserModel;