# uk-legislators
Members of the House of Commons of the United Kingdom.



Overview
--------
<!-- Comment: provide a brief and helpful project overview -->

This project provides the following files:

File | Download | Description
---- | -------- | -----------
`Twitter Handles List` | [CSV](https://github.com/AliceTimken/uk-legislators/blob/a1627845b0dfd931b85912841094a9c26d2b36c3/uk_legislators.csv) | `Data frame` of currently serving Members of the House of Commons and their social media accounts.
`Collect MP Accounts Info` | [R file](https://github.com/AliceTimken/uk-legislators/blob/a1627845b0dfd931b85912841094a9c26d2b36c3/uk_legislators.R) | `R code` file for collecting social media account information of UK MPs.
`Full Legislator Data` | [RData](https://github.com/AliceTimken/uk-legislators/blob/a1627845b0dfd931b85912841094a9c26d2b36c3/uk_legislators_full.RData) | `R Data` of currently serving Members of the House of Commons and their social media accounts, including User IDs.

The data formats are documented below.

This database is part of a "legislators twitter" working project, which is maintained through manual edits by Sung Eun Choi (Rutgers University), Sam Koprowski (Rutgers University), Dhia Hammami (Syracuse University), and Alice Timken (Syracuse University).



Data Format Documentation
-------------------------
<!-- Comment: describe data files and variables -->

### Legislators file structure overview

`uk_legislators.csv` contains the name, party, incumbency status, and Twitter screen names (or handles) of Members of Parliament of the UK House of Commons elected in 2019 (2019-2022).

`uk_legislators.R` is an R code file that was used to create the list of UK MP Twitter accounts by pulling a list of MPs elected in 2019 from Wikipedia and matching it with the most recent Twitter list of UK MP accounts available (provided by @TwitterGov). This file also includes notes on issues experienced when handcoding the remaining MPs.

`uk_legislators_full.RData` is an R Data file that includes User IDs for MP Twitter accounts. These IDs are permanent, unlike screen names (or handles) that can be changed by individual users.


### Data Dictionary (CSV)

The following fields are available in `uk_legislators.csv`:


* name: full name (first and last) of the legislator
* screen_name: Twitter handle of the legislator
* constituency: Constituency represented by the legislator in parliament
* party_member: Political party affiliation of the legislator 
* party_before: The part affiliation of constituency's MP directly before to the 2019 election.
* notes: Incumbency status of the MP and if/when they gained or left office during the 2019-2022 term.
* user_id: The permanent Twitter User ID for the MP's account, when matched with the 2017 Twitter list.




### Data Dictionary (Twitter User Data)

The following fields are made available when collecting social media data using the [rtweet package](https://www.rdocumentation.org/packages/rtweet/versions/0.7.0) (as shown in `R Markdown file`):

* user_id: The integer representation of the unique identifier for the user               
* name: The name of the user (as the user defined it)
* screen_name: The screen name, handle, or alias that this user identifies themselves with (Twitter handle of the legislator in this data)
* location: The user-defined location for this account’s profile
* description: The user-defined UTF-8 string describing their account (nullable)
* url: A URL provided by the user in association with their profile       
* protected: Indication that this user has chosen to protect their Tweets
* followers_count: The number of followers this account currently has
* friends_count: The number of users this account is following (AKA their “followings”)
* listed_count: The number of public lists that this user is a member of
* created_at: The UTC datetime that the user account was created on Twitter
* favourites_count: The number of Tweets this user has liked in the account’s lifetime     
* verified: When true, indicates that the user has a verified account
* statuses_count: The number of Tweets (including retweets) issued by the user
* default_profile: When true, indicates that the user has not altered the theme or background of their user profile
* default_profile_image: When true, indicates that the user has not uploaded their own profile image and a default image is used instead


Data Sources
-------------------------
<!-- Comment: describe data sources -->

### Members of Parliament

An interactive list of current members of the UK House of Commons can be found on the official website [here](https://members.parliament.uk/members/Commons). This website does not provide a list for accessible download.

The list of MPs included in this dataset were partly webscraped from the "List of MPs elected in the 2019 United Kingdom general election" [Wikipedia page](https://en.wikipedia.org/wiki/List_of_MPs_elected_in_the_2019_United_Kingdom_general_election).


### Legislator Twitter Accounts

An list of UK MP accounts from the previous House of Commons (elected 2017) can be found on Twitter [here](https://twitter.com/i/lists/217199644). (Note: this list does not contain all current UK MP Twitter accounts.)

Twitter accounts that could not be matched to a legislator computationally were handcoded based on information provided on legislators' official websites or via the Twitter search function.


## Public domain

This project is [dedicated to the public domain](LICENSE):

> The project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](http://creativecommons.org/publicdomain/zero/1.0/).
> All contributions to this project will be released under the CC0 dedication. By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.


Last updated July 2022.
