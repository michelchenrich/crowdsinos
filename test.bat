gem list --no-versions | sed -e '/^(*|$)/d' > installed_gems

sudo gem uninstall --a --ignore-dependencies .+

cat installed_gems | xargs sudo gem install

rm installed_gems

System("PAUSE")