% DIPUM Toolbox.
% Version 2.0.2  27-May-2012  
%
% MATLAB functions from the book Digital Image Processing Using MATLAB, by
% R.C. Gonzalez, R.E. Woods, and S.L. Eddins, Gatesmark Publishing, 2009.
% Book web site: http://www.imageprocessingplace.com
% Publisher web site: http://www.gatesmark.com/DIPUM2e.htm
%
% Release information.
%   Readme         - Information about current and previous versions.
%
% Image display and exploration.
%   ice            - Interactive Color Editor.
%   rgbcube        - Displays an RGB cube on the MATLAB desktop.
%
% Image file I/O
%   movie2tifs     - Creates a multiframe TIFF file from a MATLAB movie.
%   seq2tifs       - Creates a multi-frame TIFF file from a MATLAB sequence.
%   tifs2movie     - Create a MATLAB movie from a multiframe TIFF file.
%   tifs2seq       - Create a MATLAB sequence from a multi-frame TIFF file.
%
% Geometric transformations.
%   imtransform2   - 2-D image transformation with fixed output location.
%   pixeldup       - Duplicates pixels of an image in both directions.
%   pointgrid      - Points arranged on a grid.
%   reprotate      - Rotate image repeatedly.
%   vistform       - Visualization transformation effect on set of points.
%
% Image registration.
%   visreg         - Visualize registered images.
%
% Pixel values and statistics.
%   localmean      - Computes an array of local means.
%   statmoments    - Computes statistical central moments of image histogram.
%
% Image analysis.
%   bayesgauss     - Bayes classifier for Gaussian patterns.
%   bound2eight    - Convert 4-connected boundary to 8-connected boundary.
%   bound2four     - Convert 8-connected boundary to 4-connected boundary.
%   bound2im       - Converts a boundary to an image.
%   boundarydir    - Determine the direction of a sequence of planar points.
%   bsubsamp       - Subsample a boundary.
%   colorgrad      - Computes the vector gradient of an RGB image.
%   colorseg       - Performs segmentation of a color image.
%   connectpoly    - Connects vertices of a polygon.
%   cornerprocess  - Processes the output of function cornermetric.
%   diameter       - Measure diameter and related properties of image regions.
%   fchcode        - Computes the Freeman chain code of a boundary.
%   frdescp        - Computes Fourier descriptors.
%   ifrdescp       - Computes inverse Fourier descriptors.
%   im2minperpoly  - Minimum perimeter polygon.
%   imstack2vectors - Extracts vectors from an image stack.
%   invmoments     - Compute invariant moments of image.
%   localthresh    - Local thresholding.
%   mahalanobis    - Computes the Mahalanobis distance.
%   movingthresh   - Image segmentation using a moving average threshold.
%   otsuthresh     - Otsu's optimum threshold given a histogram.
%   polyangles     - Computes internal polygon angles.
%   principalcomps - Principal-component vectors and related quantities.
%   randvertex     - Adds random noise to the vertices of a polygon.
%   regiongrow     - Perform segmentation by region growing.
%   signature      - Computes the signature of a boundary.
%   specxture      - Computes spectral texture of an image.
%   splitmerge     - Segment an image using a split-and-merge algorithm.
%   statxture      - Computes statistical measures of texture in an image.
%   strsimilarity  - Computes a similarity measure between two strings.
%   x2majoraxis    - Aligns coordinate x with the major axis of a region.
%
% Image compression.
%   compare        - Computes and displays the error between two matrices.
%   cv2tifs        - Decodes a TIFS2CV compressed image sequence.
%   huff2mat       - Decodes a Huffman encoded matrix.
%   huffman        - Builds a variable-length Huffman code for a symbol source.
%   im2jpeg        - Compresses an image using a JPEG approximation.
%   im2jpeg2k      - Compresses an image using a JPEG 2000 approximation.
%   imratio        - Computes the ratio of the bytes in two images/variables.
%   jpeg2im        - Decodes an IM2JPEG compressed image.
%   jpeg2k2im      - Decodes an IM2JPEG2K compressed image.
%   lpc2mat        - Decompresses a 1-D lossless predictive encoded matrix.
%   mat2huff       - Huffman encodes a matrix.
%   mat2lpc        - Compresses a matrix using 1-D lossles predictive coding.
%   ntrop          - Computes a first-order estimate of the entropy of a matrix.
%   quantize       - Quantizes the elements of a UINT8 matrix.
%   showmo         - Displays the motion vectors of a compressed image sequence.
%   tifs2cv        - Compresses a multi-frame TIFF image sequence.
%   unravel        - Decodes a variable-length bit stream.
%
% Image enhancement.
%   adpmedian      - Perform adaptive median filtering.
%   gscale         - Scales the intensity of the input image.
%   intrans        - Performs intensity (gray-level) transformations.
%
% Image noise.
%   imnoise2       - Generates an array of random numbers with specified PDF.
%   imnoise3       - Generates periodic noise.
%
% Linear filtering.
%   dftfilt        - Performs frequency domain filtering.
%   spfilt         - Performs linear and nonlinear spatial filtering.
%
% Linear 2-D filter design.
%   bandfilter     - Computes frequency domain band filters.
%   cnotch         - Generates circularly symmetric notch filters.
%   hpfilter       - Computes frequency domain highpass filters.
%   lpfilter       - Computes frequency domain lowpass filters.
%   recnotch       - Generates rectangular notch (axes) filters.
%
% Fuzzy logic.
%   aggfcn         - Aggregation function for a fuzzy system.
%   approxfcn      - Approximation function.
%   bellmf         - Bell-shaped membership function.
%   defuzzify      - Output of fuzzy system.
%   fuzzyfilt      - Fuzzy edge detector.
%   fuzzysysfcn    - Fuzzy system function.
%   implfcns       - Implication functions for a fuzzy system.
%   lambdafcns     - Lambda functions for a set of fuzzy rules.
%   makefuzzyedgesys - Script to make MAT-file used by FUZZYFILT.
%   onemf          - Constant membership function (one).
%   sigmamf        - Sigma membership function.
%   smf            - S-shaped membership function.
%   trapezmf       - Trapezoidal membership function.
%   triangmf       - Triangular membership function.
%   truncgaussmf   - Truncated Gaussian membership function.
%   zeromf         - Constant membership function (zero).
%
% Morphological operations.
%   endpoints      - Computes end points of a binary image.
%
% Texture analysis.
%   specxture      - Computes spectral texture of an image.
%   statxture      - Computes statistical measures of texture in an image.
%
% Region-based processing.
%   histroi        - Computes the histogram of an ROI in an image.
%
% Wavelets.
%   waveback       - Computes inverse FWTs for multi-level decomposition.
%   wavecopy       - Fetches coefficients of a wavelet decomposition structure.
%   wavecut        - Zeroes coefficients in a wavelet decomposition structure.
%   wavedisplay    - Display wavelet decomposition coefficients.
%   wavefast       - Computes the FWT of a '3-D extended' 2-D array.
%   wavefilter     - Create wavelet decomposition and reconstruction filters.
%   wavework       - is used to edit wavelet decomposition structures.
%   wavezero       - Zeroes wavelet transform detail coefficients.
%
% Color space conversions.
%   hsi2rgb        - Converts an HSI image to RGB.
%   rgb2hsi        - Converts an RGB image to HSI.
%
% Array operations.
%   dftuv          - Computes meshgrid frequency matrices.
%   paddedsize     - Computes padded sizes useful for FFT-based filtering.
%
% Image types and type conversions.
%   tofloat        - Convert image to floating point.
%
% Miscellaneous functions.
%   conwaylaws     - Applies Conway's genetic laws to a single pixel.
%   i2percentile   - Computes a percentile given an intensity value.
%   iseven         - Determines which elements of an array are even numbers.
%   isodd          - Determines which elements of an array are odd numbers.
%   manualhist     - Generates a two-mode histogram interactively.
%   timeit         - Measure time required to run function.
%   percentile2i   - Computes an intensity value given a percentile.
%   twomodegauss   - Generates a two-mode Gaussian function.

