const fs = require('fs');
const b64 = fs.readFileSync('Logo Rosy.png').toString('base64');
fs.writeFileSync('logo_b64.txt', b64);
console.log('Base64 guardado exitosamente.');
