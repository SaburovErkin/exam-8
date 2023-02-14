const { fetchAll } = require('../../utils/db.js')
const { GET, POST } = require('./query.js')


const getResultsModel = async (user_id) => {
    try {
        return await fetchAll(GET, user_id)
    } catch (error) {
        console.log(error);
    }
}


const postResultsModel = async ({ first_subject, second_subject, first_tests_count, second_tests_count, faculties, time, first_subject_id, second_subject_id }, user_id) => {
    try {
        return await fetchAll(POST, first_subject, second_subject, time, user_id, faculties, first_tests_count, second_tests_count, first_subject_id, second_subject_id)
    } catch (error) {
        console.log(error);
    }
}

module.exports = {
    postResultsModel,
    getResultsModel
}