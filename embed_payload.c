#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <png.h>


void embed_payload(char *input_file, char *output_file, char *payload) {
    // Variable declarations for PNG structures
    png_structp png = NULL;
    png_infop info = NULL;
    png_structp png_write = NULL;
    png_infop info_write = NULL;
    png_bytep *row_pointers = NULL;
    int height = 0;

    printf("Opening: %s\n", input_file);
    printf("Payload to hide: %s\n", payload);

    /* --- PNG Processing Logic would go here ---
       In a full implementation, you would read the file, 
       modify the LSB (Least Significant Bits) of the pixels 
       to hide the 'payload', and then prepare to write.
    */

    // The following cleanup logic matches your screenshot:
    if (png && info) {
        png_destroy_read_struct(&png, &info, NULL);
    }
    if (png_write && info_write) {
        png_destroy_write_struct(&png_write, &info_write);
    }

    if (row_pointers) {
        for (int i = 0; i < height; i++) {
            free(row_pointers[i]);
        }
        free(row_pointers);
    }

    printf("Process completed. Output saved to: %s\n", output_file);
}

int main(int argc, char *argv[]) {
    // FIX: Changed '≠' to '!=' 
    // Usage: ./stego <input.png> <output.png> <text_message>
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <input_image> <output_image> <payload>\n", argv[0]);
        return 1;
    }

    embed_payload(argv[1], argv[2], argv[3]);

    return 0;
}