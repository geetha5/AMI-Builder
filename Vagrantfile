# -*- mode: ruby -*-
# vi: set ft=ruby :

### Error checking and Gem Requires ###
plugin_gems = []
plugin_gems.each do |plugin_gem|
  if !Vagrant.has_plugin?(plugin_gem)
    raise "Plugin gem #{plugin_gem} is not installed"
  else
    require plugin_gem
  end
end

### Error checking for Vagrant Plugins ###
plugins = ['vagrant-aws', 'vagrant-scp']
plugins.each do |plugin|
  if !Vagrant.has_plugin?(plugin)
    raise "Plugin #{plugin} is not installed"
  end
end

### other included gems ###
require 'json'

###############################################################
# Functions
###############################################################

##
# read_config(config_file)
# checks for the config file and returns the data hash
##
def read_config(config_file)

  if !File.file?(config_file)
    puts "ERROR: could not find config file"
    exit(1)
  end

  file_json = File.read(config_file)
  config_data =JSON.parse(file_json)

  return config_data
end

## TODO: Add config validation ##

###############################################################
# Initalization
###############################################################

# hash for config file contents
config_data = read_config('awsVagrantConfig.json')

# aws settings
aws_profile = config_data['aws']['profile']
aws_ami = config_data['aws']['ami']
aws_instance = config_data['aws']['instanceType']
aws_subnet = config_data['aws']['subnetId']
aws_keypair = config_data['aws']['keypair']
aws_region = config_data['aws']['region']
aws_sgs = config_data['aws']['securityGroup']
ssh_key_path = config_data['sshKeyPath']

###############################################################
# Vagrant Configuration
###############################################################

Vagrant.configure("2") do |config|
  config.vm.box = "dummy"

  config.vm.provider :aws do |aws, override|

    aws.ami = aws_ami
    aws.aws_profile = aws_profile
    aws.instance_type = aws_instance
    aws.subnet_id = aws_subnet
    aws.region = aws_region
    aws.security_groups = aws_sgs
    aws.keypair_name = aws_keypair
    aws.iam_instance_profile_name = "ami-test"
    aws.tags = {
        'Name' => 'ami-test'
    }
    aws.block_device_mapping = [{ 'DeviceName' => '/dev/xvda', 'Ebs.VolumeSize' => 30 }]

    override.ssh.username = "ec2-user"
    override.ssh.private_key_path = ssh_key_path
    override.nfs.functional = false
  end

  config.vm.synced_folder ".", "/vagrant", type: "rsync"

  config.vm.provision "bootstrap", type: "shell" do |s|
    s.inline = "chmod 755 /vagrant/scripts/install_ansible.sh && sudo /vagrant/scripts/install_ansible.sh"
  end

  config.vm.provision "placeAnsibleConfig", type: "shell" do |s|
    s.inline = "sudo cp /vagrant/ansible/ansible.cfg /etc/ansible/ansible.cfg"
  end

  config.vm.provision "placeCisMasterPlaybook", type: "shell" do |s|
    s.inline = "sudo cp /vagrant/ansible/cis_playbook.yml /etc/ansible/cis_playbook.yml"
  end

  config.vm.provision "placeCisRole", type: "shell" do |s|
    s.inline = "sudo cp -r /vagrant/ansible/roles/anthcourtney.cis-amazon-linux /etc/ansible/roles/anthcourtney.cis-amazon-linux"
  end

  config.vm.provision "placeCisFacts", type: "shell" do |s|
    s.inline = "sudo cp -r /vagrant/ansible/roles/anthcourtney.cis-amazon-linux/facts/* /etc/ansible/facts.d/ && sudo chmod 755 /etc/ansible/facts.d/*"
  end
end