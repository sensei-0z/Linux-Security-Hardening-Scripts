# Edit SSh config

``` 
sudo nano /etc/ssh/sshd_config
```

# Look for line:

```
# Port 22
```

# Change it to:

Uncomment and change it to your desired port (X).
Recommended range: 1024-65535

``` 
Port X 
```
⚠️ Note: Avoid ports already in use by other services. You can check with:

```
sudo ss -tulnp | grep X
```

# Update your firewall rule

```
sudo ufw allow X/tcp
sudo ufw delete allow 22/tcp
```

# Restart SSH service

``` 
sudo systemctl restart ssh
```

# For test, log in from another device

First try:
``` 
ssh user@host/ip
```
It should not accept default port 22

Then try this:

``` 
ssh -p X user@host/ip
```


