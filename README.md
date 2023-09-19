# Twitter Clone App

Twitter Clone App is a social media application designed to replicate the core features and functionality of the popular platform Twitter. It allows users to post short messages or "tweets," follow other users 

# Initial Setup

After pull this repo you should run these commandas:

install gems:
```bash
bundle install
```
After insttall gems you can execute these ones to prepare the app:

```bash
rails db:preapare
#OR
rails db:create
rails db:migrate
rails db:seed
```
Run the server

```bash
rails s -p 3000
```

Go to http://localhost:3000/graphiql to see the Graphiql work page


## RSpec

run specs 
```bash
rspec spec/
```


## NOTE

You should run the rails app in port 3000
