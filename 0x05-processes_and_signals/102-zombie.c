#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>

/**
 * infinite_while - usefull to be able to see the zombies
 * Return: 0
 */

int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - create 5 zombies to see them: ps aux | grep -e 'Z+.*<defunct>'
 * Return: 0
 */

int main(void)
{
	int i;

	for (i = 0; i < 5; i++)
	{
		if (fork() > 1)
		{
			printf("Zombie process created, PID: %d\n", getpid());
			sleep(1);
		}
		else
			exit(0);
	}
	infinite_while();
	return (0);
}
