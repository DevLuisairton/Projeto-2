const express = require('express');
const sqlite3 = require('sqlite3').verbose();

const app = express();
const db = new sqlite3.Database('database.db');

app.get('/api/produtos', (req, res) => {
  db.all('SELECT * FROM produtos', (err, rows) => {
    res.json(rows);
  });
});

app.listen(3000, () => {
  console.log('Servidor iniciado na porta 3000');
});

const sqlite3 = require('sqlite3').verbose();

const db = new sqlite3.Database('database.db', (err) => {
    if (err) {
        console.error(err.message);
    }
    console.log('Conectado ao banco de dados.');
});