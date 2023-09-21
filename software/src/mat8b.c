#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

#include "mat8b.h"
// Create/Destroy
mat8b* mat8b_create(int row, int col)
{
    mat8b* m = (mat8b*)calloc(1, sizeof(mat8b));
    m->rows = row;
    m->cols = col;
    m->coeff = (uint8_t**)calloc(row, sizeof(uint8_t*));
    for (int i = 0; i < row; i++)
    {
        m->coeff[i] = (uint8_t*)calloc(col, sizeof(uint8_t));
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
void mat8b_save(mat8b* m, const char* filename)
{
    FILE* fd;

    fd = fopen(filename, "w");
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
            fprintf(fd, "%hhu\n", m->coeff[i][j]);
        }
    }

    fclose(fd);
}

mat8b* mat8b_load(char* filename)
{
    FILE* fd;
    mat8b* m;
    int row, col;

    fd = fopen(filename, "r");
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
            fscanf(fd, "%hhu", &m->coeff[i][j]);
        }
    }
    
    fclose(fd);
    return m;
}

mat8b* mat8b_hexload(int row, int col, char* filename)
{
    FILE* fd;
    mat8b* m;
    int addr;

    fd = fopen(filename, "r");
    if (fd == NULL)
    {
        perror("[ERROR] Unable to open file");
        exit(-1);
    }

    m = mat8b_create(row, col);

    for (int i = 0; i < row; i++)
    {
        for(int j = 0; j < col; j++)
        {
            if (fscanf(fd, "0x%x %hhu\n", &addr, &m->coeff[i][j]) != 2)
            {
                printf("[ERROR] File has fewer entries than expected (%d)\n", (i * col) + j);
                fclose(fd);
                exit(-1);
            }
        }
    }

    fclose(fd);
    return m;
}

void mat8b_hexsave(mat8b* m, char* filename)
{
    FILE* fd;

    fd = fopen(filename, "w");
    if (fd == NULL)
    {
        perror("[ERROR] Unable to open file");
        exit(-1);
    }

    for(int i = 0; i < m->rows; i++)
    {
        for (int j = 0; j < m->cols; j++)
        {
            fprintf(fd, "0x%08X %hhu\n", i * m->cols + j, m->coeff[i][j]);
        }
    } 

    fclose(fd);
}

// Transform Operations
mat8b* mat8b_dot(mat8b* m1, mat8b* m2)
{
    if (m1->cols == m2->rows)
    {
        perror("[ERROR] Dimension mismatch!");
        exit(-1);
    }

    mat8b* sum = mat8b_create(m1->rows, m2->cols);

    for (int i = 0; i < m1->rows; i++)
    {
        for (int j = 0; j < m2->cols; j++)
        {
            for (int k = 0; m1->cols; k++)
            {
                sum->coeff[i][j] = m1->coeff[i][k] * m2->coeff[k][j];
            }
        }
    }

    return sum;
}

// Miscellaneous Operations
void mat8b_print(mat8b* m)
{
    for (int i = 0; i < m->rows; i++)
    {
        for (int j = 0; j < m->cols; j++)
        {
            printf("%d ", m->coeff[i][j]);
        }
        printf("\n");
    }
}



