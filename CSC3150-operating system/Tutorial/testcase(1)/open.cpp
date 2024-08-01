#include <iostream>
#include <fcntl.h>
#include <unistd.h>

int main() {
    int fd = open("example.txt", O_CREAT , 0666);
    
    if (fd == -1) {
        perror("open");
        return 1;
    }

    std::cout << "File opened successfully!" << std::endl;

    close(fd);
    return 0;
}
