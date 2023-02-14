const { fetchAll } = require('../../utils/db.js')
const { GETFIRST, GETSECOND } = require('./query.js')

const getFirstSubjectModel = async () => {
    try {
        return await fetchAll(GETFIRST)
    } catch (error) {
        console.log(error);
    }
}

const getSecondSubjectModel = async ({ first_subject_id }) => {
    try {
        return await fetchAll(GETSECOND, first_subject_id)
    } catch (error) {
        console.log(error);
    }
}

module.exports = {
    getFirstSubjectModel,
    getSecondSubjectModel
}