Organizer Talks
===============
Conference Track Management

This system helps to manage the time constraints of conferences by automatically fitting the talks into the tracks according to the duration of with session of the day. With that, it is possible to easily create a line up that will always use time in an efficient way, preveting delays.

Requirements:
-------------

* Ruby 2.2.2
* Rspec 3.3
* The extension file must be txt
* The input file must be on the same directory as the main.rb

Test:
-----
```
Bundle Install
rspec spec/
```

Run:
----
The system only includes input from files. To execute run the command below.

```
ruby main.rb input.txt
```
