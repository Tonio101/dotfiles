```bash
sudo mv groot.txt /etc/groot.txt
sudo visudo
```

Add to the defaults section:
```bash
Defaults        lecture=always
Defaults        lecture_file=/etc/groot.txt
```
