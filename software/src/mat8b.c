#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

#include "mat8b.h"
// Create/Destroy
mat8b* mat8b_create(int row, int col)
{
    mat8b* m = (mat8b*)malloc(sizeof(mat8b));
    m->rows = row;
    m->cols = col;
    m->coeff = (uint8_t**)malloc(row * sizeof(uint8_t*));
    for (int i = 0; i < row; i++)
    {
        m->coeff[i] = (uint8_t*)malloc(col * sizeof(uint8_t));
    }

    return m;
}

void mat8b_destroy(mat8b* m)
{
    for (int i = 0; i < m->rows; i++)
    {
        free(m->coeff[i]);
    }
    free(m);
    m = NULL;
}

// I/O Operations
void mat8b_save(mat8b* m, char* filename)
{
    FILE* fd;

    fd = fopen(filename, 'w');
    if (fd == NULL)
    {
        perror("[ERROR] ");
        exit(-1);
    }

    fprintf(fd, "%d,%d\n", m->rows, m->cols);
    for (int i = 0; i < m->rows; i++)
    {
        for (int j = 0; j < m->cols; j++)
        {
            fprintf(fd, "%d\n", m->coeff[i][j]);
        }
    }

}

mat8b* mat8b_load(char* filename)
{
    FILE* fd;
    mat8b* m;
    int row, col;

    fd = fopen(filename, 'r');
    if (fd == NULL)
    {
        perror("[ERROR] ");
        exit(-1);
    }

    fscanf(fd, "%d,%d\n", &row, &col);
    m = mat8b_create(row, col);

    for (int i = 0; i < row; i++)
    {
        for(int j = 0; j < col; j++)
        {
            fscanf(fd, "%d\n", &m->coeff[i][j]);
        }
    }
    
    return m;
}

// Transform Operations
mat8b* mat8b_dot(mat8b* m1, mat8b* m2);

// Miscellaneous Operations
void mat8b_print(mat8b* m)
{

}



