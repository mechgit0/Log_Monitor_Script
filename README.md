# Log_Monitor_Script

This script monitors a specified log file for new entries, performs basic analysis on log entries, and generates a summary report of keyword occurrences.

## Usage

1. Make sure you have Bash installed on your system.
2. Clone the repository or copy the `log_monitor.sh` script to your local machine.
3. Run the script with the log file as an argument:

    ```bash
    ./log_monitor.sh /path/to/log/file.log
    ```

4. Replace `/path/to/log/file.log` with the actual path to your log file.

## Functionality

- **Log Monitoring:** The script continuously monitors the specified log file using `tail -F` to track new log entries in real-time.
- **Log Analysis:** It analyzes log entries for specific keywords (e.g., "error", "exception") and counts their occurrences.
- **Summary Report:** After stopping the monitoring loop (using Ctrl+C), the script generates a summary report displaying the counts of each keyword found in the log file.

## Additional Notes

- You can customize the list of keywords to monitor by modifying the `keywords` array in the script.
- Use Ctrl+C to stop the log monitoring process.

## Dependencies

- Bash
