#!/usr/bin/python3
""" hot list """
import requests


def recurse(subreddit, hot_list=[], after=''):
    """ number of hot articles """
    url = 'https://www.reddit.com/r/{}/hot.json'.format(
        subreddit)  # programming
    user_agent = {'User-Agent': 'userAgent'}
    param = {'after': after}

    r = requests.get(url, headers=user_agent,
                     params=param, allow_redirects=False)

    if r.status_code == 404:
        return (None)
    elif after is None:
        return
    else:
        for title in r.json()['data']['children']:
            hot_list.append(title['data']['title'])
        after = r.json()['data']['after']
        recurse(subreddit, hot_list, after)
        return hot_list
