#include <iostream>
#include <stdlib.h>
#include <stdio.h>
#include <fstream>
#include <string>

using namespace std;

int main(int argc, char* argv[]) {
	string line;
	ifstream myfile("100.0.requests.172.20.36.138.txt");
	ofstream of("request_output.txt");
	int num_proto = 4;
	int max_num_requests = atoi(argv[1]);
	double time;

	if (myfile.is_open()) {
		int times_to_reach;
		myfile >> times_to_reach;
		for (int k = 0; k < max_num_requests; ++k) {
			string garbage;
			myfile >> garbage;
			for (int i = 0; i < num_proto; ++i) {
				double result = 0;
				for (int j = 0; j < times_to_reach; ++j) {
					myfile >> time;
					result += time;
				}
				of << result/times_to_reach << " ";
			}
			of << endl;
		}
	}
	else {
		cout << "Unable to open file" << endl;
	}
	return 0;
}
