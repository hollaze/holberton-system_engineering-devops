#!/usr/bin/python3
""" top ten """
import requests


def top_ten(subreddit):
    """ prints the titles of the first 10 hot
    posts listed for a given subreddit """
    url = 'https://www.reddit.com/r/{}/hot.json?limit=10'.format(
        subreddit)  # programming
    user_agent = {'User-Agent': 'userAgent'}

    r = requests.get(url, headers=user_agent, allow_redirects=False)

    if r.status_code == 200:
        for title in r.json()['data']['children']:
            print(title['data']['title'])
    else:
        print(None)
