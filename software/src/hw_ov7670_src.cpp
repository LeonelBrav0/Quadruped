#include <stdio.h>
#include <stdlib.h>

#include "hw_ov7670_src.h"
#include "project_properties.h"

namespace hw_ov7670_src_ns
{



void read_frame(const char* filename, char frame_buffer[])
{
    FILE *fd = fopen(filename, "r");
    if (fd == NULL) {
        perror("Failed to open file");
    }

    int hexValue, decValue;
    int index = 0;

    for (int i = 0; i < FRAME_WIDTH * FRAME_HEIGHT; i++)
    {
        if (fscanf(fd, "0x%x %d\n", &hexValue, &decValue) == 2)
        {
            frame_buffer[i] = (char)hexValue;
            frame_buffer[i] = (char)decValue;
        }
    }

}

void partition_into_blocks(char frame_buffer[], char blocks[][FRAME_WIDTH / BLOCK_SIZE * BLOCK_SIZE * BLOCK_SIZE]) 
{
    for (int block_row = 0; block_row < FRAME_HEIGHT / BLOCK_SIZE; block_row++) {
        for (int block_col = 0; block_col < FRAME_WIDTH / BLOCK_SIZE; block_col++) {
            for (int i = 0; i < BLOCK_SIZE; i++) {
                for (int j = 0; j < BLOCK_SIZE; j++) {
                    int x = block_col * BLOCK_SIZE + j;
                    int y = block_row * BLOCK_SIZE + i;
                    int linear_index = y * FRAME_WIDTH + x;
                    int block_index = i * BLOCK_SIZE + j;
                    blocks[block_row * (FRAME_WIDTH / BLOCK_SIZE) + block_col][block_index] = frame_buffer[linear_index];
                }
            }
        }
    }
}


}
