#!/usr/bin/python3
import cv2
from matplotlib import pyplot as plt
import matplotlib
import sys
import os
import argparse
import numpy as np

def partition_images(imgLeft, imgRight, block_size):
    partitions_left = []
    partitions_right = []

    height, width = imgLeft.shape

    for y in range(0, height, block_size):
        for x in range(0, width, block_size):
            block_left = imgLeft[y:y+block_size, x:x+block_size]
            block_right = imgRight[y:y+block_size, x:x+block_size]

            if block_left.shape == (block_size, block_size) and block_right.shape == (block_size, block_size):
                partitions_left.append(block_left)
                partitions_right.append(block_right)

    return partitions_left, partitions_right


def parse_args(argv):
    parser = argparse.ArgumentParser(description="PROJECT Q Python Model")
    parser.add_argument('-plt', help=" -plt <--Enable Plot")
    args = parser.parse_args()
    return args

def read_stereo_images():
    imgLeft = cv2.imread("datasets/tsukaba_l.png", cv2.IMREAD_GRAYSCALE)
    imgRight = cv2.imread("datasets/tsukaba_r.png", cv2.IMREAD_GRAYSCALE)
    imgLeft = cv2.resize(imgLeft, (656, 496))
    imgRight = cv2.resize(imgRight, (656, 496))

    return imgLeft, imgRight

def plot_stereo_images(imLeft, imRight):
    plt.figure(figsize=(10,5))
    plt.subplot(1,2,1)
    plt.imshow(imLeft)
    plt.axis('off')
    plt.subplot(1,2,2)
    plt.imshow(imRight)
    plt.axis('off')    
    plt.show()     

def main(argv):
    args = parse_args(argv)
    imLeft, imRight = read_stereo_images()
    partitions_left, partitions_right = partition_images(imLeft, imRight, 16)
    if partitions_left and partitions_right:
        print("Shape of the first partitioned block:")
        print("Left:", partitions_left[0].shape)
        print("Right:", partitions_right[0].shape)
        print("Num Partitions:", len(partitions_left))
    if (args.plt):
        plot_stereo_images(imLeft, imRight)
        
    print(partitions_left[0][2][0])
if __name__ == "__main__":
    main(sys.argv)