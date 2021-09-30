#!/usr/bin/python3
""" get tasks done from chosen employee id """
import requests
from sys import argv


url_todos = 'https://jsonplaceholder.typicode.com/users/{}/todos'.format(
    argv[1])
employee_name = requests.get('https://jsonplaceholder.typicode.com/users/{}'
                             .format(argv[1])).json()['name']

r_todos = requests.get(url_todos)

count_done_tasks = 0
count_total_tasks = 0
tasks_titles = []

for task in r_todos.json():
    count_total_tasks += 1
    if task['completed']:
        tasks_titles.append(task['title'])
        count_done_tasks += 1

print("Employee {:s} is done with task({:d}/{:d}):".format(
    employee_name, count_done_tasks, count_total_tasks))

for title in tasks_titles:
    print("\t{}".format(title))
