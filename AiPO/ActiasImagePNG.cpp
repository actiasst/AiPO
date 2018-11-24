#include "ActiasImagePNG.h"

ImagePNG::ImagePNG(){}

ImagePNG::ImagePNG(std::string path) {
	read_image(path);
}

int ImagePNG::read_image(std::string path) {
	std::streampos size;
	unsigned char * memblock;
	std::ifstream file(path, std::ios::in | std::ios::binary | std::ios::beg);

	if (file.is_open()) {
		size = 8;
		memblock = new unsigned char[size];
		unsigned int chunk_size;
		file.read((char*)memblock, size);
		if (memblock[0] != 137 || memblock[1] != 80 || memblock[2] != 78 || memblock[3] != 71 ||
			memblock[4] != 13 || memblock[5] != 10 || memblock[6] != 26 || memblock[7] != 10) {
			std::cout << "This is not PNG file." << std::endl;
			return -1;
		}

		delete[] memblock;
		size = 4;
		memblock = new unsigned char[size];
		file.seekg(8);
		file.read((char*)memblock, size);
		for (int i = 0; i < size; i++)
			std::cout << (int)memblock[i] << std::endl;

		std::cout << std::endl;
		file.seekg(12);
		unsigned char * memblock3 = new unsigned char[size];
		file.read((char*)memblock3, size);
		for (int i = 0; i < size; i++)
			std::cout << (int)memblock3[i] << std::endl;

		std::cout << std::endl;
		file.seekg(16);
		unsigned char * memblock4 = new unsigned char[size];
		file.read((char*)memblock4, size);
		for (int i = 0; i < size; i++)
			std::cout << (int)memblock4[i] << std::endl;

		file.close();

		file.close();
	}
	else {
		std::cout << "Unable to open file" << std::endl;
		return -1;
	}
	std::cout << "Image has been read succesfully." << std::endl;
	return 0;
}