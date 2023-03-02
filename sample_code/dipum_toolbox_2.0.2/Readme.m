% README file for the DIPUM Toolbox.
%
% These MATLAB functions were created for the book Digital Image Processing
% Using MATLAB, 2nd edition, by R.C. Gonzalez, R.E. Woods, and S.L. Eddins,
% Gatesmark Publishing, 2009.  The functions supplement and extend the image
% processing functionality of MATLAB and the Image Processing Toolbox, both
% offered by The MathWorks.
%
% The P-code version of the DIPUM Toolbox
% ---------------------------------------
% The P-code version of the DIPUM Toolbox contains only executable MATLAB
% P-files. P-files may be executed as MATLAB functions just as M-files.  Unlike
% M-files, however, neither the help text nor the source code is accessible.
% Complete source code listings for all functions are included in the book.
%
% The registered version of the DIPUM Toolbox
% -------------------------------------------
% The registered version of the DIPUM Toolbox contains M-files with readable
% source code and help text.  Users who want the M-files in electronic form may
% obtain, for a small fee, a password allowing them to download the registered
% toolbox.
%
% More information about both versions of the DIPUM Toolbox and details on how
% to obtain them are available at the book web site:
%
% http://www.imageprocessingplace.com/DIPUM_Toolbox_2/DIPUM_Toolbox_2.htm
%
% Requirements
% ------------
% This release of the DIPUM Toolbox was developed and tested using the R2008b
% release of MATLAB and the Image Processing Toolbox.  The DIPUM Toolbox is not
% supported for use with earlier versions of MATLAB or the Image Processing
% Toolbox.  Most DIPUM functions require the Image Processing Toolbox.   
%
% The DIPUM Toolbox works with all MATLAB platforms.  It includes one MEX-file
% (UNRAVEL, which is used for Huffman decoding).  Compiled binaries for this
% MEX-file are provided for all MATLAB platforms.
%
% Installation
% ------------
% To install the DIPUM Toolbox, place the folder containing the functions on a
% local hard drive or a network drive accessible to your computer, and then
% include the folder location in the MATLAB path.  To set the MATLAB path, start
% MATLAB and then select the File/Set Path menu item.  Then select Add Folder.
% Use the navigation window to select the folder containing the functions. Click
% OK and then click Save.  The functions will then be ready for use within
% MATLAB.
%
% Copyright
% ---------
% The DIPUM Toolbox is protected under U.S. and international copyright law. You
% may not transfer, publish, disclose, display, or otherwise make available
% either the free or the registered versions of the DIPUM Toolbox to other
% people. In particular, you may not place either version of the DIPUM Toolbox
% on an Internet site, a computer bulletin board, or an anonymous ftp directory
% from which it could be downloaded or copied by other people.  Anyone may
% obtain the free version directly from the book's web site.  In the event that
% an organization holds a Multiuser (Site) License for the DIPUM Toolbox, access
% to the software should be granted only to individuals who are affiliated with
% the organization holding the license. Each individual receiving access to the
% software must be made aware of this entire Copyright notice. 
%
%
% Disclaimer of Warranty
% ----------------------
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS 
% IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED 
% TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A 
% PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT 
% HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
% SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
% LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, 
% DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY 
% THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
% (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
% OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
%
% The DIPUM Toolbox was not created by The MathWorks, nor is it supported by The
% MathWorks.
%
% About Version 2.0.2
% -------------------
% Release date: 27-May-2009
%
% Changes
%
%   * fchcode       Fixed bug that caused it to error out incorrectly when
%                   connectivity of 4 was specified.  
%
%   * polyangles    Improved implementation based on the difference of two
%                   calls to atan2.
%
%   * im2minperpoly Fixed bug caused by slight change in the behavior of
%                   the MATLAB function DET.
%
%   * pointgrid     Fixed typos in the calls to linspace that caused the
%                   spacing to be different than stated in the
%                   documentation. 
%
%   * colorgrad     Fixed bug in the computation of the second output
%                   argument, the angle array.
%
%   * unravel       Added MEX-file build for 64-bit Intel Macintosh.
%
% About Version 2.0.1
% -------------------
% Release date: 12-Oct-2009
% 
% Minor change to wording of copyright statement in Readme.m.
%
% About Version 2.0
% -----------------
% Release date: 14-May-2009
%
% Version 2.0 corresponds to the second edition of Digital Image Processing
% Using MATLAB.
%
% NEW FUNCTIONS
% Version 2.0 contains many new functions:
%
%   * aggfcn         - Aggregation function for a fuzzy system.
%   * approxfcn      - Approximation function.
%   * bandfilter     - Computes frequency domain band filters.
%   * bellmf         - Bell-shaped membership function.
%   * boundarydir    - Determine the direction of a sequence of planar points.
%   * cnotch         - Generates circularly symmetric notch filters.
%   * cornerprocess  - Processes the output of function cornermetric.
%   * cv2tifs        - Decodes a TIFS2CV compressed image sequence.
%   * defuzzify      - Output of fuzzy system.
%   * fuzzyfilt      - Fuzzy edge detector.
%   * fuzzysysfcn    - Fuzzy system function.
%   * i2percentile   - Computes a percentile given an intensity value.
%   * im2minperpoly  - Minimum perimeter polygon.
%   * implfcns       - Implication functions for a fuzzy system.
%   * imtransform2   - 2-D image transformation with fixed output location.
%   * iseven         - Determines which elements of an array are even numbers.
%   * isodd          - Determines which elements of an array are odd numbers.
%   * lambdafcns     - Lambda functions for a set of fuzzy rules.
%   * localmean      - Computes an array of local means.
%   * localthresh    - Local thresholding.
%   * makefuzzyedgesys - Script to make MAT-file used by FUZZYFILT.
%   * movie2tifs     - Creates a multiframe TIFF file from a MATLAB movie.
%   * movingthresh   - Image segmentation using a moving average threshold.
%   * ntrop          - Computes a first-order estimate of the entropy of a matrix.
%   * onemf          - Constant membership function (one).
%   * otsuthresh     - Otsu's optimum threshold given a histogram.
%   * percentile2i   - Computes an intensity value given a percentile.
%   * pointgrid      - Points arranged on a grid.
%   * principalcomps - Principal-component vectors and related quantities.
%   * recnotch       - Generates rectangular notch (axes) filters.
%   * reprotate      - Rotate image repeatedly.
%   * seq2tifs       - Creates a multi-frame TIFF file from a MATLAB sequence.
%   * showmo         - Displays the motion vectors of a compressed image sequence.
%   * sigmamf        - Sigma membership function.
%   * smf            - S-shaped membership function.
%   * tifs2cv        - Compresses a multi-frame TIFF image sequence.
%   * tifs2movie     - Create a MATLAB movie from a multiframe TIFF file.
%   * tifs2seq       - Create a MATLAB sequence from a multi-frame TIFF file.
%   * timeit         - Measure time required to run function.
%   * tofloat        - Convert image to floating point.
%   * trapezmf       - Trapezoidal membership function.
%   * triangmf       - Triangular membership function.
%   * truncgaussmf   - Truncated Gaussian membership function.
%   * visreg         - Visualize registered images.
%   * vistform       - Visualization transformation effect on set of points.
%   * wavedisplay    - Display wavelet decomposition coefficients.
%   * zeromf         - Constant membership function (zero).
%
% MODIFIED FUNCTIONS
% These functions that existed in the first edition of the book have new or
% modified behavior or syntaxes:
%
%   * bound2im       - Support fewer input arguments.
%   * dftfilt        - Use single precision.
%   * dftuv          - Use single precision.
%   * endpoints      - Use revised definition of end points.
%   * im2jpeg        - Support different bit depths.
%   * imnoise3       - Fix incorrect computation.
%   * intrans        - Use single precision.
%   * jpeg2im        - Support different bit depths.
%   * lpfilter       - Use single precision.
%   * regiongrow     - Use single precision.
%   * spfilt         - Use single precision.
%   * waveback       - Support 3-D input.
%   * wavefilter     - Support 3-D input.
%
% Many DIPUM Toolbox functions were modified because of changes in MATLAB since
% the publication of the first edition, or were modified to clean up or simplify
% the code.  Common changes include using && and || instead of & and |, removing
% unused variable assignments, reorganizing code into subfunctions, using hypot,
% and using bsxfun instead of repmat.  Modified functions include adpmedian,
% bayesgauss, bound2eight, bound2im, bsubsamp, colorgrad, colorseg, covmatrix,
% fchcode, fwtcompare, gscale, huff2mat, huffman, ifrdescp, ifwtcompare,
% im2jpeg2k, imnoise2, imratio, imstack2vectors, intline, intrans, invmoments,
% jpeg2k2im, lpfilter, mahalanobis, mat2huff, paddedsize, polyangles, quantize,
% regiongrow, signature, spfilt, splitmerge, statmoments, strsimilarity,
% wave2gray, waveback, wavefast, wavefilter, and wavework.
%
% Function ice was modified according to the output of GUIDE in MATLAB R2008b.
%
% MEX function unravel was modified to use the latest MEX API calls and to use
% platform-independent typedefs.
%
% DELETED FUNCTIONS
% Several functions have been deleted from the DIPUM Toolbox:
%
%   * boundaries - Replaced by Image Processing Toolbox function bwboundaries.
%   * dftcorr - No longer used in the book.
%   * entropy - Replaced by ntrop.
%   * hough - Replaced by Image Processing Toolbox function.
%   * houghlines - Replaced by Image Processing Toolbox function.
%   * houghpeaks - Replaced by Image Processing Toolbox function.
%   * houghpixels - Not used in the book.
%   * minperpoly - Replaced by im2minperpoly.
%   * princomp - Replaced by principalcomps.
%   * vistformfwd - Replaced by vistform.
%
% About Version 1.1.4
% -------------------
% Release date: 15-July-2006
%
% Changes:
%   * bayesgauss:  Corrected typo in help text.
%   * ifrdescp:    Corrected typo in help text.
%   * im2jpeg:     Corrected bug in end-of-block computation.
%   * imnoise2:    Corrected bug in the lognormal computation.
%   * mahalanobis: Corrected typo in help text.
%   * pixeldup:    Corrected typo in comment.
%   * rgb2hsi:     Corrected typo in comment.
%
% About Version 1.1.3
% -------------------
% Release date: 15-Dec-2004
%
% Changes:
%   * bayesgauss: Corrected bug in the optimized version that was
%                 released in DIPUM Toolbox 1.1.
%
% About Version 1.1.2
% -------------------
% Release date: 04-Nov-2004
%
% Changes:
%   * bayesgauss: Revised help text and some comments in the code.
%
%   * bsubsamp:   Corrected indexing errors that occurred under some 
%                 conditions.
%
%   * ifrdescp:   Revised help text.
%
%   * imnoise3:   Revised help text.
%
%   * lpfilter:   Removed a superfluous output variable.
%
%   * statxture:  Removed unnecessary brackets surrounding output
%                 variable.
%
% About Version 1.1.1
% -------------------
% Release date: 04-Jun-2004
%
% Changes:
%   * Added missing ice.fig file to toolbox distribution.
%
% About Version 1.1
% -----------------
% Release date: 10-Mar-2004
%
% Changes:
%   * Function bayesgauss was modified to improve performance.
%
% About Version 1.0
% -----------------
% Release date: 01-Dec-2003
%
% This initial release of the DIPUM Toolbox coincides with the
% initial publication of Digital Image Processing Using MATLAB.
