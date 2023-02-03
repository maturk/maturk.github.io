---
layout: post
title:  "Image Based Denoising"
date:   2023-02-03 02:18:45 +0100
categories: page
github: https://github.com/maturk/image-denoising
---
<link href="{{ site.baseurl }}/assets/css/twentytwenty.css" rel="stylesheet" type="text/css" />
<div style="margin-top: 2em"></div>
  <div class="row">
  <div class = "column">
    <p class="project-links">
        <svg class="svg-icon grey"><use xlink:href="{{ '/assets/minima-social-icons.svg#github' | relative_url }}"></use></svg>
        <a href="{{ page.github }}" target="_blank">GitHub</a>
    </p> 
    </div>
    <div class = "column">
    <p class="project-links">
        <svg class="svg-icon grey"><use xlink:href="{{ '/assets/minima-social-icons.svg#pdf' | relative_url }}"></use></svg>
    </p> 
    </div>
    <p>Image denoising is the process of removing noise from a digital image. Noise in images can occur due to various factors such as low light conditions, high ISO settings, and image compression. There are various methods for denoising an image, including statistical methods, filter-based methods, and deep learning-based methods. Here I explore a few popular methods. Code to all implementations can be found on <a href="https://github.com/maturk/image-denoising">GitHub</a>.</p>
    <h3> Gaussian kernel method </h3>
    A Gaussian kernel is a low-pass filter that smoothens the image by blurring out high frequency noise while preserving low frequency details. The Gaussian kernel is defined by a Gaussian kernel that determines the weight of each pixel in the filter window. Pixels near the center of the window contribute more to the smoothing effect, while pixels near the edges contribute less. The size and standard deviation of the Gaussian kernel can be adjusted to balance smoothing and detail preservation. The gaussian kernel is convolved across the input image for all pixel locations. 
    <br>
    <br>
    <div class="twentytwenty-container">
        <img src="{{ site.baseurl }}/assets/images/denoising/cbox.png" alt="Reference 1 SPP" class="img-responsive%;" >
        <img src="{{ site.baseurl }}/assets/images/denoising/out_5_1.png" alt="Size: 5 sigma: 1" class="img-responsive%;">
        <img src="{{ site.baseurl }}/assets/images/denoising/out_5_2.png" alt="Size: 5 sigma: 2" class="img-responsive%;">
        <img src="{{ site.baseurl }}/assets/images/denoising/out_10_2.png" alt="Size: 10 sigma: 2" class="img-responsive%;">
    </div>
    <br>
    <h3> Bilateral filter </h3>
    The bilateral filter is a type of non-linear, edge-preserving filter used for image denoising and smoothing. Unlike other filters such as the Gaussian filter that only consider the spatial proximity of pixels, the bilateral filter takes into account both the spatial proximity and the color similarity of pixels. It calculates the weight of each pixel in the filter window based on a Gaussian function of its distance from the center pixel and a Gaussian function of the difference in color intensity between the center pixel and the other pixels. This way, it can preserve the edges and fine details of the image while smoothing out the noise. The standard deviation of the two Gaussian functions can be adjusted to control the strength of the smoothing and the preservation of edges.

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="{{ site.baseurl }}/assets/jquery.twentytwenty.js"></script>
<script src="{{ site.baseurl }}/assets/bootstrap.min.js"></script>
<!-- <script src="/js/offcanvas.js"></script> -->
<script src="{{ site.baseurl }}/assets/jquery.event.move.js"></script>
<script>
$(window).load(function(){$(".twentytwenty-container").twentytwenty({default_offset_pct: 0.5});});
</script>