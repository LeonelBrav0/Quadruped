#ifndef MMAP_UTILS_H
#define MMAP_UTILS_H

uint32_t* mapMemory(int devmem, uint32_t base, uint32_t size); 
int open_devmem();
#endif 