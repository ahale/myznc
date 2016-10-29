#!/bin/bash

yum install -y https://repo.saltstack.com/yum/amazon/salt-amzn-repo-latest-1.ami.noarch.rpm
yum clean -y expire-cache
yum update -y
yum upgrade -y
yum install -y salt-minion

echo "file_client: local" > /etc/salt/minion

chkconfig salt-minion off
service salt-minion stop

salt-call state.highstate

