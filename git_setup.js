const { execSync } = require('child_process');

try {
  console.log("Setting git config...");
  try {
    execSync('git config --local user.email "rosymer.martinez.art@example.com"', { stdio: 'inherit' });
    execSync('git config --local user.name "Rosymer Martinez"', { stdio: 'inherit' });
  } catch (e) {
    console.log("Config warning (non-critical):", e.message);
  }

  console.log("Staging files...");
  execSync('git add .', { stdio: 'inherit' });

  console.log("Committing files...");
  execSync('git commit -m "Initial commit"', { stdio: 'inherit' });

  console.log("Adding remote origin...");
  execSync('git remote add origin https://github.com/Kreika-hub/ROSYMER-MARTINEZ-ART.git', { stdio: 'inherit' });

  console.log("Renaming branch...");
  execSync('git branch -M main', { stdio: 'inherit' });

  console.log("Pushing to remote...");
  execSync('git push -u origin main', { stdio: 'inherit' });

  console.log("Git setup completed successfully!");
} catch (error) {
  console.error("Execution failed:", error.message);
  process.exit(1);
}
