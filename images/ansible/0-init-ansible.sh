echo "#########12-six#####"
cd /home/k8s/cloudlink-meeting-deploy/images/ansible
pwd
tar zxvf six-1.11.0.tar.gz
cd six-1.11.0
python setup.py install

echo "#########13-cffi#####"
cd /home/k8s/cloudlink-meeting-deploy/images/ansible
pwd
tar zxvf cffi-1.11.5.tar.gz
cd cffi-1.11.5
python setup.py install

echo "#########14-cryptography#####"
cd /home/k8s/cloudlink-meeting-deploy/images/ansible
pwd
tar zxvf cryptography-2.2.2.tar.gz
cd cryptography-2.2.2
python setup.py install

echo "#########15-pyOpenSSL#####"
cd /home/k8s/cloudlink-meeting-deploy/images/ansible
pwd
tar zxvf pyOpenSSL-18.0.0.tar.gz
cd pyOpenSSL-18.0.0
python setup.py install

echo "#########16-pycparser#####"
cd /home/k8s/cloudlink-meeting-deploy/images/ansible
pwd
tar zxvf pycparser-2.18.tar.gz
cd pycparser-2.18
python setup.py install

echo "#########17-paramiko#####"
cd /home/k8s/cloudlink-meeting-deploy/images/ansible
pwd
tar zxvf paramiko-2.4.1.tar.gz
cd paramiko-2.4.1
python setup.py install

echo "#########18-passlib#####"
cd /home/k8s/cloudlink-meeting-deploy/images/ansible
pwd
tar zxvf passlib-1.7.1.tar.gz
cd passlib-1.7.1
python setup.py install

echo "#########19-ansible#####"
cd /home/k8s/cloudlink-meeting-deploy/images/ansible
pwd
tar zxvf ansible-2.5.4.tar.gz
cd ansible-2.5.4
python setup.py install
