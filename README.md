![arch](https://github.com/metacoma/9p-grid-http/blob/master/arch.png?raw=true)


# Run inferno.sh on osx/linux hosts
```
inferno.sh - starts inferno-os inside docker container
```

# modify and run webfs_mount.sh
```
# 
% rc webfs_mount.sh
% ns | grep /tmp/remote
mount  '#s/tcp!observer.infra.domain.ltd!42420' /tmp/remote/tcp!observer.infra.domain.ltd!42420 
mount  '#s/tcp!pusher.domain.ltd!42420' /tmp/remote/tcp!pusher.domain.ltd!42420 
mount  '#s/tcp!192.168.1.142!42420' /tmp/remote/tcp!192.168.1.142!42420 
mount  '#s/tcp!dev1.domain.ltd!42420' /tmp/remote/tcp!dev1.domain.ltd!42420 
mount  '#s/tcp!dev2.domain.ltd!42420' /tmp/remote/tcp!dev2.domain.ltd!42420 
mount  '#s/tcp!dev3.domain.ltd!42420' /tmp/remote/tcp!dev3.domain.ltd!42420 
mount  '#s/tcp!dev4.domain.ltd!42420' /tmp/remote/tcp!dev4.domain.ltd!42420 
mount  '#s/tcp!dev5.domain.ltd!42420' /tmp/remote/tcp!dev5.domain.ltd!42420 
mount  '#|/data' /tmp/webfs/tcp!192.168.1.142!42420 
mount  '#|/data' /tmp/webfs/tcp!dev1.domain.ltd!42420 
mount  '#|/data' /tmp/webfs/tcp!dev2.domain.ltd!42420 
mount  '#|/data' /tmp/webfs/tcp!dev3.domain.ltd!42420 
mount  '#|/data' /tmp/webfs/tcp!dev4.domain.ltd!42420 
mount  '#|/data' /tmp/webfs/tcp!dev5.domain.ltd!42420 
mount  '#|/data' /tmp/webfs/tcp!observer.infra.domain.ltd!42420 
mount  '#|/data' /tmp/webfs/tcp!pusher.domain.ltd!42420 
```


# how it works:
```
% for (n in `{seq 1 10}) { echo http://ipinfo.io/ip } | xargs -n1 -p10 rc download.sh
96.xx.86.170
96.yy.87.2
96.zz.88.47
97.aa.124.126
97.bb.174.222
97.cc.111.244
98.dd.194.171
98.ee.141.125
98.ff.142.6
99.gg.78.207
```
