#简介  
1、用于自动化部署k8s集群。
2、自动化部署业务服务
3、实现在deploy机器git clone脚本，执行ansible可以自动部署k8s环境，部署业务服务。
---UAT Environment---(ansible_deploy_20190111)
| k8s01  | 52.163.243.35  | 52.163.243.35    |
| k8s02  | 13.76.197.1  | 10.0.1.26    | 
| k8s03  | 13.67.61.54  | 10.0.1.27    | 
| k8s04  | 13.76.212.4  | 10.0.1.28    | 

#部署步骤 
1、部署准备
修改ips-file服务器,执行init-ssh-key (生成互信)
部署ansible（---待补充---），并修改environment的服务器和变量
搭建docker-registry,将镜像上传

2、k8s环境部署：(非root用户  --ask-sudo-pass)
ansible-playbook -i environments/sit/inventory checkenv.yml (将images上传到仓库)
ansible-playbook -i environments/sit/inventory  k8s.yml (ca、etcd)
ansible-playbook -i environments/sit/inventory common.yml (flannel、docker)
ansible-playbook -i environments/sit/inventory k8s.yml (master、node)
3、部署paas和saas服务
ansible-playbook -i environments/sit/inventory xxxpaas.yml(dns、nginx、ingress、dashborad)
ansible-playbook -i environments/sit/inventory xxxsaas.yml(demo)

#20190111 z00256434
1、配置k8s集群，及关联server
2、自动安装ansible、docker、ipvsadm
3、下载和配置依赖的tar包和镜像
4、编写通用server部署脚本，并调试通过
执行ansibale 命令
ansible-playbook -i environments/sit/inventory xxx.yml

#20190114 z00256434
1、建立互信脚本 ./init-ssh-key ips-file
2、初始化文件夾
ansible-playbook -i environments/sit/inventory checkenv.yml
/data01
/etc/systemd/system/docker.service.d
/opt/local/cfssl
/etc/kubernetes
/etc/kubernetes/ssl等

#20190116 ansible2.5.4安装
手工安装（待脚本化），验证：
ansible  --version
ansible  --version all -m command -a 'uptime'  
ansible  ansible_sh_host -m ping

#20190117 etcd的安装
安裝etcd:
（role/etcd）
ansible-playbook -i environments/sit/inventory k8s.yml

#20190118 ipvs、docker、flannel的安裝
ansible-playbook -i environments/sit/inventory common.yml
备注：docker依赖flannel; flannel依赖etcd(etcd比较独立，可以先部署)

#20190117 k8s证书
生成证书
（role/ca）
ansible-playbook -i environments/sit/inventory k8s.yml

#20190125 k8s master安装
配置 kube-apiserver，生成 token
（role/master）
head -c 16 /dev/urandom | od -An -t x | tr -d ' '
ansible-playbook -i environments/sit/inventory k8s.yml

#20190129 k8s node安装
kubelet 配置config,需要更新token
（role/node）
ansible-playbook -i environments/sit/inventory k8s.yml

#20190131 配置 kube-proxy
（role/node）
ansible-playbook -i environments/sit/inventory k8s.yml

#20190212 配置 nginx
ansible-playbook -i environments/sit/inventory nginx.yml

#20190213 配置 docker registry
1、100.84.234.102 指定机器，和k8s集群解耦（没有调通，暂停77）
2、(重要)在checkenv增加上传images到registry,在master中启动。
ansible-playbook -i environments/sit/inventory checkenv.yml
3、完成coredns的安装
ansible-playbook -i environments/sit/inventory kube-coredns.yml

#20190214 配置 paas
ansible-playbook -i environments/sit/inventory kube-dashboard.yml

#20190301 配置 nginx-ingress
ansible-playbook -i environments/sit/inventory kube-ingress.yml
{{inventory_hostname}} --获取机器名

