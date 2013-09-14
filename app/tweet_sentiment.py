#!/usr/bin/env python

def get_term_score(sent_fpath):
	term_score = {} 
	with open(sent_fpath) as fh:
		for line in fh:
			term, score = line.strip().split("\t")
			term_score[term] = int(score)
	return term_score

def compute_sentiment_score(term_score, tweet):
	score = 0.0
	arr = tweet.split()
	for word in arr:
		if word in term_score:
			score += term_score[word]
	return score

def sentiment(tweets):
	sent_file = "word.txt"
	term_score = get_term_score(sent_file)
	
	scores = []
	for tweet in tweets:
		scores.append(compute_sentiment_score(term_score, tweet))

	return scores


if __name__ == '__main__':
    pass
