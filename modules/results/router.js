const express = require('express')
const { getResults, postResults } = require('./controller.js')

const router = express.Router()

router.get('/results', getResults)
router.post('/result', postResults)

module.exports = router