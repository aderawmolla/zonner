const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();

app.use(bodyParser.json({ limit: '200mb' }));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.json({ limit: '200mb' }));
app.use(cors());

app.get('/zoner', (req, res) => {
  res.send("executed correctly");
});

const port = process.env.EXPRESS_PORT || 3000;
app.listen(port, () => {
  console.log('on the moddddon');
});