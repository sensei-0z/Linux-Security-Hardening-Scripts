# Edit SSh config

``` 
sudo nano /etc/ssh/sshd_config
```

# Look for line:

```
# Port 22
```

# Change it to:

``` 
Port X # Any unused port, generally between 1024 and 65535
```

# Update your firewall rule:

```
sudo ufw allow X/tcp
sudo ufw delete allow 22/tcp
```

# Restart SSH service

``` 
sudo systemctl restart ssh
```

# For test, long in from another device

First try:
``` 
ssh user@host/ip
```
It should not accept default port 22

Then try this:

``` 
ssh -p X user@host/ip
```


