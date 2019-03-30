# w05_spending_tracker
Ruby, Sinatra and PostGRES SQL web app.

Project Brief

# Project - Web Programming with Ruby

Over the next week you will build an app to consolidate and expand on everything you have learned:

* Object oriented programming with Ruby
* Test Driven Development
* Web Programming (REST, MVC)
* Interacting with a PostgreSQL database (CRUD)

## Rules

The project must be built using **only**:

* HTML / CSS
* Ruby
* Sinatra
* PostgreSQL and the PG gem

It must **NOT** use:

* Any Object Relational Mapper (e.g. ActiveRecord)
* JavaScript. At all. Don't even think about it.
* Any pre-built CSS libraries, such as Bootstrap.
* Authentication. Assume that the user already has secure access to the app.

# Spending Tracker

Build an app that allows a user to track their spending.

#### Inspired by:

Monzo, MoneyDashboard, lots of mobile/online banking apps

## MVP

* The app should allow the user to create, edit and delete merchants, e.g. Tesco, Amazon, ScotRail
* The app should allow the user to create, edit and delete tags for their spending, e.g. groceries, entertainment, transport
* The user should be able to assign tags and merchants to a transaction, as well as an amount spent on each transaction.
* The app should display all the transactions a user has made in a single view, with each transaction's amount, merchant and tag, and a total for all transactions.

### User Stories

#### Track merchants
_As a user_<br/>
_I want to maintain a list of merchants I have spent money with_<br/>
_So that I can track how much money I have spent with each_<br/>
**Acceptance Criteria:** Users should be able to add new merchants<br/>
**Acceptance Criteria:** Users should be able to edit a merchant's details<br/>
**Acceptance Criteria:** Users should be able to delete a merchant<br/>

#### Create tags
_As a user_<br/>
_I want to maintain a list of tags_<br/>
_So that I can track which categories I'm spending money on_<br/>
**Acceptance Criteria:** Users should be able to add new tags<br/>
**Acceptance Criteria:** Users should be able to edit tags<br/>
**Acceptance Criteria:** Users should be able to delete tags<br/>

#### Manage transactions
_As a user_<br/>
_I want to maintain a list of transactions_<br/>
_So that I can keep track of my spending_<br/>
**Acceptance Criteria:** Users should be able to add new transactions<br/>
**Acceptance Criteria:** Transactions should record how much was spent, where it was spent and on which category<br/>
**Acceptance Criteria:** Users should be able to edit transactions<br/>
**Acceptance Criteria:** Users should be able to delete transactions<br/>

#### Display transactions
_As a user_<br/>
_I want to view a list of all my transactions_<br/>
_So that I can see a summary of what I've spent my money on_<br/>
**Acceptance Criteria:** Users should be able to view all transactions at once<br/>
**Acceptance Criteria:** The view should include all relevant data for each transaction<br/>
**Acceptance Criteria:** The view should include a clearly-labelled total value for the transactions



## Possible Extensions

* Transactions should have a timestamp, and the user should be able to view transactions sorted by the time they took place.
* The user should be able to supply a budget, and the app should alert the user somehow when when they are nearing this budget or have gone over it.
* The user should be able to filter their view of transactions, for example, to view all transactions in a given month, or view all spending on groceries.

### User Stories

#### Timestamps
_As a user_<br/>
_I want to record the time of each transaction_<br/>
_So that I can view them in the correct order_<br/>
**Acceptance Criteria:** When a transaction is created the time should be recorded<br/>
**Acceptance Criteria:** When viewing all transactions they should be organised by time<br/>

#### Budgets
_As a user_<br/>
_I want to set a budget_<br/>
_So that I can set a limit on my spending_<br/>
**Acceptance Criteria:** The user should be able to set a budget<br/>
**Acceptance Criteria:** The user should be able to change that budget<br/>
**Acceptance Criteria:** Adding a new transaction should alert the user if it will take them near to or over their budget<br/>

#### Filtering
_As a user_<br/>
_I want to filter the list of transactions_<br/>
_So that I can hide transactions I'm not interested in right now_<br/>
**Acceptance Criteria:** The user should be able to search for transactions which meet some criteria, eg. date, category<br/>
**Acceptance Criteria:** The user should be able to apply multiple filters, eg. date AND category<br/>
**Acceptance Criteria:** The user should be able to clear any filter(s) and see all transactions again
