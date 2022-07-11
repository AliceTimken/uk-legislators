################### ---------------------------------
# Collect Twitter Accounts for UK MPs
# 7/11/2022

# This file includes code for:
# 1. Loading R packages
# 2. Collecting UK legislator list and MP Twitter accounts
# 3. Matching MPs to their Twitter accounts 
# 4. Loading MP Twitter list into R and collect User IDs


# Load R packages
# ----------------------------------------------------

# install.packages("rtweet")
library(rtweet)

# rvest webscrape package
library(rvest)

# install.packages("tidyverse")
library(tidyverse)

# install.packages("academictwitteR")
# library(academictwitteR)



# Collect UK legislator Twitter data
# ----------------------------------------------------

# create list members from UK MPS Twitter list curated by @TwitterGov: 
# https://twitter.com/i/lists/217199644
df.tw_uklist <- lists_members("217199644") # 539 accounts (of 650)
# For list related commands in rtweet package see: https://cloud.r-project.org/web/packages/rtweet/rtweet.pdf

# write csv of twitter list for 
# write.csv(df.tw_uklist, "~/Desktop/tw_commons.csv", row.names=FALSE)

# Take a look at the data
head(df.tw_uklist)
# the name column will be used to match twitter handles to MPs
head(df.tw_uklist$name)
# view all column names
colnames(df.tw_uklist)

# Clean the Twitter account names for matching
df.tw_uklist$name <- gsub(" MP", "", df.tw_uklist$name) # clear MP title
df.tw_uklist$name <- gsub("Dr ", "", df.tw_uklist$name) # clear Dr title
df.tw_uklist$name <- gsub("Rt Hon ", "", df.tw_uklist$name) # clear honorable title
df.tw_uklist$name <- gsub(" MSP", "", df.tw_uklist$name) # clear MSP title
df.tw_uklist$name <- gsub("Sir ", "", df.tw_uklist$name) # clear Sir title
df.tw_uklist$name <- gsub(" BL", "", df.tw_uklist$name) # clear BL title
df.tw_uklist$name <- gsub(" CBE", "", df.tw_uklist$name) # clear CBE title
df.tw_uklist$name <- gsub(" SNP", "", df.tw_uklist$name) # clear SNP title

# Webscrape UK legislator list from wikipedia (elected 2019)
# ----------------------------------------------------

# Load house of commons members from wikipedia
# https://en.wikipedia.org/wiki/List_of_MPs_elected_in_the_2019_United_Kingdom_general_election
# See the official list here:

# read website
wikipedia <-read_html(
  "https://en.wikipedia.org/wiki/List_of_MPs_elected_in_the_2019_United_Kingdom_general_election")
class(wikipedia)

# locate the table component of the html
table <- html_node(wikipedia, xpath = '//*[@id = "elected-mps"]//tbody')
# create mp list using html table
df.uk_commons <- html_table(table)

# Take a look at the data
head(df.uk_commons)
colnames(df.uk_commons)
# clean extra columns (due to wiki formatting)
#remove columns in position 2 and 5
df.uk_commons <- df.uk_commons %>% select(-2, -5)

# rename columns
colnames(df.uk_commons) <- c("constituency", "party_before", "name", "party_member", "notes")

# write csv of MP list  
# write.csv(df.uk_commons, "~/Desktop/uk_commons.csv", row.names=FALSE)

# Take a look at the data
head(df.uk_commons)
# view columns
colnames(df.uk_commons)





# Match MPs to Twitter accounts (by name)
# ----------------------------------------------------

# create "name" variable in df.ca_commons by combining first and last name
# df.ca_commons$name <-paste(df.ca_commons$first_name, df.ca_commons$last_name, sep=" ")

# df.ca_commons$merged <- match(df.ca_commons$name, df.tw_commons$name, nomatch = 0)
# write.csv(df.ca_commons, "~/Desktop/df.ca_commons.csv", row.names=FALSE)

# Merge and match Twitter screen name
df.uk_commons$screen_name <- df.tw_uklist$screen_name[match(df.uk_commons$name, df.tw_uklist$name)]

