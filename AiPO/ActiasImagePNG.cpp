#include "ActiasImagePNG.h"

ImagePNG::ImagePNG(){
	position_next = 0;
	position_prev = 0;
	sRGB = -1;
	gAMA = -1;
	pHYs_X = -1;
	pHYs_Y = -1;
	pHYs_unit_specifier = -1;
	year = -1;
	month = -1;
	day = -1;
	hour = -1;
	minute = -1;
	second = -1;
}

ImagePNG::ImagePNG(std::string path) {
	position_next = 0;
	position_prev = 0;
	sRGB = -1;
	gAMA = -1;
	pHYs_X = -1;
	pHYs_Y = -1;
	pHYs_unit_specifier = -1;
	year = -1;
	month = -1;
	day = -1;
	hour = -1;
	minute = -1;
	second = -1;
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
		else {
			IHDR(file_pointer);
			//wczytanie CRC do odczytu nie potrzbne
			read_to_memblock(4, file_pointer);
		}

		for(int i = 0; i < 7; i++)
			read_chunk(file_pointer);
		
		read_to_memblock(20, file_pointer);
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
	std::cout << "sRGB " << sRGB << std::endl;
	std::cout << "gAMA " << gAMA << std::endl;
	std::cout << "pHYs_X " << pHYs_X << std::endl;
	std::cout << "pHYs_Y " << pHYs_Y << std::endl;
	std::cout << "pHYs_unit_specifier " << pHYs_unit_specifier << std::endl;
	std::cout << "Date " << year << ":" << month << ":" << day << " " << hour << ":" << minute << ":" << second << std::endl;
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

void ImagePNG::read_chunk(std::ifstream* file_pointer) {
	read_to_memblock(4, file_pointer);
	chunk_size = merge_bytes(memblock[0], memblock[1], memblock[2], memblock[3]);
	read_to_memblock(4, file_pointer);
	std::string tmp_name = merge_name((char)memblock[0], (char)memblock[1], (char)memblock[2], (char)memblock[3]);
	if (tmp_name == "sRGB")
		call_sRGB(file_pointer);
	else if (tmp_name == "gAMA")
		call_gAMA(file_pointer);
	else if (tmp_name == "pHYs")
		call_pHYs(file_pointer);
	else if (tmp_name == "tIME")
		call_tIME(file_pointer);
	else if (tmp_name == "tEXt")
		call_tEXT(file_pointer);
	//wczytanie CRC do odczytu nie potrzbne
	read_to_memblock(4, file_pointer);
}

void ImagePNG::call_sRGB(std::ifstream* file_pointer) {
	std::cout << "sRGB" << std::endl;
	read_to_memblock(chunk_size, file_pointer);
	sRGB = (int)memblock[0];
}

void ImagePNG::call_gAMA(std::ifstream* file_pointer) {
	std::cout << "gAMA" << std::endl;
	read_to_memblock(chunk_size, file_pointer);
	gAMA = merge_bytes((int)memblock[0], (int)memblock[1], (int)memblock[2], (int)memblock[3]);
}

void ImagePNG::call_pHYs(std::ifstream* file_pointer) {
	std::cout << "pHYs" << std::endl;
	read_to_memblock(chunk_size, file_pointer);
	pHYs_X = merge_bytes((int)memblock[0], (int)memblock[1], (int)memblock[2], (int)memblock[3]);
	pHYs_Y = merge_bytes((int)memblock[4], (int)memblock[5], (int)memblock[6], (int)memblock[7]);
	pHYs_unit_specifier = (int)memblock[8];
}

void ImagePNG::call_tIME(std::ifstream* file_pointer) {
	std::cout << "tIME" << std::endl;
	read_to_memblock(chunk_size, file_pointer);
	year = merge_bytes(0, 0, (int)memblock[0], memblock[1]);
	month = (int)memblock[2];
	day = (int)memblock[3];
	hour = (int)memblock[4];
	minute = (int)memblock[5];
	second = (int)memblock[6];
}

void ImagePNG::call_tEXT(std::ifstream* file_pointer) {
	std::cout << "tEXt" << std::endl;
	read_to_memblock(chunk_size, file_pointer);
	for (int i = 0; i < chunk_size; i++)
		std::cout << (char)memblock[i];
	std::cout << std::endl;
}