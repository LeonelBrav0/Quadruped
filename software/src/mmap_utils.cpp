#include <iostream>
#include <sys/mman.h>
#include <unistd.h>
#include <fcntl.h>
#include "mmap_utils.h"

uint32_t* mapMemory(int devmem, uint32_t base, uint32_t size) 
{
    const uint32_t pageSize = sysconf(_SC_PAGESIZE);
    uint32_t offset = base % pageSize;
    base -= offset;
    size += offset;

    void* mappedBase = mmap(nullptr, size, PROT_READ | PROT_WRITE, MAP_SHARED, devmem, base);
    if (mappedBase == MAP_FAILED) 
    {
        perror("mmap");
        exit(EXIT_FAILURE);
    }

    return reinterpret_cast<uint32_t*>(reinterpret_cast<char*>(mappedBase) + offset);
}

int open_devmem()
{
    int devmem = open("/dev/mem", O_RDWR | O_SYNC);
    if (devmem == -1)
    {
        std::cerr << "[ERROR] Failed to open /dev/mem" << std::endl;
        exit(EXIT_FAILURE);
    }
    else
    {
        std::cout << "[INFO] /dev/mem opened val: " << std::hex << devmem << std::endl;
        return devmem;
    }
}