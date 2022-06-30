# canadian-legislators
Members of the Canadian House of Commons.



Overview
--------
<!-- Comment: provide a brief and helpful project overview -->

This project provides the following files:

File | Download | Description
---- | -------- | -----------
`R Markdown file` | [Rmd](https://theunitedstates.io/congress-legislators/legislators-current.yaml) | `R code` for collecting social media data related to Canadian MPs.
`Twitter handles` | [CSV](https://github.com/AliceTimken/canadian-legislators/blob/a652278e67adcaa7462332b8f40c7ef66fecfcfa/canadian_mp_twitterhandles.csv) | `Dataset` of currently serving Members of the House of Commons and their social media accounts.

The data formats are documented below.

This database is maintained through manual edits by Sung Eun Choi (Rutgers University), Sam Koprowski (Rutgers University), Dhia Hammami (Syracuse University), and Alice Timken (Syracuse University).



Data Format Documentation
-------------------------
<!-- Comment: describe data files and variables -->

### Legislators file structure overview

`legislators-current.yaml` and `legislators-historical.yaml` contain biographical information on all Members of Congress that have ever served in Congress, that is, since 1789, as well as cross-walks into other databases.

Each legislator record is grouped into four guaranteed parts: id's which relate the record to other databases, name information (first, last, etc.), biographical information (birthday, gender), and terms served in Congress. A typical record looks something like this:


### Data Dictionary

The following fields are available in `canadian_mp_twitterhandles.csv`:


* name
* screen_name
* constituency         
* prov_territory
* political_affiliation
* start_date       
* first_name
* last_name
* house
* title



-
The following fields are made available when collecting social media data using the [rtweet package (https://www.rdocumentation.org/packages/rtweet/versions/0.7.0) (as shown in `R Markdown file`):

"user_id"                            
"name"                              
 [3] 
 "screen_name"                        
 "location"                          
 [5] 
 "description"                        
 "url"                               
 [7] 
 "protected"                          
 "followers_count"                   
 [9] 
 "friends_count"                      
 "listed_count"                      
[11] 
"created_at"                         
"favourites_count"                  
[13] 
"utc_offset"                         
"time_zone"                         
[15] 
"geo_enabled"                        
"verified"                          
[17] 
"statuses_count"                     
"lang"                              
[19] 
"contributors_enabled"               
"is_translator"                     
[21] 
"is_translation_enabled"             
"profile_background_color"          
[23] 
"profile_background_image_url"       
"profile_background_image_url_https"
[25] 
"profile_background_tile"            
"profile_image_url"                 
[27] 
"profile_image_url_https"            
"profile_banner_url"                
[29] 
"profile_link_color"                 
"profile_sidebar_border_color"      
[31] 
"profile_sidebar_fill_color"         
"profile_text_color"                
[33] 
"profile_use_background_image"       
"has_extended_profile"              
[35] 
"default_profile"                    
"default_profile_image"             
[37] 
"following"                          
"follow_request_sent"               
[39] 
"notifications"                      
"translator_type" 





* id
	* bioguide: The alphanumeric ID for this legislator in http://bioguide.congress.gov. Note that at one time some legislators (women who had changed their name when they got married) had two entries on the bioguide website. Only one bioguide ID is included here. **This is the best field to use as a primary key.**
	* thomas: The numeric ID for this legislator on http://thomas.gov and http://beta.congress.gov. The ID is stored as a string with leading zeros preserved.
	* lis: The alphanumeric ID for this legislator found in Senate roll call votes (http://www.senate.gov/pagelayout/legislative/a_three_sections_with_teasers/votes.htm).
	* fec: A *list* of IDs for this legislator in Federal Election Commission data. In the CSV format, the `fec_ids` column is comma-separated.
	* govtrack: The numeric ID for this legislator on GovTrack.us (stored as an integer).
	* opensecrets: The alphanumeric ID for this legislator on OpenSecrets.org.
	* votesmart: The numeric ID for this legislator on VoteSmart.org (stored as an integer).
	* icpsr: The numeric ID for this legislator in Keith Poole's VoteView.com website, originally based on an ID system by the Interuniversity Consortium for Political and Social Research (stored as an integer).
	* cspan: The numeric ID for this legislator on C-SPAN's video website, e.g. http://www.c-spanvideo.org/person/1745 (stored as an integer).
	* wikipedia: The Wikipedia page name for the person (spaces are given as spaces, not underscores).
	* ballotpedia: The ballotpedia.org page name for the person (spaces are given as spaces, not underscores).
	* maplight : The numeric ID for this legislator on maplight.org (stored as an integer).
	* house_history: The numeric ID for this legislator on http://history.house.gov/People/Search/. The ID is present only for members who have served in the U.S. House.
	* bioguide_previous: When bioguide.congress.gov mistakenly listed a legislator under multiple IDs, this field is a *list* of alternative IDs. (This often ocurred for women who changed their name.) The IDs in this list probably were removed from bioguide.congress.gov but might still be in use in the wild.

* name
	* first: The legislator's _recognizable_ first name. Many people go by a different name than their legal first name, often their legal middle name, and our approach is to ensure that our first + last name fields combine to a recognizable name of the legislator. Normally we'll follow the name as it appears on House.gov or Senate.gov (and bioguide.congress.gov), which follows the legislator's own preference for how they want to be named in official places. However, in some cases the legislator goes by a first name that is merely a common short or informal form of their legal first name (e.g. Chris vs Christopher), and while they may prefer the informal name, we may use their longer legal first name because they would be recognizable by their legal name. If they sign official documents (e.g. letters to agencies, FEC filings) using their longer legal first name, we would use their legal first name and put their preferred shorter name in the `nickname` field. When legislators go by a first initial and middle name, we set the `first` name field to the initial (one character plus a period).
	* middle: The legislator's middle name or middle initial (with period). It is not recommended to display this field, unless the `first` name field is an initial (one character plus a period).
	* last: The legislator's last name. Some names include non-ASCII characters. When building search systems, it is advised to index both the raw value as well as a value with extended characters replaced with their ASCII equivalents (in Python that's: u"".join(c for c in unicodedata.normalize('NFKD', lastname) if not unicodedata.combining(c))).
	* suffix: A suffix on the legislator's name, such as "Jr." or "III", but only if they use it in official contexts, such as if it appears on House.gov or Senate.gov.
	* nickname: The legislator's nick name when used as a common alternative to their first name. Usually displayed within quotes after the first name. If they are generally only known by a nickname, we would likely place the name in the `first` name field instead (see above).
	* official_full: The full name of the legislator according to the House or Senate (usually first, middle initial, nickname, last, and suffix). Present for those serving on 2012-10-30 and later.

* other_names, when present, lists other names the legislator has gone by officially. This is helpful in cases where a legislator's legal name has changed. These listings will only include the name attributes which differ from the current name, and a start or end date where applicable. Where multiple names exist, other names are listed chronologically by end date. An excerpted example:

	- id:
		bioguide: B001228
		thomas: '01465'
		govtrack: 400039
		opensecrets: N00007068
	  name:
		first: Mary
		middle: Whitaker
		last: Bono Mack
	  other_names:
	  - last: Bono
		end: '2007-12-17'
	  ...

* bio
	* birthday: The legislator's birthday, in YYYY-MM-DD format.
	* gender: The legislator's gender, either "M" or "F". (In historical data, we've worked backwards from [history.house.gov's Women in Congress feature](http://history.house.gov/People/Search?filter=6).)

* terms (one entry for each election)
	* type: The type of the term. Either "sen" for senators or "rep" for representatives and delegates to the House.
	* start: The date legislative service began: the date the legislator was sworn in, if known, or else the beginning of the legislator's term. Since 1935 regularly elected terms begin on January 3 at noon on odd-numbered years, but when Congress does not first meet on January 3, term start dates might reflect that swearing-in occurred on a later date. (Prior to 1935, terms began on March 4 of odd-numbered years, see [here](https://github.com/unitedstates/congress-legislators/pull/305).) Formatted as YYYY-MM-DD.
	* end: The date the term ended (because the Congress ended or the legislator died or resigned, etc.). End dates follow the Constitutional end of a term. Since 1935, terms begin and end on January 3 at noon in odd-numbered years, and thus a term end date may also be a term start date. Prior to 1935, terms began on March 4 and ended either on March 3 or March 4. The end date is the last date on which the legislator served this term. Unlike the start date, whether Congress was in session or not does not affect the value of this field.
	* state: The two-letter, uppercase USPS abbreviation for the state that the legislator is serving from. See below.
	* how: How the term came to be. This field is generally not present and is currently only set haphazardly in recent data. The field is set to "appointment" for [senators appointed to fill a vacancy](https://www.senate.gov/senators/AppointedSenators.htm). Senators and representatives elected by special election are indicated by `special-election`. For senators currently serving per an appointment, the field `end-type` may be set to `special-election`, in which case the `end` date of the term will reflect the expected special election date to replace the appointed senator. Once the special election occurs and the next senator is sworn in, ending the term of the appointed senator, the end date will be updated to reflect the actual end of service (which will follow the election date).
	* district: For representatives, the district number they are serving from. At-large districts are district 0. In historical data, unknown district numbers are recorded as -1.
	* class: For senators, their election class (1, 2, or 3). Note that this is unrelated to seniority.
	* state_rank: For senators, whether they are the "junior" or "senior" senator (only valid if the term is current, otherwise the senator's rank at the time the term ended).
	* party: The political party of the legislator. If the legislator changed parties, this is the most recent party held during the term and `party_affiliations` will be set. Values are typically "Democrat", "Independent", or "Republican". The value typically matches the political party of the legislator on the ballot in his or her last election, although for state affiliate parties such as "Democratic Farmer Labor" we will use the national party name ("Democrat") instead to keep the values of this field normalized.
	* caucus: For independents, the party that the legislator caucuses with, using the same values as the `party` field--although not required for independents with no caucus. Omitted if the legislator caucuses with the party indicated in the party field. When in doubt about the difference between the `party` and `caucus` fields, the `party` field is what displays after the legislator's name (i.e. "(D)") but the `caucus` field is what normally determines committee seniority. This field was added starting with terms for the 113th Congress.
	* party_affiliations: This field is present if the legislator changed party or caucus affiliation during the term. The value is a list of time periods, with `start` and `end` dates, each of which has a `party` field and a `caucus` field if applicable, with the same meanings as the main `party` and `caucus` fields. The time periods cover the entire term, so the first `start` will match the term `start`, the last `end` will match the term `end`, and the last `party` (and `caucus` if present) will match the term `party` (and `caucus`).
	* url: The official website URL of the legislator (only valid if the term is current).
	* address: The mailing address of the legislator's Washington, D.C. office (only valid if the term is current, otherwise the last known address).
	* phone: The phone number of the legislator's Washington, D.C. office (only valid if the term is current, otherwise the last known number).
	* fax: The fax number of the legislator's Washington, D.C. office (only valid if the term is current, otherwise the last known number).
	* contact_form: The website URL of the contact page on the legislator's official website (only valid if the term is current, otherwise the last known URL).
	* office: Similar to the address field, this is just the room and building number, suitable for display (only valid if the term is current, otherwise the last known office).
	* rss_url The URL to the official website's RSS feed (only valid if the term is current, otherwise the last known URL).







This is scratch code:

File | Download | Description
---- | -------- | -----------
`legislators-historical` | [YAML](https://theunitedstates.io/congress-legislators/legislators-historical.yaml) [JSON](https://theunitedstates.io/congress-legislators/legislators-historical.json) [CSV](https://theunitedstates.io/congress-legislators/legislators-historical.csv) | Historical Members of Congress (i.e. all Members of Congress except those in the current file).
`legislators-social-media` | [YAML](https://theunitedstates.io/congress-legislators/legislators-social-media.yaml) [JSON](https://theunitedstates.io/congress-legislators/legislators-social-media.json) | Current social media accounts for Members of Congress. Official accounts only (no campaign or personal accounts).
`committees-current` | [YAML](https://theunitedstates.io/congress-legislators/committees-current.yaml) [JSON](https://theunitedstates.io/congress-legislators/committees-current.json) | Current committees of the Congress, with subcommittees.
`committee-membership-current` | [YAML](https://theunitedstates.io/congress-legislators/committee-membership-current.yaml) [JSON](https://theunitedstates.io/congress-legislators/committee-membership-current.json) | Current committee/subcommittee assignments.
