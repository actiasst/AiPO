#include "ActiasImagePNG.h"

ImagePNG::ImagePNG(){
	position_next = 0;
	position_prev = 0;
}

ImagePNG::ImagePNG(std::string path) {
	read_image(path);
}

int ImagePNG::read_image(std::string path) {
	std::ifstream file(path, std::ios::in | std::ios::binary | std::ios::beg);
	std::ifstream *file_pointer = &file;
	if (file.is_open()) {
		read_to_memblock(8,file_pointer);
		if (memblock[0] != 137 || memblock[1] != 80 || memblock[2] != 78 || memblock[3] != 71 ||
			memblock[4] != 13 || memblock[5] != 10 || memblock[6] != 26 || memblock[7] != 10) {
			std::cout << "This is not PNG file." << std::endl;
			return -1;
		}

		read_to_memblock(4,file_pointer);
		for (int i = 0; i < 4; i++)
			std::cout << (int)memblock[i] << std::endl;

		file.close();
	}
	else {
		std::cout << "Unable to open file" << std::endl;
		return -1;
	}
	std::cout << "Image has been read succesfully." << std::endl;
	return 0;
}

unsigned int ImagePNG::mergeBytes(int a, int b, int c, int d) {
	return (((((a << 8) | b) << 8) | c) << 8) | d;
}

void ImagePNG::read_to_memblock(int size,std::ifstream* file_pointer) {
	delete[] memblock;
	this->size = size;
	memblock = new unsigned char[size];
	position_prev = position_next;
	position_next += size;
	file_pointer->seekg(position_prev);
	file_pointer->read((char*)memblock, this->size);
}