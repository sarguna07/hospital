# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

Installing required gems

`bundle install`

#### Configure Database
Configure your database settings in your `.env` file
```
DB_USER_NAME=your_db_user_name
DB_PASSWORD=your_db_password
DB_NAME=your_db_name
```

## Create Data
#### it creates the database in name of DB_NAME 

Run 
 ```
rails db:create
 ```
 ## Migrate Data 
 #### To create table ( table_name, column_name, options ,etc) 
 
Run 
 ```
rails db:migrate
 ```

 ## To Create Default Data
#### roles ,  users , devices

Run 
 ```
rails db:seed
 ```


#### To start API

Run

```
rails s -p 4000

```

#### To Fetch Admin User Tokens

Run

```
List the users by index action 

Use the User Token to create data from device

Use Admin User Token to Update Show actions

```
#### postman url
`https://documenter.getpostman.com/view/8307881/TzCP6nGp`