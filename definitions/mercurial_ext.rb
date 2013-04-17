
define :mercurial_ext, :action => :install, :owner => 'root', :group => 'root', :plugins_dir => nil do
  target_url = params[:name]
  target_name = target_url.split('/').last
  owner = params[:owner]
  group = params[:group]
  plugins_dir = params[:plugins_dir]
  unless plugins_dir
    if owner == 'root'
      plugins_dir = "/root/.hgext"
    else
      plugins_dir = "/home/#{owner}/.hgext"
    end
  end

  directory plugins_dir do
    action :create
    owner owner
    group group
  end

  case params[:action]
  when :install
    remote_file target_name do
      action :create_if_missing
      path "#{plugins_dir}/#{target_name}"
      owner owner
      group group
      source target_url
    end

  when :update
    remote_file target_name do
      action :create
      path "#{plugins_dir}/#{target_name}"
      owner owner
      group group
      source target_url
    end

  end

end
