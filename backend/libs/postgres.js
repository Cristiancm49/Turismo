const { Client } = require('pg');

async function getConnection() {
  const client = new Client({
    host: 'localhost',
    port: 5432,
    user: 'adm',
    password: '1518',
    database: 'caqtur'

  })

  await client.connect();
  return client;

}

module.exports = getConnection;
