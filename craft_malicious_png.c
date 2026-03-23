#include <stdio.h>
#include <stdlib.h>
#include <png.h>

void craft_malicious_png(char *output_filename, char *payload_name) {
    FILE *fp = fopen(output_filename, "wb");
    if (!fp) {
        perror("File opening failed");
        return;
    }

    png_structp png = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
    png_infop info = png_create_info_struct(png);

    if (setjmp(png_jmpbuf(png))) {
        fprintf(stderr, "Error during PNG creation\n");
        fclose(fp);
        return;
    }

    png_init_io(png, fp);

    // Setting basic image properties (100x100 pixels)
    png_set_IHDR(png, info, 100, 100, 8, PNG_COLOR_TYPE_RGB,
                 PNG_INTERLACE_NONE, PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);

    png_write_info(png, info);

    // Create some dummy image data
    png_bytep row = (png_bytep) malloc(3 * 100 * sizeof(png_byte));
    for (int y = 0; y < 100; y++) {
        png_write_row(png, row);
    }

    // --- Cleanup logic from your screenshot ---
    png_write_end(png, NULL);
    fclose(fp);
    
    // Free memory
    free(row);
    png_destroy_write_struct(&png, &info);

    printf("[+] Malicious PNG created: %s using payload: %s\n", output_filename, payload_name);
}

int main(int argc, char *argv[]) {
    // FIX: Changed '≠' to '!=' 
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <output_image> <payload>\n", argv[0]);
        return 1;
    }

    craft_malicious_png(argv[1], argv[2]);

    return 0;
}
