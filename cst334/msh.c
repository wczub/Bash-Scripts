/* Will Czubiak
 * CST 334
 * September 20, 2015
 */



#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <errno.h>

/*
* A very simple shell
*/

#define MAX_BUF 160
#define MAX_TOKS 100

int main(int argc, char *argv[]) {
	char *pos;
	char *tok;
	char s[MAX_BUF];
	char *toks[MAX_TOKS];
	time_t rawtime;
	struct tm *timeinfo;
	static const char prompt[] = "msh> ";
	char * HOME[] = {getenv("HOME")};
	char * status;
	int file_run = 0;

	while (1) {
	
		//Checks if user enterd file name, opens it and parses it		
		if (argc == 2 && file_run == 0){
			FILE *fp;
			fp = fopen(*(argv + 1), "r");
			
			status = fgets(s, MAX_BUF - 1, (FILE*)fp);
			
			file_run = 1;

		//exits the program if the file has already been run
		} else if (file_run == 1){
			exit(1);
		} else {
	
		/* prompt for input */
		printf(prompt);

		/* read input */
		status = fgets(s, MAX_BUF - 1, stdin);
		
		}

		/* exit if ^d or "exit" entered */
		if (status == NULL || strcmp(s, "exit\n") == 0) {
			if (status == NULL) {
				printf("\n");
			}
			exit(EXIT_SUCCESS);
		}

		/* remove any trailing newline */
		if ((pos = strchr(s, '\n')) != NULL) {
			*pos = '\0';
		}

		/* break input line into tokens */
		char *rest = s;
		int i = 0;
		while ((tok = strtok_r(rest, " ", &rest)) != NULL && i < MAX_TOKS) {
			toks[i] = tok;
			i++;
		}
		if (i == MAX_TOKS) {
			fprintf(stderr, "main: too many tokens");
			exit(EXIT_FAILURE);
		}
		toks[i] = NULL;

		/* do nothing if no tokens found in input */
		if (i == 0) {
			continue;
		}

		/* if a shell built-in command, then run it */
		if (strcmp(toks[0], "help") == 0) {
			printf("enter a Linux command, or 'exit' to quit\n");
			continue;
		}
		if (strcmp(toks[0], "today") == 0) {
			time(&rawtime);
			timeinfo = localtime(&rawtime);
			printf("Current local time: %s", asctime(timeinfo));
			continue;
		}
		

		/* otherwise fork a process to run the command */
		int rc = fork();
		if (rc < 0) {
			fprintf(stderr, "fork failed\n");
			exit(1);
		}
		if (rc == 0) {
			//Makes sure child wont run the cd command
			if (strcmp(toks[0], "cd") != 0){
				/* child process: run the command indicated by toks[0] */
				execvp(toks[0], toks);
				/* if execvp returns than an error occurred */
				printf("msh: %s: %s\n", toks[0], strerror(errno));
			}
			exit(1);

		}
		else {
			//Either changes directory to HOME or user specified location
			if (i == 1 && (strcmp(toks[0], "cd") == 0)){
				chdir(*HOME);
			}else if (strcmp(toks[0], "cd") == 0){
				chdir(toks[1]);
			}
		
			// wait for command to finish running
			wait(NULL);
			
		}
	}
}
