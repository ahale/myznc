#!/bin/bash

yum install -y https://repo.saltstack.com/yum/amazon/salt-amzn-repo-latest-1.ami.noarch.rpm
yum clean -y expire-cache
yum update -y
yum upgrade -y
yum install -y salt-minion python26-pip.noarch
pip-2.6 install 'GitPython<2.0.9'
pip-2.6 install argparse

echo "
file_client: local
fileserver_backend:
    - git

gitfs_remotes:
    - https://github.com/ahale/myznc.git:
        - name: myznc_salt_states
        - root: salt/states
    - https://github.com/ahale/myznc.git:
        - name: myznc_salt_files
        - root: salt/files

" > /etc/salt/minion

chkconfig salt-minion off
service salt-minion stop

salt-call --local -l debug  state.highstate
