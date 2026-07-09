const { spawnSync } = require('child_process');

function runGit(args) {
    const result = spawnSync('git', args, { encoding: 'utf-8' });
    if (result.error) {
        console.error('Error:', result.error);
    }
    if (result.stdout) console.log(result.stdout);
    if (result.stderr) console.error(result.stderr);
    return result.status;
}

console.log("Agregando archivos a Git...");
runGit(['add', '-A']);

console.log("\nCreando commit...");
runGit(['commit', '-m', 'Finalización PWA: Integración Supabase, Carrusel y Soporte Offline']);

console.log("\nSubiendo a GitHub...");
runGit(['push', 'origin', 'main']);

console.log("\nScript completado.");
