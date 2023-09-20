#pragma once

#include "project_properties.h"


namespace hw_ov7670_src_ns
{

void read_frame(const char* filename, char frame_buffer[]);
void partition_into_blocks(char frame_buffer[], char blocks[][FRAME_WIDTH / BLOCK_SIZE * BLOCK_SIZE * BLOCK_SIZE]);
}
