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

		read_to_memblock(4, file_pointer);
		chunk_size = merge_bytes(memblock[0], memblock[1], memblock[2], memblock[3]);

		read_to_memblock(4,file_pointer);
		if (memblock[0] != 73 || memblock[1] != 72 || memblock[2] != 68 || memblock[3] != 82) {
			std::cout << "File is corupted" << std::endl;
			return -1;
		}
		else
			IHDR(file_pointer);
		//wczytanie CRC do odczytu nie potrzbne
		read_to_memblock(4, file_pointer);

		read_to_memblock(4, file_pointer);
		chunk_size = merge_bytes(memblock[0], memblock[1], memblock[2], memblock[3]);
		read_to_memblock(4, file_pointer);
		std::string tmp_name = merge_name((char)memblock[0], (char)memblock[1], (char)memblock[2], (char)memblock[3]);
		std::cout << chunk_size << std::endl << tmp_name << std::endl;
		read_to_memblock(1, file_pointer);
		std::cout << (int)memblock[0] << std::endl;

		read_to_memblock(14, file_pointer);

		for (int i = 0; i < size; i++)
			std::cout << (int)memblock[i] << std::endl;
		std::cout << std::endl;

		file.close();
	}
	else {
		std::cout << "Unable to open file" << std::endl;
		return -1;
	}
	std::cout << "Image has been read succesfully." << std::endl;
	return 0;
}

unsigned int ImagePNG::merge_bytes(int a, int b, int c, int d) {
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
	/*for (int i = 0; i < size; i++)
		std::cout << (int)memblock[i] << std::endl;
	std::cout<<std::endl;*/
}

void ImagePNG::description() {
	std::cout << "Description" << std::endl;
	std::cout << "Width " << width << std::endl;
	std::cout << "Height " << height << std::endl;
	std::cout << "Bit depth " << bit_depth << std::endl;
	std::cout << "Colour type " << colour_type << std::endl;
	std::cout << "Compression method " << compression_method << std::endl;
	std::cout << "Filter method " << filter_method << std::endl;
	std::cout << "Interlace method " << interlace_method << std::endl;
	std::cout << std::endl;
}

void ImagePNG::IHDR(std::ifstream* file_pointer) {
	read_to_memblock(4, file_pointer);
	width = merge_bytes(memblock[0], memblock[1], memblock[2], memblock[3]);
	read_to_memblock(4, file_pointer);
	height = merge_bytes(memblock[0], memblock[1], memblock[2], memblock[3]);
	read_to_memblock(5, file_pointer);
	bit_depth = memblock[0];
	colour_type = memblock[1];
	compression_method = memblock[2];
	filter_method = memblock[3];
	interlace_method = memblock[4];
}

std::string ImagePNG::merge_name(char a, char b, char c, char d){
	std::string tmp = "    ";
	tmp[0] = a;
	tmp[1] = b;
	tmp[2] = c;
	tmp[3] = d;
	return tmp;
}