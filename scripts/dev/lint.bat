cd client
call dartanalyzer --fatal-warnings --lints lib

cd ../server
call dartanalyzer --fatal-warnings --lints bin
call dartanalyzer --fatal-warnings --lints lib

cd ..