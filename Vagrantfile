Vagrant.configure(2) do |config|
  config.vm.provider "docker" do |docker|
    docker.vagrant_vagrantfile = "new/Vagrantfile"
    docker.image = "drupal"
    docker.ports = ['80:80']
    docker.name = 'drupal-container'
  end
end