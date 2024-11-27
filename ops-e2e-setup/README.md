## Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/SubhanshuMG/Rolling-updates.git
   cd Rolling-updates
   ```

2.	Set Up Monitoring: Start Prometheus and Grafan
    ```bash
    docker-compose up -d
    ```

	- Access Grafana at http://localhost:3000 (default user: admin, password: admin).

3.	Deploy Update Agent:
	- Place update_agent.sh on each node.
	- Make it executable:

    ```bash
    chmod +x scripts/update_agent.sh
    ```

4.	Automate Updates:
	- Schedule update_agent.sh to run periodically using cron or another task scheduler.
	- Run Update Script:
    ```bash
    ./scripts/update_agent.sh
    ```    
	- Monitor Metrics:
	- Access Prometheus: http://localhost:9090
	- Access Grafana: http://localhost:3000

5. Rollback: If an update fails then the update script automatically pulls the stable image and restarts the node.

6. Security:
    - Docker Content Trust: Verify image integrity using SHA256.
	- Access Control: Use SSH and firewalls to secure nodes.
---

### Deployment Instructions

1. Place the `rolling-update-system` directory on your control plane machine.
2. Deploy `scripts/update_agent.sh` to all nodes.
3. Launch the monitoring stack:
   ```bash
   docker-compose up -d
   ```

4.	Automate updates using cron jobs or task schedulers on each node.