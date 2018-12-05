# Project -------------------------------------------------------

override['project']['name'] = 'spree-app'
override['project']['repository'] = 'git@github.com:el-MonAX/spree-demo.git'

# Locale ---------------------------------------------------------

override['locale']['lang'] = 'en_US.UTF-8'
override['locale']['lc_all'] = node['locale']['lang']

# Postgresql -----------------------------------------------------

override['postgresql']['version'] = '9.6'
override['postgresql']['users'] = [{
  'name' => 'deployer',
  'encrypted_password' => 'md55a7c17c32eec54233a5f5c96990c4e9d',
  'superuser' => true
}, {
  'name' => node['project']['name'],
  'encrypted_password' => 'md527d29bcf2920db2407d2bf7971dec4c9', # 'md55a7c17c32eec54233a5f5c96990c4e9d',
  'superuser' => false # the user of the project's database must have access only to the project database
}]

override['postgresql']['databases'] = [{
  'name' => "#{node['project']['name']}_#{node['environment']}",
  'owner' => node['project']['name']
}]

# Ruby -----------------------------------------------------------

override['ruby']['versions'] = ['2.4.2']
override['ruby']['default'] = '2.4.2'

# Node.js --------------------------------------------------------

override['nodejs']['version'] = '9.3.0'
override['nodejs']['binary']['checksum'] = 'b7338f2b1588264c9591fef08246d72ceed664eb18f2556692b4679302bbe2a5'

# Nginx -----------------------------------------------------------

override['nginx']['source']['version'] = '1.13.7'
override['nginx']['source']['checksum'] = 'beb732bc7da80948c43fd0bf94940a21a21b1c1ddfba0bd99a4b88e026220f5c'
