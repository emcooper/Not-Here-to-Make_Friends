# Not Here to Make Friends
A fantasy league application for the Bachelor and Bachelorette.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites

The setups steps expect following tools installed on the system.

- Git
- Ruby 
- Rails

### Installing

##### 1. Check out the repository

```bash
git clone https://github.com/emcooper/Not-Here-to-Make-Friends.git
```
##### 2. Install Dependencies


```ruby
bundle
```
##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```

##### 4. Create and setup configurations

Run the following commands to create and setup the configuration.

```ruby
mkdir /config/application.yml
```

Put the following keys in the file (generate as necessary from providers):

```yaml
twitter_consumer_key: XXX
twitter_consumer_secret: XXX

watson_api_key: XXX
watson_url: https://XXX

FB_APP_ID: XXX
FB_APP_SECRET: XXX
```

##### 5. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

Now you can visit the site with the URL http://localhost:3000

##### 6. Run tests

```bash
rspec
```
