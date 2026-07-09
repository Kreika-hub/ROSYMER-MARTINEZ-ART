# check if git config is set globally, set locally if not
$email = git config --global user.email
if (-not $email) {
    git config --local user.email "rosymer.martinez.art@example.com"
    git config --local user.name "Rosymer Martinez"
}

# Commit
git commit -m "Initial commit"

# Set remote and push
git remote add origin https://github.com/Kreika-hub/ROSYMER-MARTINEZ-ART.git
git branch -M main
git push -u origin main
