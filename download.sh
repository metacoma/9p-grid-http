url = $1
output_file = '/tmp/inferno/host/result/'`{ echo $url | awk -F/ '{print $NF}' }
remote_dir = /tmp/webfs
n=`{ echo 'rand('^`{ ls $remote_dir | wc -l }^')' | pc -n }
remote=`{ ls $remote_dir | awk -v 'n='$n '(NR - 1 == n) {print $0}' }
bind $remote /mnt/web
hget $url 
