# sinatra-testapp

* execute
```
$ bundle install --path vendor/install
$ bundle exec rake db:migrate
$ bundle exec ruby app.rb
```

* routes
  * `/`
    * show server's hostname
  * `/blog`
    * db test
  * `/*`
    * show \*
