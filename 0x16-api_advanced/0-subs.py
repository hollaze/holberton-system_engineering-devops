#!/usr/bin/python3
""" number of subscribers """
import requests


def number_of_subscribers(subreddit):
    """ catch number of subscriber from chosen subreddit """
    url = 'https://www.reddit.com/r/{}/about.json'.format(subreddit) # programming
    user_agent = {'User-Agent': 'Holberton Agent'}

    r = requests.get(url, headers=user_agent, allow_redirects=False)

    if r.status_code == 200:
        return r.json()['data']['subscribers']
    else:
        return 0
