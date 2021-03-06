#
# Cookbook Name:: cloudfoundry-dea
# Recipe:: default
#
# Copyright 2012, Trotter Cashion
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

node.default['cloudfoundry_dea']['provided_native_packages'] = node.default['cloudfoundry_stager']['provided_native_packages']

node['cloudfoundry_dea']['provided_native_packages'].each do |pkg|
  package pkg
end

directory node['cloudfoundry_dea']['base_dir'] do
  recursive true
  owner node['cloudfoundry_common']['user']
  mode  '0755'
end

cloudfoundry_component "dea"
