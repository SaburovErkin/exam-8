const GETFIRST = `
    SELECT s.* from faculties as f 
        left join subjects as s on s.subject_id = f.first_subject 
    GROUP BY s.subject_id
`;

const GETSECOND = `
    SELECT s.* from faculties as f
        left join subjects as s on s.subject_id = f.second_subject where f.first_subject = $1 
    GROUP BY s.subject_id 
`



module.exports = { GETFIRST, GETSECOND }