#
# Cookbook Name:: filezilla
# Recipe:: default
#
# Copyright 2012, Webtrends, Inc.
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

if platform?('windows')
  windows_package 'FileZilla Client 3.6.0.2' do
    source node['filezilla']['http_url']
    installer_type :custom
    options '/S /user=all'
    action :install
  end
elsif platform_family?('debian')
  package 'filezilla'
elsif platform_family?('rhel')
  include_recipe 'yum'

  yum_repository 'epel' do
    description 'Extra Packages for Enterprise Linux'
    mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch'
    gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6'
    action :create
  end

  package 'filezilla'
else
  fail 'This cookbook does not support this platform'
end
