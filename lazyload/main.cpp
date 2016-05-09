#include <iostream>
#include <string>

int main ( int argc, char **argv )
{
    using namespace std;

    string line;
    while ( getline( cin, line ) ) {
        bool hitImg = false; 
        int beg = -1, end = -1;
        int cur = 0, len = line.length();
        cout << line << endl;
        while ( cur < len ) {
            if ( line.at(cur) == 'i' ) {
                if ( cur+1 < len && line.at(cur+1) == 'm' && 
                     cur+2 < len && line.at(cur+2) == 'g' &&
                     cur+3 < len && line.at(cur+2) == ' ' &&
                     cur+4 < len && line.at(cur+2) == 's' &&
                     cur+5 < len && line.at(cur+2) == 'r' &&
                     cur+6 < len && line.at(cur+2) == 'r' &&
                     cur+5 < len && line.at(cur+2) == 'r' &&
                     cur+5 < len && line.at(cur+2) == 'r' ) {
                }
            }
            ++cur;
        }
    }

    return 0;
}