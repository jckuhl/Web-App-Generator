const shelljs = require('shelljs');

const args = process.argv.slice(2).reduce((accum, current)=> {
    return accum + current + ' ';
}, ' ').trim();

shelljs.chmod('755', './webapp.sh');

shelljs.exec(`./webapp.sh ${args}`);