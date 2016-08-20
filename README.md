[![Build Status](https://travis-ci.org/SmartPeopleCompany/SmartPeopleUI.svg)](https://travis-ci.org/SmartPeopleCompany/SmartPeopleUI) [![Heroku](https://heroku-badge.herokuapp.com/?app=smartpeople)](http://smartpeople.herokuapp.com/)

# Smart People

_Scientific social network_


Installing project:

`1.` Get repository:

	a) Visit https://github.com/SmartPeopleCompany/SmartPeopleUI
	b) Clone repository SmartPeopleUI via ssh

`2.` Install Dart support:

	a) How to do it you can find here https://www.dartlang.org/downloads/

`3.` Configure your IDE (WebStorm):

	a) Go 'File => Settings => Languages & Frameworks => Dart'
	b) Enable Dart support for project <your project>
	c) Dart SDK path : 'C:\tools\dart-sdk' or <your own path>
	d) Dartium Path : 'C:\tools\dartium\chrome.exe' or <your own path>

`4.` Build project:

    a) Build client side:
        Go to client folder. Run next comands inside from the folder:
            - `pub get` to get dependencies;
            - `npm install` to install postcss plugins;
            **WARNING**
            if you use Windows OS, please comment the folowing line
             _executable: ./node_modules/postcss-cli/bin/postcss_
            in the file pubspec.yaml in client folder
            **WARNING**
            - `pub build` to build project;

	b) Build server side:
	    Go to server folder:
	        - run 'pub get' to get dependencies;
	        
    c) Run the project
    
        From the client folder:
            - run 'pub serve' to turn on runtime precompiling 
        
        From the server folder:
            - run 'dart bin/server.dart'
	        
    d)  Usage:
        Go to: http://localhost:9999 in Dartium

