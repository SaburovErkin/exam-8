const { fetchAll } = require('../../utils/db.js');
const { GET } = require('./query.js')

const getFaculties = async ({ faculty_id }) => {
    try {
        return await fetchAll(GET, faculty_id)
    } catch (error) {
        console.log(error);
    }
}
module.exports = {
    getFaculties
}