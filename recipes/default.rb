#
# Cookbook Name:: nodejs
# Recipe:: default
#

package "python-software-properties"

execute "setup ppa apt repository" do
  command "add-apt-repository ppa:chris-lea/node.js && apt-get update"
  not_if  { Dir["/etc/apt/sources.list.d/chris-lea-node*"].any? }
end

package "nodejs"
