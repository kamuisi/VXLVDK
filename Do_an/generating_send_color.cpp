#include <iostream>
#include <queue>
#include <fstream>
using namespace std;
int main()
{
    vector<vector<int>> RGB(3, vector<int>(8, 0));
    char buff[9];
    for(int i = 0; i < 3; i++)
    {
        cin.get(buff, 9);
        for(int j = 0; j < 8; j++)
        {
            RGB[i][j] = (int)buff[j] - (int)'0';
        }
    }
    ofstream file;
    file.open("sus.txt", ofstream::out | ofstream::trunc);
    for(int i = 0; i < 3; i++)
    {
        for(int j = 0; j < 8; j++)
        {
           if(RGB[i][j] == 1)
           {
                file << "\tsetb P2.2\n" << "\tnop\n" << "\tclr P2.2\n";
           }
           else
           {
                file << "\tsetb P2.2\n" << "\tclr P2.2\n" << "\tnop\n";
           }
        }
    }
    file.close();
    return 0;


}