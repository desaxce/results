#include <iostream>
#include <stdlib.h>
#include <stdio.h>
#include <fstream>
#include <string>
#include <vector>

using namespace std;

int main(int argc, char* argv[]) {
	string line;
	ifstream myfile(argv[1]);
	string output_file_name = "output_" + (string) argv[1];
	ofstream of(output_file_name.c_str());
	int num_proto = 4;
	int max_num_pages = atoi(argv[2]);
	double time;
	vector<double> ratios;

	if (myfile.is_open()) {
		int times_to_reach;
		myfile >> times_to_reach;
		for (int k = 0; k < max_num_pages; ++k) {
			string html;
			myfile >> html;
			of << html << " ";
			double ratio = 0;
			for (int i = 0; i < num_proto; ++i) {
				double result = 0;
				double divide = times_to_reach;
				for (int j = 0; j < times_to_reach; ++j) {
					myfile >> time;
					result += time;
					if (time == 0) {
						divide--;
					}
				}
				of << result/divide << " ";
				if (i==0) {
					ratio+=divide/result;
				}
				if (i==2) {
					ratio*=result/divide;
				}
			}
			ratios.push_back(ratio);
			of << endl;
		}
	}
	else {
		cout << "Unable to open file" << endl;
	}
	double mean_ratio = 0;
	for (vector<double>::iterator it = ratios.begin(); it != ratios.end(); ++it) {
		mean_ratio += *it;
	}
	printf("mean_ratio = %lf\n", mean_ratio/ratios.size());
	return 0;
}
