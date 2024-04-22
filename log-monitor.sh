#!/bin/bash

log_file="$1"
keywords=("error" "exception")  # Add more keywords as needed
declare -A keyword_counts

trap "echo 'Log monitoring stopped.'; exit 0" SIGINT

if [ -z "$log_file" ]; then
    echo "Usage: $0 <log_file>"
    exit 1
fi

if [ ! -f "$log_file" ]; then
    echo "Error: Log file '$log_file' not found."
    exit 1
fi

monitor_log() {
    echo "Monitoring log file: $log_file"
    tail -n0 -F "$log_file" | while read line; do
        analyze_log "$line"
    done
}

analyze_log() {
    local line=$1
    for keyword in "${keywords[@]}"; do
        if [[ "$line" =~ $keyword ]]; then
            ((keyword_counts[$keyword]++))
            echo "Keyword '$keyword' found: $line"
        fi
    done
}

generate_summary() {
    echo -e "\nSummary Report:"
    for keyword in "${!keyword_counts[@]}"; do
        echo "'$keyword': ${keyword_counts[$keyword]}"
    done
}

monitor_log
