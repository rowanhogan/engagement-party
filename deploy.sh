who=$(whoami)

if [[ -z $(git status --porcelain) ]];
then
    echo "I will build this awesome site for you, $who!"
else
    echo "OH MY GOD! PLEASE COMMIT YOUR CHANGES FIRST, $who!"
    say 'OH MY GOD! PLEASE COMMIT YOUR CHANGES FIRST, '$who'!'
    git status
    exit 1
fi

rm -rf /tmp/build;

bundle exec middleman build;

mv build /tmp/;

branches=$(git branch | sed 's/\(\*| \)//g')
if ! [[ $branches =~ gh-pages ]]; then
  git checkout -t origin/gh-pages;
else
  git checkout gh-pages;
fi

git pull origin gh-pages;

git rm -rf .;
rm -rf .sass-cache/
cp -r /tmp/build/* .;

git add .;
git commit -m "Deploy to github pages.";

rm -rf /tmp/build;

git push origin gh-pages;
git checkout master;

echo "Site Updated!"

