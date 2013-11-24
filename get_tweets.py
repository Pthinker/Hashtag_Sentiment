#!/usr/bin/env python

import twitter
import MySQLdb
import time
from datetime import datetime
import pytz

import config


api = twitter.Api(consumer_key=config.TWITTER_CONSUMER_KEY,
		  consumer_secret=config.TWITTER_CONSUMER_SECRET,
		  access_token_key=config.TWITTER_ACCESS_TOKEN,
		  access_token_secret=config.TWITTER_ACCESS_TOKEN_SECRET)
#api.VerifyCredentials()

term_score = {}
with open("app/word.txt") as fh:
    for line in fh:
        term, score = line.strip().split("\t")
        term_score[term] = int(score)

def compute_sentiment_score(tweet):
    score = 0.0
    arr = tweet.split()
    for word in arr:
        if word in term_score:
            score += term_score[word]
    return score

db = MySQLdb.connect("localhost", config.DB_USER, config.DB_PWD, config.DATABASE)
cursor = db.cursor()

hashtags = []
hashtags.extend(config.DC_HASHTAGS)
hashtags.extend(config.GWU_HASHTAGS)

count = 0
pos_count = 0
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
            text = tweet.text.encode('utf-8')
            ts = time.strftime('%Y-%m-%d %H:%M:%S', time.strptime(tweet.created_at, '%a %b %d %H:%M:%S +0000 %Y'))
            cursor.execute(insert_query, (tweet.id, hashtag, tweet.user.screen_name, 
                tweet.user.profile_image_url, text, ts))
            
            count += 1
            if compute_sentiment_score(text) > 0.0:
                pos_count += 1
            
if count == 0:
    perc = 0.0
else:
    perc = float(pos_count) / count

utc = pytz.timezone('UTC')
eastern = pytz.timezone('US/Eastern')
utcdt = utc.localize(datetime.today())
eastdt = utcdt.astimezone(eastern)

insert_query = """
    insert into sentiment_history (logged_at, hour, pos_perc) 
	values
    (%s, %s, %s)
"""
cursor.execute(insert_query, (eastdt.strftime('%Y-%m-%d'), eastdt.hour, perc*100.0))


db.commit()
cursor.close()
db.close()

