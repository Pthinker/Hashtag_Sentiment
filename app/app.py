from flask import Flask, session, flash, request, g
from flask import redirect, url_for, render_template
import MySQLdb
import time
import os
import sys
reload(sys)
sys.setdefaultencoding('utf-8')

app = Flask(__name__)

parentdir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, parentdir)
app.config.from_object('config')


@app.route('/')
@app.route('/index')
def index():
	return render_template('index.html', hashtags=app.config['HASHTAGS'])

@app.route('/detail', methods=['GET'])
def detail():
	hashtag = request.args.get('hashtag', None)
	if hashtag is None:
		abort(404)
	else:
		cursor = g.db.cursor()
		cursor.execute('select handle, profile_img, text from tweets where hashtag="%s"' % (hashtag))
		rows = cursor.fetchall()
		tweets = []
		for row in rows:
			tweets.append({'handle':row[0], 'img':row[1], 'text':row[2]})
		cursor.close()
		return render_template('detail.html', hashtag=hashtag, tweets=tweets)

@app.before_request
def db_connect():
	g.db = MySQLdb.connect("localhost", "admin", "admin", "sentiment")

@app.teardown_request
def db_disconnect(exception=None):
	g.db.close()
    
if __name__ == "__main__":
	app.run(debug=True)

