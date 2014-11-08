mailvpn
=======

Bash Script to alter OS X's routing table so that my mailserver is addressed directly instead of through VPN.

What it does
------------
This little shell script adds/removes a static route to the routing table, so that a certain server (in my case my mail server) is addressed through my default network gateway as opposed to the VPN, which all other traffic is routed through. The script has been developed and tested in Mac OS X 10.9.5, but there is no real reason it should not work in other versions of OS X or even Linux/UNIX settings.

How to set it up
-----------------
* Put the script into /usr/local/bin and chmod it to 755, remove the ".sh" if you like.
* Add your (mail)server in line 34, so that it reads _MAILSERVER="mail.example.com"_.
* Run "mailvpn -a" to add or "mailvpn -d" to delete. It will ask you for your root password.

To Do
-----
For now this script takes only one domain in the MAILSERVER argument. I will generalize this to  take an entire list and add every route to the routing table in the future.