#!/bin/bash

# The number of most recent commits you want to initially display
initial_commits=10
# File to keep track of the last seen commit
last_seen_file="/tmp/git_scripts-git_log_tail-last_seen_commit"

# Remove previous run last seen commit (always start fresh)
if [ -f "$last_seen_file" ]; then
    rm "$last_seen_file"
fi

# Function to display commits and update the last seen commit
show_new_commits() {
    # Check if the last_seen_file exists and read the last seen commit
    if [ -f "$last_seen_file" ]; then
        last_seen_commit=$(cat "$last_seen_file")
    else
        last_seen_commit=""
    fi

    # Get the list of new commits since the last seen commit
    # If there is no last seen commit, show the most recent commits defined by initial_commits
    if [ -z "$last_seen_commit" ]; then
        new_commits=$(git lc | head -n "$initial_commits")
    else
        new_commits=$(git lc "$last_seen_commit"..HEAD)
    fi

    # Display the new commits if there are any
    if [ ! -z "$new_commits" ]; then
        echo "$new_commits"
        # Update the last seen commit
        echo $(git lc -n 1 --format="%H") > "$last_seen_file"
    fi
}

# Main loop to check for new commits every few seconds
while true; do
    show_new_commits
    sleep 3
done
