#!/bin/bash

# Function to get the line count of a man page
get_line_count() {
  man "$1" | wc -l
}

# Array of commands
commands=("man" "ls" "find")

# Declare an associative array to store line counts
declare -A line_counts

# Calculate line counts for each command
for cmd in "${commands[@]}"; do
  line_counts["$cmd"]=$(get_line_count "$cmd")
done

# Sort commands by line count in descending order
sorted_commands=($(
  for cmd in "${commands[@]}"; do
    echo "$cmd ${line_counts[$cmd]}"
  done | sort -k2,2nr -k1,1
))

# Print the sorted commands
for sorted_cmd in "${sorted_commands[@]}"; do
  echo "$sorted_cmd"
done
