require "serverspec"

set :backend, :exec

describe "NodeSource `apt` setup" do
  describe file("/etc/apt/sources.list.d/nodesource.list") do
    it { should be_a_file }
    its(:content) { should match("nodesource") }
    its(:content) { should match("main") }
  end
end

describe "Package installation" do
  describe package("iojs") do
    it { should be_installed }
  end
end

describe "Runtime executables" do
  describe command("iojs -v") do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match(/v1\.\d+/) }
  end

  describe command("npm -v") do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match(/\d+\.\d+\.\d+/) }
  end
end
