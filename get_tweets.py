#!/usr/bin/env python

import twitter
import MySQLdb
import time

import config


api = twitter.Api(consumer_key=config.TWITTER_CONSUMER_KEY,
		  consumer_secret=config.TWITTER_CONSUMER_SECRET,
		  access_token_key=config.TWITTER_ACCESS_TOKEN,
		  access_token_secret=config.TWITTER_ACCESS_TOKEN_SECRET)
#api.VerifyCredentials()

db = MySQLdb.connect("localhost", config.DB_USER, config.DB_PWD, config.DATABASE)
cursor = db.cursor()

hashtags = []
hashtags.extend(config.DC_HASHTAGS)
hashtags.extend(config.SMITH_HASHTAGS)

for hashtag in hashtags:
    tweets = []
    tweets.extend(api.GetSearch(hashtag, lang='en', count=100))
	
    for tweet in tweets:
        query = "SELECT COUNT(1) FROM tweets WHERE tweet_id=%s" % (tweet.id)
        cursor.execute(query)
        if cursor.fetchone()[0]:
            continue
        else:
            insert_query = """
			    insert into tweets (tweet_id, hashtag, handle, profile_img, text, created_at) 
			    values
			    (%s, %s, %s, %s, %s, %s)
			    """
            ts = time.strftime('%Y-%m-%d %H:%M:%S', time.strptime(tweet.created_at, '%a %b %d %H:%M:%S +0000 %Y'))
            cursor.execute(insert_query, (tweet.id, hashtag, tweet.user.screen_name, 
                tweet.user.profile_image_url, tweet.text.encode('utf-8'), ts))

db.commit()
cursor.close()
db.close()

