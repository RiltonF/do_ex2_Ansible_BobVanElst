#!/usr/bin/env bash
# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL

# vagrant environment nodes
10.0.15.11  lb
10.0.15.21  web1
10.0.15.22  web2
10.0.15.23  web3
10.0.15.24  web4
10.0.15.25  web5
10.0.15.26  web6
10.0.15.27  web7
10.0.15.28  web8
10.0.15.29  web9
EOL


ssh-keyscan lb >> ~/.ssh/known_hosts
for i in {1..4}; do ssh-keyscan web$i >> ~/.ssh/known_hosts; done

