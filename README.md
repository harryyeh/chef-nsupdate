# DESCRIPTION

Chef's Cookbook to Add a DNS Record / Update a DNS Record to a specified DNS server.

# REQUIREMENTS

## Platform:

The cookbook aims to be platform independant, but is tested on Ubuntu 12.04.

# USAGE:

Add your cookbook to the chef server. Make sure you have the following setup.

1) The chef fqdn attribute must be set since the recipe uses the fqdn attribute of the node.

2) This recipe assumes that you have nameservers in the /etc/resolv.conf file and grabs the first DNS server and attempts to write a dns A record to the zone your current server is in. If you don't have nameservers in this file the recipe will not work.

## Notes

This will work with any DNS Server but you must have a DNS Server that allows NON-Secured Updates - (We have a zone that we run internally that allows you to write to the DNS Server zone). If you need authentication you will need to modify the nsupdate command in this cookbook to support authentication.

We used a Windows 2003 / 2008 Active Directory DNS Server

# LICENSE

chef-nsupdate - Allows you to update the FQDN on the node you are provisioning or using with a dns server you have access to (Authoritative).

|                      |                                          |
|:---------------------|:-----------------------------------------|
| **Author:**          | Harry Yeh (<devops@cometcomputing.com>)
| **Copyright:**       | Copyright (c) 2008-2012 Comet Computing.
| **License:**         | Apache License, Version 2.0

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

