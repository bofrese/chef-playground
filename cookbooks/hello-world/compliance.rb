dangerous_services = %w( ftp telnet )

dangerous_services.each do |p|
  package p do
    action :remove
  end
end