# Merge and match Twitter used id
df.uk_commons$user_id <- df.tw_uklist$user_id[match(df.uk_commons$name, df.tw_uklist$name)]

# Track merged users
df.tw_uklist$merged <- df.uk_commons$name[match(df.tw_uklist$name, df.uk_commons$name)]
# write csv
write.csv(df.tw_uklist, "~/Desktop/uk_twlist.csv", row.names=FALSE)

# write csv of merged mp list  
write.csv(df.uk_commons, "~/Desktop/uk_legislators.csv", row.names=FALSE)

# complete the remaining empty twitter account information by hand
# official MP list and twitter accounts (or personal MP websites) are available on the UK Parliament website
# https://members.parliament.uk/members/commons?SearchText=&PartyId=&Gender=Any&ForParliament=0&ShowAdvanced=False


# Handcoding issues:

# Issue with MP rows:
# 1. Daniel Kawczynski has an account managed by staff, which was not included. @OfKawczynski
# 2. Chesham and Amersham is represented twice because its MP died in 2021 and was replaced by Sarah Green.
# 3. Bill Wiggin's account appears his own but includes no tweets and is not verified. @BillWigginMP
# 4. Damien Moore's twitter account was deactivated but was included. @damienmooremp
# 5. Southend West is represented twice because its MP died in 2021 and was replaced by Anna Firth.
# 6. David Warburton's twitter account was deactivated but was included. @djwarburton
# 7. Ian Paisley's twitter account was deactivated but was included. @ianpaisleymp
# 8. Wakefield is represented twice because its MP was found guilty of crime in 2022 and was replaced by Simon Lightwood.
# 9. James Cartlidge's account as listed on the UK gov's website is inactive, instead I have included an active but unverified account @jcartlidgemp.
# 10. Jonathan Edwards' twitter account was deactivated but was included. @JonathanPlaid
# 11. Jonathan Gullis's twitter account was temporarily restricted but was included. @jegullis
# 12. Jonathan Gullis's twitter account was deactivated but was included. @Maria_MillerMP
# 13. Hartlepool is represented twice because its MP resigned in 2021 and was replaced by Jill Mortimer.
# 14. Hartlepool is represented twice because its MP resigned in 2022 and was replaced by Richard Foord.
# 15. Richard Bacon has an unverified and mostly inactive account, which was included. @richardbaconmp
# 16. Batley and Spen is represented twice because its MP stood down in 2021 and was replaced by Kim Leadbeater.
# 17. Adam Holloway has an unverified and mostly inactive account, which was included. @AdamHollowayMP


# "none" if a reputable source tags one or more MPs with Twitter accounts and names an MP without citing their account.
# Example reputable accounts are new media and APPG parlimentary groups.

# once list is complete, load it into R.

# the complete list as of 7/8/2022 can be found at __.





# Load complete MP Twitter list into R and collect Tweets
# ----------------------------------------------------
df.uk_legislators <- read.csv("~/Desktop/uk_legislators.csv")

# get Twitter account information on MP users using screen names
mp_users <- lookup_users(df.uk_legislators$screen_name)
# clean mp_users for merge by making all screen names lower case
mp_users$screen_name_case <- tolower(mp_users$screen_name)
unique(mp_users$screen_name_case) # 598 unique

# clean df.uk_legislators data frame for merge
# exclude user_id (column 7)
df.legislators_clean <- df.uk_legislators[ -c(7) ]
# exclude mps without twitter accounts ("none")
df.legislators_clean <- df.legislators_clean[df.legislators_clean$screen_name != "none", ]
# make all screen names lower case
df.legislators_clean$screen_name_case <- tolower(df.legislators_clean$screen_name)

# merge legislators_clean and mp_users data frames by screen name
df.uk_legislators_full <- merge(df.legislators_clean, mp_users, by="screen_name_case")

# full twitter list
# write.csv(df.uk_legislators_full, "~/Desktop/uk_legislators_full.csv", row.names=FALSE)
save(df.uk_legislators_full, file = "uk_legislators_full.RData")


# this set of MP twitter accounts were collected on 7/8/2022.



# end of file

