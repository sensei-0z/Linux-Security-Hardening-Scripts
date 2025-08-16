# Changing SSH Port on Linux

This guide explains how to change the default SSH port (22) to a custom port for improved security.

---

# Edit SSH config

``` 
sudo nano /etc/ssh/sshd_config
```

# Look for line:

```
# Port 22
```

# Change Port number

Uncomment and change it to your desired port (X).
Recommended range: 1024-65535

``` 
Port X 
```
> ⚠️ Note: Avoid ports already in use by other services. You can check with:

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

**Step 1**: Test default port 22 (it should fail):
``` 
ssh user@host/ip
```

**Step 2**: Test the new port:

``` 
ssh -p X user@host/ip
```
> ✅ If you can log in with the new port, the configuration is successful.


