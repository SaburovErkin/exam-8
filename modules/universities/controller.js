const { getUniversitiesModel } = require("./model.js");

const getUniversities = async (req, res, next) => {
    try {
        const resp = await getUniversitiesModel(req.query)

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
    getUniversities
}