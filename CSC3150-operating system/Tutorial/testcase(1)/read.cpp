#include <iostream>
#include <fcntl.h>
#include <unistd.h>

int main() {
    int fd = open("example.txt", O_RDONLY);

    if (fd == -1) {
        perror("open");
        return 1;
    }

    char buffer[100];
    ssize_t bytesRead = read(fd, buffer, sizeof(buffer));

    if (bytesRead == -1) {
        perror("read");
        close(fd);
        return 1;
    }

    std::cout << "Read " << bytesRead << " bytes: " << buffer << std::endl;

    close(fd);
    return 0;
}
