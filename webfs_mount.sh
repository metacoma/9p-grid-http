remote_root=/tmp/remote
webfs_root=/tmp/webfs

ns | awk '($0 ~ "'$remote_root'") {print $NF}' | xargs -n1 -p5 unmount 

rm -rf $remote_root $webfs_root

mkdir $remote_root

# MODIFY remote_hosts
remote_hosts='tcp!observer.infra.domain.ltd!42420 tcp!pusher.domain.ltd!42420 tcp!192.168.1.142!42420 tcp!33.22.11.11!42420'
for (i in `{seq 1 5}) {
  remote_hosts=$remote_hosts^' '^'tcp!dev'$i'.domain.ltd!42420'
} 
# -----


for (i in `{ echo $remote_hosts | sed 's/ /\n/'}) {
  test -d /tmp/remote/$i || mkdir -p /tmp/remote/$i
  9fs $i /tmp/remote/$i
}

for (n in `{ls /tmp/remote/}) { 
  webfs_path=$webfs_root/`{ basename $n}; 
  test -d $webfs_path || mkdir -p $webfs_path; 
  bind $n/net /net && webfs -m $webfs_path 
}

# return network back
unmount /net
bind  /net /net
bind -a '#l' /net
bind -a '#I' /net
mount -a '#s/cs' /net
mount -a '#s/dns' /net



# check how it works
#for (i in `{seq 1 10}) { echo http://ipinfo.io/ip } | xargs -n1 -p8 rc download.sh
