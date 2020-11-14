#include <iostream>

using namespace std;

void arrayAndPointersOfIntegersExample() {
    int arraySize = 10;
    int someArray[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

    int *pLocation6 = &someArray[6];
    int *pLocation0 = &someArray[0];

    cout << "pLocation6 = " << pLocation6 << endl;
    cout << "pLocation0 = " << pLocation0 << endl;
    cout << "Difference = " << pLocation6 - pLocation0 << endl;
    cout << endl;

    for (int i = 0; i < arraySize; ++i) {
        // by incrementing the array location
        cout << someArray + i << "=" << *(someArray + i) << endl;

        // by incrementing the pointer
        cout << pLocation0 << "=" << *pLocation0 << endl;
        pLocation0++;
    }

    cout << endl;
}

void stringPointersExample() {
    char someString[] = "Hello";
    char *pSomeString = someString;

    cout << "pSomeString = " << pSomeString << endl;

    char *pLocation3 = &someString[3];
    char *pLocation0 = &someString[0];

    cout << "pLocation3 = " << pLocation3 << endl;
    cout << "pLocation0 = " << pLocation0 << endl;
    cout << "Difference = " << pLocation3 - pLocation0 << endl;
}

int main() {
    arrayAndPointersOfIntegersExample();
    stringPointersExample();

    return 0;
}
