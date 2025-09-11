HealthCheck Toolkit

A Bash and Python automation project that runs weekly system health checks and generates a report. 
It collects CPU, memory, and system usage stats, checks for available updates, and outputs a summary report for easy monitoring.

Setup:
1. Clone the repository:
   git clone https://github.com/yourusername/healthcheck.git
   cd healthcheck
2. Make scripts executable:
   chmod +x *.sh
3. Install dependencies:
   sudo apt update && sudo apt install mpstat mailutils python3
4. Configure your .env file with:
   EMAIL='you@example.com'
   EMAIL_PASSWORD='yourpassword'
   SUBJECT='System Health Report'

Usage:
- Run manually:
   ./healthcheck.sh
- Schedule with cron:
   */5 * * * * /path/to/healthcheck.sh >> /path/to/healthcheck.log 2>&1
- View logs:
   cat healthcheck.logs

License: MIT
