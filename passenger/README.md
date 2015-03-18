passenger Cookbook

1)Installs the necessary packages for passenger

2) Start the passenger

3) Attributes are defined in attributes/default.rb

4) Override attributes from ops work passing below JSON

{
 "passenger": {
     "repourl": "https://github.com/trotter/rails-hello-world.git",
    "clonelocation": "/home/ubuntu/test",
    "rubyversion": "1.9.3",
    "state": "configure",
     "mininstances": "3",
     "maxpoolsize" : "5",
     "port" : "6000",
     "appname": "example"

  }

}

 Attributes:
	 
	 state - configure,start,stop,restart,restart-app
	 
	    configure- Install passenger and start it
	 
	    start - start passenger 
	 
	    stop- stop passenger
	    restart - restart passenger 
	 
	    restart-app - restart the specified app with appname specified on appname attribute
	 
	 port: port passenger has to run
	 appname: specfic app name to restart works if state attribute is restart-app
	 
