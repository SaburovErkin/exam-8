const express = require('express')
const { getFirstSubject, getSecondSubject } = require('./controller.js')

const router = express.Router()

router.get('/subject', getFirstSubject)
router.get('/secondsubject/:first_subject_id', getSecondSubject)

module.exports = router