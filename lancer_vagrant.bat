vagrant box add trusty32 http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-i386-vagrant-disk1.box
vagrant init trusty32
vagrant up --provider=virtualbox --provision
vagrant ssh
pause