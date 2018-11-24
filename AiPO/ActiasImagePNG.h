#pragma once
#include <string>
#include <fstream>
#include <iostream>

class ImagePNG {
	int width;
	int height;
	int bit_depth;
	int colour_type;
	int compression_method;
	int filter_method;
	int interlace_method;
public:
	ImagePNG();
	ImagePNG(std::string);
	int read_image(std::string);
};