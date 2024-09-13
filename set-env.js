const fs = require('fs');
const path = require('path');

const environmentPath = path.join(__dirname, 'src/environments/environment.prod.ts');

const apiUrl = process.env.API_URL

console.log(`Environment variable API_URL set to ${apiUrl}`);

let fileContent = fs.readFileSync(environmentPath, 'utf8');

fileContent = fileContent.replace(/apiUrl: '.*'/, `apiUrl: '${apiUrl}'`);

fs.writeFileSync(environmentPath, fileContent, 'utf8');
