call pub global activate dart_style
call dartfmt client/lib -w -l 120
call dartfmt client/test -w -l 120
call dartfmt server/bin -w -l 120
call dartfmt server/lib -w -l 120
call dartfmt server/test -w -l 120
call dartfmt shared/lib -w -l 120
call dartfmt shared/test -w -l 120