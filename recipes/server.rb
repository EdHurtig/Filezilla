windows_package 'FileZilla Client 3.6.0.2' do
  source node['filezilla']['server']['http_url']
  installer_type :custom
  options '/S /user=all'
  action :install
end
