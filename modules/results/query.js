const GET = `
    SELECT r.*,
        (SELECT university_name from universities where university_id = (select university_id from faculties where faculty_id = r.faculty_id)),
        (SELECT faculty_name from faculties where faculty_id = r.faculty_id),
        (SELECT case
            when passing_score_grant >= r.score_ball then 'Davlat granti' 
                else 'Shartnoma asosida'  
            end
        from faculties where faculty_id = r.faculty_id )
    from results as r where r.user_id = $1
    `;

const POST = `
    INSERT INTO results(first_subject, second_subject, score_ball, time, user_id, faculty_id, first_tests_count, second_tests_count, first_subject_id,second_subject_id) values
        ($1, $2, (3.1 * $1::int + 2.1 * $2::int), $3, $4, 
    (
    SELECT faculty_id from faculties 
        where array[faculty_id::text] <@ $5 and (3.1 * $1::int + 2.1 * $2::int) >= passing_score_contract
    order by array_position($5, faculty_id::text) limit 1
    ), $6, $7, $8, $9) 
    returning *
    `;


module.exports = { POST, GET }