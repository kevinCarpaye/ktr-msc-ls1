const express = require('express');
const apiRouter = require('./apiRouter').router;
const bodyParser = require('body-parser');
const cors = require('cors');

const port = 3000 || env

let server = express();

server.use(cors());

//server.set('view engine', 'ejs');

server.use(express.static('./public'));

server.use(bodyParser.urlencoded({extended: false}));
server.use(bodyParser.json());

server.use('/api/', apiRouter);

server.listen(port,  function() {
    console.log('Server en écoute sur le port ' + port)
})