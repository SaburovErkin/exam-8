const { fetchAll } = require('../../utils/db.js')
const { GET } = require('./query.js')

const getUniversitiesModel = async ({ first_subject, second_subject }) => {
    try {
        return await fetchAll(GET, first_subject, second_subject)
    } catch (error) {
        console.log(error);
    }
}
module.exports = {
    getUniversitiesModel
}