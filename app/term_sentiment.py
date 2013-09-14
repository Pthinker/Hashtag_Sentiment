import sys
import json

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

def main():
    sent_file = sys.argv[1]
    tweet_file = sys.argv[2]
    
    term_score = get_term_score(sent_file)

    new_term_score = {}
    with open(tweet_file) as fh:
        for line in fh:
            line = line.strip()
            tweet_json = json.loads(line)
            if 'text' in tweet_json:
                text = tweet_json['text']
                sent_score = compute_sentiment_score(term_score, text)
                arr = text.split()
                for term in arr:
                    if not term.lower() in term_score:
                        if term in new_term_score:
                            new_term_score[term]['score'] += sent_score / float(len(arr))
                            new_term_score[term]['count'] += 1
                        else:
                            new_term_score[term] = {}
                            new_term_score[term]['score'] = sent_score / float(len(arr))
                            new_term_score[term]['count'] = 1
    for term in new_term_score:
        print term, " ", new_term_score[term]['score'] / new_term_score[term]['count']

if __name__ == '__main__':
    main()
