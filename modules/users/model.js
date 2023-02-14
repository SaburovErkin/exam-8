const { fetchAll } = require('../../utils/db.js');
const { LOGIN, REGISTER } = require('./query.js')

const loginModel = async ({ phoneNumber, password }) => {
    try {
        return await fetchAll(LOGIN, phoneNumber, password)
    } catch (error) {
        console.log(error);
    }
}

const registerModel = async ({ fullName, userName, phoneNumber, gend }) => {
    try {
        return await fetchAll(REGISTER, fullName, userName, phoneNumber, gend)
    } catch (error) {
        console.log(error);
    }
}

module.exports = {
    loginModel,
    registerModel
}