#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <png.h>

void embed_data(const char *input, const char *output, const char *data) {
    FILE *ifp = fopen(input, "rb");
    FILE *ofp = fopen(output, "wb");

    if (!ifp || !ofp) {
        perror("[!] Error opening files");
        exit(1);
    }

    // Basic PNG structure handling
    png_structp png_ptr = png_create_read_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
    png_infop info_ptr = png_create_info_struct(png_ptr);
    png_init_io(png_ptr, ifp);
    png_read_info(png_ptr, info_ptr);

    png_structp out_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
    png_infop out_info = png_create_info_struct(out_ptr);
    png_init_io(out_ptr, ofp);

    // Simple text chunk injection for the payload
    png_set_IHDR(out_ptr, out_info, png_get_image_width(png_ptr, info_ptr),
                png_get_image_height(png_ptr, info_ptr),
                png_get_bit_depth(png_ptr, info_ptr),
                png_get_color_type(png_ptr, info_ptr),
                PNG_INTERLACE_NONE, PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
    
    png_text text_ptr[1];
    text_ptr[0].key = "Description";
    text_ptr[0].text = (char *)data;
    text_ptr[0].compression = PNG_TEXT_COMPRESSION_NONE;
    png_set_text(out_ptr, out_info, text_ptr, 1);

    png_write_info(out_ptr, out_info);
    
    // Copy image data logic here...
    // (Simplified for brevity - ensure your full row-copy logic is here)

    png_write_end(out_ptr, NULL);
    
    // CRITICAL: Close files and flush to disk
    fflush(ofp); 
    fclose(ifp);
    fclose(ofp);
    
    printf("[+] Successfully saved to: %s\n", output);
}

int main(int argc, char *argv[]) {
    if (argc < 4) return 1;
    embed_data(argv[1], argv[2], argv[3]);
    return 0;
}
