# FTP Server Manager

Manage multiple Python FTP servers using [`pyftpdlib`](https://github.com/giampaolo/pyftpdlib) with a simple bash script.  
Supports **start/stop/restart servers**, **add new servers dynamically**, and **auto-creates directories**.

---

## Features

- Start all servers: `ftpS`
- Stop all servers: `ftpX`
- Restart all servers: `ftpR`
- Add and start a new server: `ftpA PORT:/path/to/dir`
- Each server logs to its home directory (`ftp.log`)
- Timestamped, colored output for clarity
- Auto-create directories for new servers
- Config-driven via `ftp-servers.conf`

---

## Installation

### **Option 1: One-command install (recommended)**

Run the following command to install the latest version directly from GitHub:

```bash
curl -fsSL https://raw.githubusercontent.com/oliwebd/ftp-manager/main/install.sh | sudo bash
````

This will:

1. Download `ftp-servers` and `ftp-servers.conf` to `/usr/local/bin/`
2. Make the script executable
3. Create symlinks for quick commands:

   * `ftpS` → Start all servers
   * `ftpX` → Stop all servers
   * `ftpR` → Restart all servers
   * `ftpA` → Add & start new server

---

### **Option 2: Manual install**

1. Clone the repository:

```bash
git clone https://github.com/oliwebd/ftp-manager.git
cd ftp-manager
```

2. Copy files to `/usr/local/bin`:

```bash
sudo cp ftp-servers /usr/local/bin/
sudo cp ftp-servers.conf /usr/local/bin/
sudo chmod +x /usr/local/bin/ftp-servers
```

3. Create symlinks:

```bash
sudo ln -sf /usr/local/bin/ftp-servers /usr/local/bin/ftpS
sudo ln -sf /usr/local/bin/ftp-servers /usr/local/bin/ftpX
sudo ln -sf /usr/local/bin/ftp-servers /usr/local/bin/ftpR
sudo ln -sf /usr/local/bin/ftp-servers /usr/local/bin/ftpA
```

---

## Usage

### Start all servers

```bash
ftpS
```

### Stop all servers

```bash
ftpX
```

### Restart all servers

```bash
ftpR
```

### Add a new server

```bash
ftpA 2155:/root/newftp
```

* This will **add the server to `ftp-servers.conf`**, **auto-create the directory**, and start it immediately.
* Logs are written to `/root/newftp/ftp.log`.

---

## Configuration

The list of managed servers is stored in:

```
/usr/local/bin/ftp-servers.conf
```

Each line follows the format:

```
PORT:/absolute/path/to/directory
```

Example:

```
2177:/root/olimiah
2144:/root/bdtechx.com
2199:/root/arabiceg.com
2133:/root/r2sync
```

---

## Notes

* Requires **Python 3** and **pyftpdlib**:

```bash
pip3 install pyftpdlib
```

* Logs are stored in each server’s directory as `ftp.log`.
* Colored output shows status clearly:

  * **Green** = started
  * **Yellow** = already running / warnings
  * **Red** = stopped

---

## License

MIT License © [Oliwebd](https://github.com/oliwebd)
