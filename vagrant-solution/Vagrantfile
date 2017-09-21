# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = '2'

require 'yaml'
require 'erb'
require 'pp'

ENV['VAGRANT_DEFAULT_PROVIDER'] ||= 'docker'

# Best Practise to use it for continuous deployment is use config.yml with which you can use a standard vagrant template 
# to build different machines and environment 

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define 'dnata' do |dnata|
    dnata.vm.provider 'docker' do |d|

      if ENV['DOCKER_IMAGE'] then
        print 'Using docker image ' + ENV['DOCKER_IMAGE'] +' (downloads if necessary)\n'
        d.image = ENV['DOCKER_IMAGE']
      else
        d.build_dir = 'jenkins'
        d.name = 'jenkins'
      end
    end

    dnata.vm.host_name = 'dnata-jenkins'
    dnata.vm.network :forwarded_port, host: 8080, guest: 80

  end


end
