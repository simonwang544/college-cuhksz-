#include <iostream>
#include <sys/wait.h>
#include <unistd.h>

int main() {
    pid_t pid = fork();

    if (pid == -1) {
        perror("Error occured for fork operation");
        return 1;
    }

    if (pid == 0) {
        // Child process
        std::cout << "Child process executing..." << std::endl;
        sleep(3); // Simulate some work
        std::cout << "Child process completed." << std::endl;
    } else {
        // Parent process
        int status;
        // pid_t childPid = waitpid(pid, &status, 0);
        pid_t childPid = wait(&status);

        if (childPid == -1) {
            perror("Child process did not execute normally.");
            return 1;
        }
// https://www.ibm.com/docs/en/ztpf/1.1.0.15?topic=zca-wifexitedquery-status-see-if-child-process-ended-normally
        if (WIFEXITED(status)) { 
            std::cout << "Child process exited with status: " << WEXITSTATUS(status) << std::endl;
        } else {
            std::cout << "Child process did not exit normally." << std::endl;
        }
    }

    return 0;
}
