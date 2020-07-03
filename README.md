# VagrantSpray

*VagrantSpray* is a packaged environment to run the CI for the [Kubespray](https://github.com/kubernetes-sigs/kubespray) project.

## Requirements

 * Install [Vagrant](http://www.vagrantup.com/downloads.html)
 * Install [vagrant-libvirt](https://github.com/vagrant-libvirt/vagrant-libvirt) plugin
 * Enable [Nested Guest](https://www.linux-kvm.org/page/Nested_Guests) to run the Vagrant jobs

## Configuration

The box can be configured with environment variables:

| Variable name      | Description                                          | Default value                                   |
| ---                | ---                                                  | ---                                             |
| VM_CPU             | CPUs assigned to the VM                              | `2`                                             |
| VM_MEMORY          | Amount of memory assigned to the VM in MB            | `8192`                                          |
| VM_NETWORK_NAME    | Libvirt network name to use as management network    | `default`                                       |
| VM_NETWORK_ADDRESS | Network address to be used in the management network | `192.168.122.1/24`                              |
| GITLABCI_NAME      | Gitlab runner name                                   | `kubespray-runner`                              |
| GITLABCI_TAGS      | Gitlab runner tags                                   | `kubespray,light,vagrant,molecule,c3.small.x86` |
| GITLABCI_URL       | Gitlab runner URL                                    | `https://gitlab.com/`                           |
| GITLABCI_TOKEN     | Gitlab runner token                                  |                                                 |

## Quick start

```bash
export GILTABCI_TOKEN=1234
vagrant up
```
