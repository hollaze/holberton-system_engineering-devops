#!/usr/bin/python3
""" export data into csv file """
import csv
import requests
import sys


if __name__ == "__main__":
    todos = requests.get('https://jsonplaceholder.typicode.com/users/{}/todos'
                         .format(sys.argv[1]))
    username = requests.get('https://jsonplaceholder.typicode.com/users/{}'
                        .format(sys.argv[1])).json()['username']

    with open('{}.csv'.format(sys.argv[1]), 'w', newline='') as file_name:
        write = csv.writer(file_name, quoting=csv.QUOTE_ALL)
        [write.writerow([sys.argv[1], username, task['completed'], task['title']]
                        ) for task in todos.json()]
