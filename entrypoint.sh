#!/usr/bin/env bash

# Init var
goal_date="$(date +"%y0921")"
current_date="$(date +"%y%m%d")"
lyric="$(curl -s --get "https://makeitpersonal.co/lyrics" --data-urlencode "artist=Earth, Wind & Fire" --data-urlencode "title=September")"
readme_content="# IT'S 21<sup>st</sup> SEPTEMBER\n![](https://media4.giphy.com/media/xT9IgDMmNmJ6HvzyFi/giphy.gif)"
readme_file="$(ls | grep -i readme)"


# Git initialization
repo="https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
git config user.name "Github Action"
git config user.email "actions@user.noreply.github.com"

# Ensure repo is in sync
git pull $repo master

# Modify repo
# If 21st then change all file content with september lyric
# Else wait for september
if [[ $current_date -eq $goal_date ]]; then
  echo "$lyric" | tee **/*
  git_message="IT'S SEPTEMBER!!!"
else
  # Set goal_date to next year if current_date is greater than it
  [[ $current_date > $goal_date ]] && goal_date="$(date --date="1 year" +"%y0921")"

  # Count remaning days
  countdate="$(( ($(date "$goal_date" +%s) - $(date "$current_date" +%s)) / (3600 * 24) ))"
  readme_content="Just wait for "$countdate" more days"

  # Git message
  git_message=""$countdate" more days"
fi

# Change readme content
echo -e "$readme_content" > "$readme_file"

# Commit and push
git add -A
git commit -m "$git_message"
git push -u $repo master
