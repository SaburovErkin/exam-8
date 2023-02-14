const { GET } = require("./model");

const getFaculties = async (req, res, next) => {
    try {
        const resp = await GET(req.params)

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
    getFaculties
}