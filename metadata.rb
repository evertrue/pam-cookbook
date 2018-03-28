name             'pam'
maintainer       'EverTrue, Inc.'
maintainer_email 'devops@evertrue.com'
license          'Apache-2.0'
description      'Installs/Configures pam'
long_description 'Installs/Configures pam'
version          '1.0.4'
chef_version     '>= 12.1'

issues_url 'https://github.com/evertrue/pam-cookbook/issues' if respond_to?(:issues_url)
source_url 'https://github.com/evertrue/pam-cookbook' if respond_to?(:source_url)

supports 'ubuntu', '~> 14.04'
supports 'ubuntu', '~> 16.04'
supports 'centos', '~> 7.0'
