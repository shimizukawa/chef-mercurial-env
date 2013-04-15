# Cookbook Name:: mercurial-env
# Attributes:: default
#
# Copyright 2013, Takayuki SHIMIZUKAWA
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

########################
# global hgrc

default['mercurial_env']['global_hgrc'] = true
default['mercurial_env']['owner'] = 'root'
default['mercurial_env']['group'] = 'root'
default['mercurial_env']['action'] = :install  #accept: :install, :update

########################
# user hgrc

default['mercurial_env']['user_hgrc'] = true
default['mercurial_env']['hgrc']['path'] = nil
default['mercurial_env']['hgrc']['owner'] = nil
default['mercurial_env']['hgrc']['group'] = nil
default['mercurial_env']['hgrc']['username'] = nil
default['mercurial_env']['hgrc']['hostfingerprints'] = {
  'bitbucket.org' => '24:9c:45:8b:9c:aa:ba:55:4e:01:6d:58:ff:e4:28:7d:2a:14:ae:3b',
}
default['mercurial_env']['hgrc']['bb'] = {
  'username' => '',
  'password' => '',
  'default_method' => 'https',
}

########################
# plugins

default['mercurial_env']['plugins_dir'] = '/etc/mercurial/.hgext'
default['mercurial_env']['plugins'] = {
  'shelve' => 'https://bitbucket.org/astiob/hgshelve/raw/tip/hgshelve.py',
  'bb' => 'https://bitbucket.org/birkenfeld/hgbb/raw/tip/hgbb.py',
}

###########################
# setup dynamic attribute
unless node['mercurial_env']['hgrc']['owner']
  override['mercurial_env']['hgrc']['owner'] = node['mercurial_env']['owner']
end
unless node['mercurial_env']['hgrc']['group']
  override['mercurial_env']['hgrc']['group'] = node['mercurial_env']['group']
end
unless node['mercurial_env']['hgrc']['path']
  if node['mercurial_env']['hgrc']['owner'] == 'root'
    path = "/root/.hgrc"
  else
    path = "/home/#{node['mercurial_env']['hgrc']['owner']}/.hgrc"
  end
  override['mercurial_env']['hgrc']['path'] = path
end
