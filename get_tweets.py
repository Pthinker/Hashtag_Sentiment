#!/usr/bin/env python

import twitter
import MySQLdb

import config


api = twitter.Api(consumer_key=config.TWITTER_CONSUMER_KEY,
		  consumer_secret=config.TWITTER_CONSUMER_SECRET,
		  access_token_key=config.TWITTER_ACCESS_TOKEN,
		  access_token_secret=config.TWITTER_ACCESS_TOKEN_SECRET)
#api.VerifyCredentials()

db = MySQLdb.connect("localhost", config.DB_USER, config.DB_PWD, config.DATABASE)
cursor = db.cursor()

for hashtag in config.HASHTAGS:
	tweets = []
	tweets.extend(api.GetSearch(hashtag, lang='en', count=10))

	for tweet in tweets:
		insert_query = """
			insert into tweets (hashtag, handle, profile_img, text) 
			values
			(%s, %s, %s, %s)
			"""
		cursor.execute(insert_query, (hashtag, tweet.user.screen_name, tweet.user.profile_image_url, tweet.text.encode('utf-8')))

db.commit()
cursor.close()
db.close()

