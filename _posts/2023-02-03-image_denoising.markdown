---
layout: post
title:  "Image Based Denoising"
date:   2023-02-03 02:18:45 +0100
categories: page
github: https://github.com/maturk/image-denoising
---
<link href="{{ site.baseurl }}/assets/css/twentytwenty.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="/assets/css/styles.css">
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
    <p>Image denoising is the process of removing noise from a digital image. Noise in images can occur due to various factors such as low light conditions, high ISO settings, and image compression. There are various methods for denoising an image, including statistical methods, filter-based methods, and deep learning-based methods. Here I explore a few popular methods.
    </p>
    <h3> Gaussian kernel method </h3>
    A Gaussian kernel is a low-pass filter that smoothens the image by blurring out high frequency noise while preserving low frequency details. The size and standard deviation of the Gaussian kernel can be adjusted to balance smoothing and detail preservation.
    <br><br>    
    <div style="text-align:center;  ">
        <img src="{{ site.baseurl }}/assets/images/denoising/gaussian-blur/gaussian.png" >
        <p class = "cen">Gaussian Kernel of Size 10 and Sigma 1 </p>
    </div>
    <br>
    <div class = "row">
    <div class = "column">
        <div class="twentytwenty-container">
            <img src="{{ site.baseurl }}/assets/images/denoising/cbox.png" alt="Reference 1 SPP" class="img-responsive%;" >
            <img src="{{ site.baseurl }}/assets/images/denoising/gaussian-blur/out_5_1.png" alt="Size: 5 Sigma: 1" class="img-responsive%;">
        </div>
    </div>
     <div class = "column">
        <div class="twentytwenty-container">
        <img src="{{ site.baseurl }}/assets/images/denoising/gaussian-blur/out_5_2.png" alt="Size: 5 Sigma: 2" class="img-responsive%;">
        <img src="{{ site.baseurl }}/assets/images/denoising/gaussian-blur/out_10_2.png" alt="Size: 10 Sigma: 2" class="img-responsive%;">        </div>
    </div>
    <div class = "column">
    <h4>Advantages</h4>
    <ul>
        <li>Simple and relatively fast on modern hardware</li>
    </ul>
    </div>
    <div class = "column">
    <h4>Disadvantages</h4>
    <ul>
        <li>Non-edge perserving</li>
        <li>Does not account for local image statistics</li>
    </ul>
    </div>
    <br>
    <h3> Bilateral filter </h3>
    A blast from the past: the Bilateral Filter proposed by C. Tomasi and R. Manduchi in 1998 is a non-linear, edge-preserving filter. The main idea is illustrated below:
    <img src="{{ site.baseurl }}/assets/images/denoising/bilateral/screenshot_bilateral.png" alt="Size: 10 Sigma: 2" class="img-responsive%;">
    Unlike other filters such as the Gaussian filter that only consider the spatial proximity of pixels, the bilateral filter takes into account both the spatial proximity and the color similarity of pixels. It calculates the weight of each pixel in the filter window based on a Gaussian function of its distance ( g(.) ) from the center pixel and a Gaussian function of the difference in color intensity ( f(.) ) between the center pixel and the other pixels. 
    <img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/2765ae591a57896fe5e802ed797ad87a99a77887" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -3.338ex; width:58.286ex; height:6.676ex;" alt="{\displaystyle I^{\text{filtered}}(x)={\frac {1}{W_{p}}}\sum _{x_{i}\in \Omega }I(x_{i})f_{r}(\|I(x_{i})-I(x)\|)g_{s}(\|x_{i}-x\|),}" style="display:block; margin-left:auto; margin-right:auto">
    This way, it can preserve the edges and fine details of the image while smoothing out the noise. The standard deviation of the two Gaussian functions can be adjusted to control the strength of the smoothing and the preservation of edges.
    <br><br>
     <div class="twentytwenty-container">
        <img src="{{ site.baseurl }}/assets/images/denoising/cbox.png" alt="Reference 1 SPP" class="img-responsive%;" >
        <img src="{{ site.baseurl }}/assets/images/denoising/bilateral/out_5_25_20.png" alt="sigma_color: 25 sigma_space: 20" class="img-responsive%;">  
        <img src="{{ site.baseurl }}/assets/images/denoising/bilateral/out_5_1_1.png" alt="sigma_color: 1 sigma_space: 1" class="img-responsive%;">
        <img src="{{ site.baseurl }}/assets/images/denoising/bilateral/out_5_20_20.png" alt="sigma_color: 20 sigma_space: 20" class="img-responsive%;">     
    </div>
    <br>
    Some fine tuning is necessary with this filter. The filter works well on regions with uniform color, low noise, and near boundaries (e.g. top of spheres). However, like shown on the bottom of the spheres, it is unable to deal with very high noisy regions without overly smoothing with the distance gaussian.
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="{{ site.baseurl }}/assets/jquery.twentytwenty.js"></script>
<script src="{{ site.baseurl }}/assets/bootstrap.min.js"></script>
<script src="{{ site.baseurl }}/assets/jquery.event.move.js"></script>
<script>
$(window).load(function(){$(".twentytwenty-container").twentytwenty({default_offset_pct: 0.5});});
</script>