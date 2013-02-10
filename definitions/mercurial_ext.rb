
define :mercurial_ext, :action => :run, :owner => 'root', :group => 'root', :hgext_dir => nil do
  target_url = params[:name]
  target_name = target_url.split('/').last
  owner = params[:owner]
  group = params[:group]
  hgext_dir = params[:hgext_dir]
  unless hgext_dir
    if owner == 'root'
      hgext_dir = "/root/.hgext"
    else
      hgext_dir = "/home/#{owner}/.hgext"
    end
  end

  case params[:action]
  when :run
    directory hgext_dir do
      action :create
      owner owner
      group group
    end

    remote_file target_name do
      action :create
      path "#{hgext_dir}/#{target_name}"
      owner owner
      group group
      source target_url
    end

  end

end
