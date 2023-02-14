const LOGIN = `
    SELECT * from users 
        where 
    phoneNumber = $1 and password = $2
`;

const REGISTER = `
    INSERT INTO users(fullName, userName, phoneNumber, password, gend) 
        values 
    ($1, $2, $3, $4, $5) returning *
`;


module.exports = { LOGIN, REGISTER }