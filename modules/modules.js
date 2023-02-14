const users = require("./users/router.js");
const subjects = require("./subjects/router.js");
const universities = require("./universities/router.js");
const faculties = require( "./faculties/router.js");
const tests = require("./tests/router.js");
const results = require("./results/router.js");

module.exports = [users, subjects, universities, faculties, tests, results, ];