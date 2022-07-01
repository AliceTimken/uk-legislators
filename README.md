# canadian-legislators
Members of the Canadian House of Commons.



Overview
--------
<!-- Comment: provide a brief and helpful project overview -->

This project provides the following files:

File | Download | Description
---- | -------- | -----------
`Extracting MP Tweets` | [Rmd](https://github.com/AliceTimken/canadian-legislators/blob/b6afbda0218b3a735567d74e47c20dfe87807582/ExtractingMPTweets.html) | `R Markdown` HTML page tutorial for collecting social media data related to Canadian MPs.
`Twitter handles` | [CSV](https://github.com/AliceTimken/canadian-legislators/blob/5aceeeab5d3b9c71904b5a8af4189cb20137d906/canadian_mp_twitterhandles.csv) | `Dataset` of currently serving Members of the House of Commons and their social media accounts.

The data formats are documented below.

This database is maintained through manual edits by Sung Eun Choi (Rutgers University), Sam Koprowski (Rutgers University), Dhia Hammami (Syracuse University), and Alice Timken (Syracuse University).



Data Format Documentation
-------------------------
<!-- Comment: describe data files and variables -->

### Legislators file structure overview

`canadian_mp_twitterhandles.csv` contains general information on Canadian Members of Parliament in the 44th House of Commons (elected in 2021).

`Extracting MP Tweets` is an R Markdown file that pulls inidividual user information and individual tweets from Twitter using the [rtweet package](https://www.rdocumentation.org/packages/rtweet/versions/0.7.0) as well as Twitter's Academic API and the [academictwitteR package](https://www.rdocumentation.org/packages/academictwitteR/versions/0.3.1). This file is opened using your web browser.

(Note: The rtweet library can be used by Twitter users without approval, while Academic Twitter requires approval from Twitter.)


### Data Dictionary (CSV)

The following fields are available in `canadian_mp_twitterhandles.csv`:


* name: full name (first and last) of the legislator
* screen_name: Twitter handle of the legislator
* constituency: Constituency represented by the legislator in parliament
* prov_territory: Province or territory of the legislator's constituency
* political_affiliation: Political party affiliation of the legislator 
* start_date: Start date of the legislator’s term in the 44th House of Commons (September 20, 2021)
* first_name: First name of the legislator
* last_name: Last name (surname) of the legislator
* house: House of parliament to which the legislator belongs (e.g. House of Commons or Senate)
* title: Honorary title of the legislator, if applicable



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

A list of current members of the Canadian House of Commons can be found [here](https://www.ourcommons.ca/members/en/search) and downloaded as CSV or XML.

### Legislator Twitter Accounts

A list of Canadian MP accounts curated by the House of Commons can be found on Twitter [here](https://twitter.com/i/lists/864088912087715840). (Note: this list may not contain all legislator Twitter accounts.)

Twitter accounts that could not be matched to a legislator computationally were handcoded based on information provided on legislators' official websites or via the Twitter search function.


## Public domain

This project is [dedicated to the public domain](LICENSE):

> The project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](http://creativecommons.org/publicdomain/zero/1.0/).
> All contributions to this project will be released under the CC0 dedication. By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.


Last updated June 2022.
