const { getFirstSubjectModel, getSecondSubjectModel } = require("./model.js");

const getFirstSubject = async (req, res, next) => {
    try {
        const resp = await getFirstSubjectModel()

        if (resp.error) return next(resp)

        res.status(200).send({
            status: 200,
            data: resp
        })
    } catch (error) {
        console.log(error);
    }
}

const getSecondSubject = async (req, res, next) => {
    try {
        const resp = await getSecondSubjectModel(req.params)

        if (resp.error) return next(resp)

        res.status(200).send({
            status: 200,
            data: resp
        })
    } catch (error) {
        console.log(error);
    }
}

module.exports = {
    getFirstSubject,
    getSecondSubject
}