namespace :web_server do
  %w[start stop restart reload status].each do |action|
    desc "cap web_server:#{action}"
    task action do
      run _join [gemset, "#{current_path}/bin/unicorn #{action}"]
    end
  end
end