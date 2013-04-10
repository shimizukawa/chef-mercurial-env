#
# Cookbook Name:: mercurial-env
# Recipe:: default
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
#

directory '/etc/mercurial'

template '/etc/mercurial/hgrc' do
  source 'global-hgrc.erb'
  mode '0644'
end

mercurial_ext 'https://bitbucket.org/astiob/hgshelve/raw/tip/hgshelve.py' do
  action node.mercurial_env.action
  hgext_dir node.mercurial_env.hgext_dir
  owner node.mercurial_env.owner
  group node.mercurial_env.group
end
mercurial_ext 'https://bitbucket.org/birkenfeld/hgbb/raw/tip/hgbb.py' do
  action node.mercurial_env.action
  hgext_dir node.mercurial_env.hgext_dir
  owner node.mercurial_env.owner
  group node.mercurial_env.group
end

template node.mercurial_env.hgrc.path do
  source 'hgrc.dot.erb'
  user node.mercurial_env.hgrc.owner
  group node.mercurial_env.hgrc.group
end
