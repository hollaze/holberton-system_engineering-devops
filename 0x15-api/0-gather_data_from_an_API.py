#!/usr/bin/python3
""" get tasks done from chosen employee id """

if __name__ == "__main__":
    import requests
    import sys

    url_todos = 'https://jsonplaceholder.typicode.com/users/{}/todos'.format(
        sys.argv[1])
    name = requests.get('https://jsonplaceholder.typicode.com/users/{}'
                        .format(sys.argv[1])).json()['name']

    r_todos = requests.get(url_todos)

    count_done_tasks = 0
    count_total_tasks = 0
    tasks_titles = []

    for task in r_todos.json():
        count_total_tasks += 1
        if task['completed']:
            tasks_titles.append(task['title'])
            count_done_tasks += 1

    print("Employee {:s} is done with tasks({:d}/{:d}):".format(
        name, count_done_tasks, count_total_tasks))

    for title in tasks_titles:
        print("\t{}".format(title))
