from flask import Flask, session, flash, request, g
from flask import redirect, url_for, render_template
import MySQLdb
import time
import socket
import os
import sys
reload(sys)
sys.setdefaultencoding('utf-8')

import tweet_sentiment

app = Flask(__name__)

parentdir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, parentdir)
app.config.from_object('config')


@app.route('/')
@app.route('/index')
def index():
	hashtags = app.config['HASHTAGS']
	hashtags = [h.strip("#") for h in hashtags]	
	return render_template('index.html', hashtags=hashtags)

@app.route('/detail', methods=['GET'])
def detail():
	hashtag = request.args.get('hashtag', None)
	if hashtag is None:
		abort(404)
	else:
		hashtag = "#" + hashtag
		cursor = g.db.cursor()
		cursor.execute('select handle, profile_img, text from tweets where hashtag="%s"' % (hashtag))
		rows = cursor.fetchall()
		tweets = []
		for row in rows:
			tweets.append({'handle':row[0], 'img':row[1], 'text':row[2]})
		cursor.close()

		scores = tweet_sentiment.sentiment([tweet['text'] for tweet in tweets])
		pos = 0
		neg = 0
		for i in range(len(tweets)):
			tweets[i]['score'] = scores[i]
			if scores[i] > 0.0:
				pos += 1
			elif scores[i] < 0.0:
				neg += 1
		if pos+neg == 0:
			perc = [0.0, 0.0]
		else:
			perc = ["%.2f"%(pos/float(pos+neg)*100.0), "%.2f"%(neg/float(pos+neg)*100.0)]
		
		return render_template('detail.html', hashtag=hashtag, tweets=tweets, perc=perc)

@app.before_request
def db_connect():
	g.db = MySQLdb.connect("localhost", "admin", "admin", "sentiment")

@app.teardown_request
def db_disconnect(exception=None):
	g.db.close()
    
if __name__ == "__main__":
	if socket.gethostbyname(socket.gethostname()).startswith('192'):
		app.run(host='0.0.0.0', port=5000, debug=True)
	else:
		app.run(debug=True)

