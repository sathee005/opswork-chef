passenger Cookbook

1)Installs the necessary packages for passenger

2) Start the passenger

3) Attributes are defined in attributes/default.rb

4) Override attributes from ops work passing below JSON

{
 "passenger": {
    "repourl": "git repo url of your app",
    "clonelocation": "/home/ubuntu/test",
    "rubyversion": "ruby1.9.3"
  }

}
