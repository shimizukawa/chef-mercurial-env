# Cookbook Name:: redmine
# Attributes:: redmine
#
# Copyright 2009, Opscode, Inc
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

default[:mercurial_env][:owner] = 'root'
default[:mercurial_env][:hgext_dir] = nil

default[:mercurial_env][:hgrc][:owner] = nil
default[:mercurial_env][:hgrc][:username] = nil
default[:mercurial_env][:hgrc][:hostfingerprints] = {
  'bitbucket.org' => '24:9c:45:8b:9c:aa:ba:55:4e:01:6d:58:ff:e4:28:7d:2a:14:ae:3b',
}
default[:mercurial_env][:hgrc][:bb] = {
  'username' => '',
  'password' => '',
  'default_method' => 'https',
}
