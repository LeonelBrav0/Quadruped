/*
*   MATRIX 8 BIT COEFFICIENTS LIBRARY
*
*/

#ifndef MAT8B_H
#define MAT8B_H

#ifdef __cplusplus
extern "C" {
#endif


#include <stdio.h>
#include <stdint.h>

typedef struct mat8b{
    uint8_t ** coeff;
    int rows;
    int cols;
} mat8b;

// Create/Destroy
mat8b* mat8b_create(int row, int col);
void mat8b_destroy(mat8b* m);

// I/O Operations
void mat8b_save(mat8b* m, const char* filename);
mat8b* mat8b_load(char* filename);
mat8b* mat8b_hexload(int row, int col, char* filename);
void mat8b_hexsave(mat8b* m, char* filename);

// Transform operations
mat8b* mat8b_dot(mat8b* m1, mat8b* m2);

// Miscellaneous Operations
void mat8b_print(mat8b* m);

#ifdef __cplusplus
}
#endif

#endif // MAT8B_H



