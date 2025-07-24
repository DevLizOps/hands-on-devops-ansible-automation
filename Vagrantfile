Vagrant.configure("2") do |config|

  # Define the base image
  config.vm.box = "ubuntu/jammy64"

  # Configure a private network with a static IP for the VM
  config.vm.network "private_network", ip: "192.168.33.11"

  # Forward port 22 (SSH) of the VM to port 2224 on the host
  config.vm.network "forwarded_port", guest: 22, host: 2224, id: "ssh", auto_correct: true
end
