#! /bin/sh

for dir in $(dirname $0)/*; do
    [ -d "$dir" ] || continue
    dir="${dir##*/}"
    useradd -m "$dir"
    usermod -G sudo "$dir"
    mkdir -p /home/$dir/.ssh
    cat ./$dir/*.pub > /home/$dir/.ssh/authorized_keys
    chown -R $dir:$dir /home/$dir/.ssh
    chmod 755 /home/$dir/.ssh
    chmod 644 /home/$dir/.ssh/authorized_keys
done
