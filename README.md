# Illumination-Resilient Lane Detection by Threshold Self-Adjustment Using Newton-Based Extremum Seeking

This project uses extremum seeking (ES) method for lane detection tasks. Lane detection is performed in the hue/saturation/value (HSV) color space, without the need of edge-detection algorithms, filters, or post-processing. This method is based entirely on the color information of lane marks, and ES is introduced to deal with the illumination variation. For detailed problem formulation and ES explanation, we refer the reader to read our paper.

## Paper

For a full description of the algorithm itself and the lane detection resuls from both a simulation environment and a harware implementation, please refer to the paper.

If you find this repository useful, please do cite the paper:

```
@article{zhou2022illumination,
  title={Illumination-Resilient Lane Detection by Threshold Self-Adjustment Using Newton-Based Extremum Seeking},
  author={Zhou, Yujing and Wang, Zejiang and Wang, Junmin},
  journal={IEEE Transactions on Intelligent Transportation Systems},
  year={2022},
  publisher={IEEE}
}
```

## Primary Contributor

The primary contributor is Yujing "Bryant" Zhou, an incoming Ph.D. student at Princeton University. If you have specific questions about this repository, please post an issue.

## Language

MATLAB and Simulink are primarily used for this project. A minimum version of MATLAB-R-2020-a is required.

The [QUARC](https://www.quanser.com/products/quarc-real-time-control-software/) real-time control software is required to run the Simulink files for simulation tests.

A scaled car developed by Quanser, named [QCar](https://www.quanser.com/products/qcar/), is required to run the hardware tests.

## File Description

### Clustering

Algorithms in this folder compare the images taken indoor and outdoor. Detail is included in Section IV of the paper.

### Hardware Code

Algorithms in this folder are the lane detection implementation to the harware.

### Simulation Code

Algorithms in this folder are the lane detection implementation with collected video data from the hardware.

## Data

Some collected video in the MATLAB data format can be accessed from [here](https://drive.google.com/drive/folders/1aHT1F-vsleInBYi2nPzVcfSRCEN7BSEg?usp=sharing)

