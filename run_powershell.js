const { execFile } = require('child_process');
execFile('powershell.exe', ['-ExecutionPolicy', 'Bypass', '-File', 'C:\\Users\\HP\\Desktop\\ROSY WORD\\generate_icons.ps1'], (error, stdout, stderr) => {
  if (error) {
    console.error('Error al ejecutar script:', error);
    process.exit(1);
  }
  console.log(stdout);
  if (stderr) console.error(stderr);
});
