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

	a) run `pub get` to get dependencies;
	b) install npm dependencies(now everything is global but will be reduced to local when PR to postcss transformer
	will be applied):
	```
	npm install -g postcss@ postcss-cli@2.3.2 autoprefixer@ postcss-nesting@
	```
	c) run `pub build` to build project;
	d) run `pub serve` to set local server (optionaly)

