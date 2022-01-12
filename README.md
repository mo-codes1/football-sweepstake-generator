# Sweepstake

## How to run the application

```
$ git clone https://github.com/DylanRJ/sweepstake.git
$ bundle install
$ rails db:create
$ rails db:migrate
$ bin/rails console
> competition = Competition.new(name: "Africa Cup of Nations")
> competition.save
> competition2 = Competition.new(name: "Australian Open")
> competition2.save
$ exit
$ rails s
Visit http://localhost:3000/ and http://localhost:3000/competitions
```
