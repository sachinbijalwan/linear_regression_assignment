#include<iostream>
#include<fstream>
#include<random>
#include<ctime>
#include<cstdlib>
#include<bits/stdc++.h>
using namespace std;
int main(){

string filename="linregdata.txt";
fstream file1;//(filename);
fstream file2;

file1.open("linregdata.txt");
if(!file1){
        string line;
getline(file1,line);
    cout<<"doesn't exist"<<endl;
    exit(1);
}
//getline(file1,filename);
//cout<<filename<<endl;
vector<string> lines;
//vector<streampos> pointer(90000);
int j=0;
//cout<<lines.size()<<endl;
while(!file1.eof()){
	//pointer.push_back(file1.tellp());
	string line;
	getline(file1,line);
	lines.push_back(line);
//	cout<<"line running "<<lines[j-1]<<endl;
//	cout<<endl<<endl<<endl;
//	lines.push_back(getline(file1,lines[j++]));
}
//cout<<"value of j"<<j;
srand((unsigned)time(0));
float frac=0.2;
vector<string> positive,negative;
float positive_count=1,negative_count=1;
for(int i=0;!lines.empty();i++){
    if(positive_count/(positive_count+negative_count)<frac){
            int z=rand()%lines.size();
        positive.push_back(lines[z]);
        lines.erase(lines.begin()+z);
        positive_count++;
    }
    else{
          int z=rand()%lines.size();
        negative.push_back(lines[z]);
        lines.erase(lines.begin()+z);
        negative_count++;
    }

}
file1.close();
file1.open("train.txt",ios::out);
file2.open("test.txt",ios::out);
for(int i=0;i<positive.size();i++)
{
    file1<<positive[i]<<endl;
}
for(int i=0;i<negative.size();i++)
{
    file2<<negative[i]<<endl;
}
/*int positive_count=0,negative_count=0;
vector<int> numbers;
vector<string> positive,negative;
for(int i=0;i<lines.size();i++){
    int z;
    z = (rand()%25000)+1;
    bool enter=true;
    for(int k=0;k<numbers.size();k++){
    	if(numbers[k]==z)
    		enter=false;
    }
    if(!enter)
    	continue;
    numbers.push_back(z);
    //cout<<lines[z][0]<<endl;
    istringstream ss(lines[z]);
    int num=0;
    ss>>num;
    if(positive.size()<500 && num>=7){
    	positive.push_back(lines[z]);
    	cout<<lines[z]<<endl<<endl<<endl;
    }
    else if(negative.size()<500 && num<=4){
    	negative.push_back(lines[z]);
    }
  //  cout<<z<<endl;
    //file1.seekg(pointer[z]);
    //getline(file1,lines[i]);
    //cout <<lines[i]  << "\n";
    //cout<<endl<<endl<<endl<<endl;
}

file1.close();
filename="subset.txt";
file1.open(filename,fstream::out);
for(int i=0;i<500;i++){
	file1<<positive[i]<<"\n"<<negative[i]<<"\n";

}
file1.close();
file1.open(filename);
string str;
int count=0;
while(getline(file1,str)){
    istringstream ss(str);
    int num;
    ss>>num;
    if(num>=7)
        count++;
}
cout<<count<<endl;*/
file1.close();
return 0;
}
