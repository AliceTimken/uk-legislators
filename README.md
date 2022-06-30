# canadian-legislators
Members of the Canadian House of Commons.



Overview
--------
<!-- Comment: provide a brief and helpful project overview -->

This project provides the following files:

File | Download | Description
---- | -------- | -----------
`R Markdown file` | [Rmd](https://theunitedstates.io/congress-legislators/legislators-current.yaml) | `R code` for collecting social media data related to Canadian MPs.
`Twitter handles` | [CSV](https://github.com/AliceTimken/canadian-legislators/blob/5aceeeab5d3b9c71904b5a8af4189cb20137d906/canadian_mp_twitterhandles.csv) | `Dataset` of currently serving Members of the House of Commons and their social media accounts.

The data formats are documented below.

This database is maintained through manual edits by Sung Eun Choi (Rutgers University), Sam Koprowski (Rutgers University), Dhia Hammami (Syracuse University), and Alice Timken (Syracuse University).



Data Format Documentation
-------------------------
<!-- Comment: describe data files and variables -->

### Legislators file structure overview

`canadian_mp_twitterhandles.csv` contains general information on Canadian Members of Parliament in the 44th House of Commons (elected in 2021).

`R Markdown file` is an R Markdown file that pulls inidividual user information and individual tweets from Twitter using the [rtweet package](https://www.rdocumentation.org/packages/rtweet/versions/0.7.0) as well as Twitter's Academic API and the [academictwitteR package](https://www.rdocumentation.org/packages/academictwitteR/versions/0.3.1). The rtweet library can be used by Twitter users without approval, while Academic Twitter requires approval from Twitter.


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

* user_id                           
* name                   
* screen_name        
* location                   
* description                
* url                              
* protected
* followers_count         
* friends_count            
* listed_count
* created_at            
* favourites_count
* utc_offset          
* time_zone
* geo_enabled      
* verified 
* statuses_count
* lang 
* contributors_enabled
* is_translator
* is_translation_enabled
* profile_background_color
* profile_background_image_url
* profile_background_image_url_https
* profile_background_tile
* profile_image_url
* profile_image_url_https
* profile_banner_url
* profile_link_color
* profile_sidebar_border_color
* profile_sidebar_fill_color
* profile_text_color
* profile_use_background_image
* has_extended_profile
* default_profile
* default_profile_image
* following  
* follow_request_sent
* notifications 
* translator_type


Data Sources
-------------------------
<!-- Comment: describe data sources -->

### Members of Parliament

A list of current members of the Canadian House of Commons can be found [here](https://www.ourcommons.ca/members/en/search) and downloaded as CSV or XML.

### Members of Parliament

A list of Canadian MP accounts curated by the House of Commons can be found on Twitter [here](https://twitter.com/i/lists/864088912087715840). Note: this list may not contain all Twitter accounts.

Twitter accounts that could not be matched to a legislator computationally were handcoded based on information provided on legislators' official websites or via the Twitter search function.




This is scratch code:

File | Download | Description
---- | -------- | -----------
`legislators-historical` | [YAML](https://theunitedstates.io/congress-legislators/legislators-historical.yaml) [JSON](https://theunitedstates.io/congress-legislators/legislators-historical.json) [CSV](https://theunitedstates.io/congress-legislators/legislators-historical.csv) | Historical Members of Congress (i.e. all Members of Congress except those in the current file).
`legislators-social-media` | [YAML](https://theunitedstates.io/congress-legislators/legislators-social-media.yaml) [JSON](https://theunitedstates.io/congress-legislators/legislators-social-media.json) | Current social media accounts for Members of Congress. Official accounts only (no campaign or personal accounts).
`committees-current` | [YAML](https://theunitedstates.io/congress-legislators/committees-current.yaml) [JSON](https://theunitedstates.io/congress-legislators/committees-current.json) | Current committees of the Congress, with subcommittees.
`committee-membership-current` | [YAML](https://theunitedstates.io/congress-legislators/committee-membership-current.yaml) [JSON](https://theunitedstates.io/congress-legislators/committee-membership-current.json) | Current committee/subcommittee assignments.
