#include <iostream>
#include <fcntl.h>
#include <unistd.h>
#include <cstring>

int main() {
    int fd = open("example.txt", O_WRONLY | O_APPEND);

    if (fd == -1) {
        perror("open");
        return 1;
    }

    const char* message = "Hello, System Call!";
    ssize_t bytesWritten = write(fd, message, strlen(message));

    if (bytesWritten == -1) {
        perror("write");
        close(fd);
        return 1;
    }

    std::cout << "Wrote " << bytesWritten << " bytes to the file." << std::endl;

    close(fd);

    return 0;
}
