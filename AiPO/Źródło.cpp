#include <iostream>
#include <fstream>

using namespace std;

int main() {
	streampos size;
	unsigned char * memblock;


	ifstream file("1.png", ios::in | ios::binary | ios::ate);
	/*if (file.is_open())
	{
	size = file.tellg();
	memblock = new char[size];
	file.seekg(0, ios::beg);
	file.read(memblock, size);
	file.close();

	cout << "the entire file content is in memory" << endl;
	cout << (int) memblock[0] << endl;
	delete[] memblock;
	}
	else cout << "Unable to open file" << endl;*/

	if (file.is_open()) {
		size = 12;
		memblock = new unsigned char[size];
		file.seekg(0, ios::beg);
		file.read((char*)memblock, size);
		for (int i = 0; i < size; i++)
			cout << (int)memblock[i] << endl;

		size = 4;
		cout << endl;
		file.seekg(8);
		unsigned char * memblock2 = new unsigned char[size];
		file.read((char*)memblock2, size);
		for (int i = 0; i < size; i++)
			cout << (int)memblock2[i] << endl;

		cout << endl;
		file.seekg(12);
		unsigned char * memblock3 = new unsigned char[size];
		file.read((char*)memblock3, size);
		for (int i = 0; i < size; i++)
			cout << (int)memblock3[i] << endl;

		cout << endl;
		file.seekg(16);
		unsigned char * memblock4 = new unsigned char[size];
		file.read((char*)memblock4, size);
		for (int i = 0; i < size; i++)
			cout << (int)memblock4[i] << endl;

		file.close();

		file.close();
	}
	else
		cout << "Unable to open file" << endl;


	/*int a = 23, b = 10;
	unsigned long int c;
	c = (a << 8) | b;
	cout << c << endl;*/

	system("pause");
}

//test 2