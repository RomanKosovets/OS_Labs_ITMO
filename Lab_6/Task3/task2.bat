net stop Dnscache
TIMEOUT /t 5
sc queryex type=service state=all | find "SERVICE_NAME" > services2.txt
net start Dnscache
Pause