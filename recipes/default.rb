#
# Cookbook Name:: pam
# Recipe:: default
#
# Copyright (C) 2014 EverTrue, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

Chef::Log.info "Services: #{node['pam_d'].inspect}"

if node['pam_d']['services']
  node['pam_d']['services'].each do |service, conf|
    main = conf['main'].to_hash.sort_by do |_conf_name, attribs|
      attribs.fetch('priority', 9999)
    end

    template "/etc/pam.d/#{service}" do
      source 'service.erb'
      variables(
        conf_lines: main,
        includes: conf['includes']
      )
    end
  end
else
  Chef::Log.warn 'No pam services have been defined'
end
