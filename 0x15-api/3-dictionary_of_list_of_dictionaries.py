#!/usr/bin/python3
""" export data into json file from api """
import json
import requests

if __name__ == "__main__":
    todos = requests.get(
        "https://jsonplaceholder.typicode.com/todos/").json()
    users = requests.get(
        "https://jsonplaceholder.typicode.com/users/").json()

    dict = {user['id']: [{
        "username": user['username'],
        "task": task['title'],
        "completed": task['completed']} for task in todos] for user in users}

    with open("todo_all_employees.json", 'w') as file:
        json.dump(dict, file)
