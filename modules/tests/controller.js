const { getTestsModel } = require("./model.js");

const getTests = async (req, res, next) => {
    try {
        const resp = await getTestsModel(req.query)

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
    getTests
}