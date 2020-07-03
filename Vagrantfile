# -*- mode: ruby -*-
# vi: set ft=ruby :

# VM configuration
CPU = 2
MEMORY = 8192
NETWORK_NAME = "default"
NETWORK_ADDRESS = "192.168.122.1/24"

GITLABCI_NAME="kubespray-runner"
GITLABCI_TAGS="kubespray,light,vagrant,molecule,c3.small.x86"
GITLABCI_URL="https://gitlab.com/"

Vagrant.configure("2") do |config|
  config.vm.box = "pasqualet/vagrantspray"
  config.vm.box_version = "0.0.1"

  config.vm.synced_folder "config/", "/etc/gitlab-runner"
  config.vm.synced_folder "builds/", "/home/gitlab-runner/builds"

  config.vm.provider :libvirt do |libvirt, override|
    override.vm.box = "debian/buster64"
    override.vm.box_version = ">=0"
    libvirt.cpu_mode = 'host-passthrough'
    libvirt.cpus = ENV['VM_CPU'] || CPU
    libvirt.management_network_name = ENV['VM_NETWORK_NAME'] || NETWORK_NAME
    libvirt.management_network_address = ENV['VM_NETWORK_ADDRESS'] || NETWORK_ADDRESS
    libvirt.memory = ENV['VM_MEMORY'] || MEMORY
    libvirt.random_hostname = true
    libvirt.video_type = 'vmvga'
    libvirt.video_vram = '16384'
    libvirt.volume_cache = 'unsafe'
  end

  config.vm.provision 'docker',
    type: 'shell',
    path: 'scripts/docker.sh'

  config.vm.provision 'gitlab',
    type: 'shell',
    path: 'scripts/gitlab-runner.sh',
    env: {
      GITLABCI_EXECUTOR: 'shell',
      GITLABCI_NAME: ENV['GITLABCI_NAME'] || GITLABCI_NAME,
      GITLABCI_TAGS: ENV['GITLABCI_TAGS'] || GITLABCI_TAGS,
      GITLABCI_TOKEN: ENV['GITLABCI_TOKEN'],
      GITLABCI_URL: ENV['GITLABCI_URL'] || GITLABCI_URL,
    }

  config.vm.provision 'provision',
    type: 'shell',
    path: 'scripts/provision.sh'

end
