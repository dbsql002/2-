const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const cors = require('cors');

const app = express();

app.use(cors());
app.use(bodyParser.json());

const pool = mysql.createPool({
    connectionLimit: 10,
    host: '3.36.95.202',
    port: '3306',
    user: 'root',
    password: 'password',
    database: 'YourDatabaseName'
});

app.post('http://43.203.120.23/signup', function (req, res) {
    const { username, email, password } = req.body;
    pool.query('INSERT INTO Users (username, email, password) VALUES (?, ?, ?)',
        [username, email, password], function (error, results, fields) {
            if (error) {
                console.error('Error in saving user:', error);
                res.status(500).send('Error in saving user');
            } else {
                console.log('User registered successfully:', results);
                res.send('User registered successfully');
            }
        });
});
app.use(express.static('public', {
  // 정적 파일 제공 경로를 설정할 때는 디렉토리 이름을 지정해줍니다.
  // 따라서 '/signup.html'이 들어있는 public/signup.html 경로가 정적 파일로 제공되는 것을 방지합니다.
  exclude: ['signup.html']
}));
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}.`);
});
