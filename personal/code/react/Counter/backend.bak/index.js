const express = require('express');
const cors = require('cors');
const app = express();
app.use(cors);

let count = 0;

app.get('/', (req, res) => {
	count += 1;
	res.send(count.toString());
})

app.listen(8080, () => console.log('listening on port 8080'));
