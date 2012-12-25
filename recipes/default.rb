#!/usr/bin/env ruby
#Get the name server from the /etc/resolv.conf file
require 'resolv'

nameServerFile = "/etc/resolv.conf"
ip_regex = "(?:[0-9]{1,3}\.){3}[0-9]{1,3}$"

fqdn = node[:fqdn]
nodeIp = node[:ipaddress]

nameServers = Array.new
counter = 0
File.open(nameServerFile, "r") do |inFile|
	while (line = inFile.gets)
		#Check to see if the line has the name server in it. If it does add it to the array of name servers
		if (line =~ /nameserver(.*)/)
			nameServers[counter] = line.match(ip_regex)
			counter += 1
		end
	end
end

IO.popen("nsupdate -v", 'r+') do |f|
    f << <<-EOF
      server #{nameServers[0]}
			update delete #{fqdn}
      update add #{fqdn} 3600 A #{nodeIp}
      show
      send
    EOF

    f.close_write
    puts f.read
end

