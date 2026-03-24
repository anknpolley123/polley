#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    if (argc < 4) {
        printf("Usage: %s <input> <output> <payload>\n", argv[0]);
        return 1;
    }

    FILE *ifp = fopen(argv[1], "rb");
    FILE *ofp = fopen(argv[2], "wb");
    
    if (!ifp || !ofp) {
        perror("[!] File error");
        return 1;
    }

    // 1. Copy the original image data to the new file
    char buffer[1024];
    size_t bytes;
    while ((bytes = fread(buffer, 1, sizeof(buffer), ifp)) > 0) {
        fwrite(buffer, 1, bytes, ofp);
    }

    // 2. Append a secret marker and the payload at the end
    fprintf(ofp, "\n/*PAYLOAD_START*/\n%s\n/*PAYLOAD_END*/\n", argv[3]);

    fclose(ifp);
    fclose(ofp);

    printf("[+] Process completed. Output saved to: %s\n", argv[2]);
    return 0;
}
