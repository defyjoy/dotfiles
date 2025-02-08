# PIHOLE

This setup is used to run pi-hole in docker. However this setup is only on native docker ( like ubuntu). Wont work on macos.

## STOP SYSTEMD RESOLVE

sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved

## FIND THE HOSTNAME IP

```bash
hostname -I 
```

## EDIT `resolv.conf`

```bash
sudo nano /etc/resolv.conf`
```

Edit and set nameserver you received in the step above.

```bash
nameserver 192.168.68.66

search .
```


find the wifi ip ( should be static) and fine the ip and update `Server_IP` variable in docker.

## RUN PIHOLE

```bash
chmod +x pihole.sh
sh ./pihole.sh
```

## LOGIN TO PIHOLE

- Go to browser
- type `localhost/admin`. Pihole should show up . 