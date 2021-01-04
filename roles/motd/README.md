motd
====

This role will create a motd banner when logging into your server.

Example
-------

```
---

- host: all
  roles:
    - motd
```

This playbook produces the `/etc/motd' file looking like this:

```
[root@localhost ~]# cat /etc/motd
     _              _ _     _
    / \   _ __  ___(_) |__ | | ___
   / _ \ | '_ \/ __| | '_ \| |/ _ \
  / ___ \| | | \__ \ | |_) | |  __/
 /_/   \_\_| |_|___/_|_.__/|_|\___|

 FQDN:    localhost.localdomain - WebServer
 Distro:  CentOS 7.7 Final
 Last Change: 2019-12-18, 16:41:04
 CPUs:    1
 RAM:     0.49GB

```


Role variables
--------------
- `motd_modification`: should the motd be modified defaults `true`
- `motd_server_role`: What role the server plays e.g. `WebServer`
- `motd_ascii_art`: ASCII art shown at the beginning of the motd.
- `motd_info`: List of additional information to show under the ASCII art. Look
into the `defaults` for an example.


License
-------

MIT


Author
------

Steven Marks
