const jwt = require("../../utils/jwt.js");
const { postResultsModel, getResultsModel } = require("./model.js");



const getResults = async (req, res, next) => {
    try {
        const user_id  = jwt.verify(req.headers.token)
        const response = await getResultsModel(user_id)

        if (response.error) return next(response)

        res.status(200).send({
            status: 200,
            data: response
        })
    } catch (error) {
        console.log(error);
    }
}




const postResults = async (req, res, next) => {
    try {
        const user_id = jwt.verify(req.headers.token)
        const response = await postResultsModel(req.body, user_id)

        if (response.error || !response.length) return next(response)

        res.status(201).send({
            status: 201,
            data: response
        })
    } catch (error) {
        console.log(error);
    }
}


module.exports = {
    getResults,
    postResults
}