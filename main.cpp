#include <stdio.h>
#include <stdlib.h>
#include <string.h>	
#include <stdint.h>

#define NAME "output.bmp"

typedef uint8_t  BYTE; 

extern "C" int encode128(unsigned char *dest_bitmap, int bar_width, char *text);

int main()
{
    FILE *file;
	BYTE *dest_bitmap;
  	
	unsigned long fileLenght;
	
	
	file = fopen(NAME, "rb");

	if (!file)
	{
		fprintf(stderr, "Cannot open the file %s\n", NAME);
		return 1;
	}

	fseek(file, 0, SEEK_END);

	fileLenght = ftell(file);

	fseek(file, 0, SEEK_SET);

	dest_bitmap=(BYTE *)malloc(fileLenght+1);

	if (!dest_bitmap)
	{
		fprintf(stderr, "Memory crashed!\n");
        fclose(file);
		return 2;
	}
	
	fread(dest_bitmap, fileLenght, 1, file);
	fclose(file);

	//Moving the header
	BYTE* bmp = dest_bitmap + 54; 

	//Scan line
	int scan_line = 25;


	char text[16];

	fgets(text, 16, stdin);
	
	if(text == NULL)
	{
		fprintf(stderr, "Memory crashed!\n");
		fclose(file);
		return 2;
	}

	encode128(bmp, scan_line, text);

	
		printf("Encoded: %s \n ", text);

    	free(dest_bitmap);
	
	return 0;
}

