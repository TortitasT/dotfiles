#!/bin/bash

# Firefox
profiles=$(ls -d ~/.mozilla/firefox/*/)
echo "Firefox profiles:"
echo $profiles | tr ' ' '\n'
echo

echo "Enter the profile you want to install the homepage to:"
read profile

if [[ ! $profiles =~ $profile ]]; then
    echo "Invalid profile"
    exit 1
fi

echo "Installing homepage to $profile"
mkdir -p "$profile/homepage"
cp -r homepage/* "$profile/homepage"

echo "Please close Firefox"
read -p "Press enter to continue"

cp "$profile/prefs.js" "$profile/prefs.js.bck"

is_homepage_set=$(grep "browser.startup.homepage\", " "$profile/prefs.js")
if [[ $is_homepage_set ]]; then
    echo "Homepage already set"
    exit 1
fi

echo "user_pref(\"browser.startup.homepage\", \"file://$profile/homepage/index.html\");" >> "$profile/prefs.js"

echo "Profile installed!"

