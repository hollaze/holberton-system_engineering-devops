#!/usr/bin/python3
""" export data into json file from api """
import json
import requests
import sys

if __name__ == "__main__":
    user_id = sys.argv[1]
    todos = requests.get(
        "https://jsonplaceholder.typicode.com/users/{:s}/todos".format(
            user_id)).json()
    username = requests.get(
        "https://jsonplaceholder.typicode.com/users/{:s}".format(
            user_id)).json()['username']

    with open("{:s}.json".format(user_id), 'w') as file:
        json.dump({user_id: [{
            "task": task['title'],
            "completed": task['completed'],
            "username": username} for task in todos]}, file)
