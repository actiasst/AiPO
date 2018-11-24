#pragma once
#include <string>
#include <fstream>
#include <iostream>

class ImagePNG {
	unsigned int width;
	unsigned int height;
	int bit_depth;
	int colour_type;
	int compression_method;
	int filter_method;
	int interlace_method;
	std::streampos size;
	unsigned char * memblock;
	unsigned int chunk_size;
	int position_prev;
	int position_next;
	void read_to_memblock(int,std::ifstream*);
	void IHDR(std::ifstream*);
	unsigned int merge_bytes(int, int, int, int);
	std::string merge_name(char, char, char, char);
public:
	ImagePNG();
	ImagePNG(std::string);
	int read_image(std::string);
	void description();
};