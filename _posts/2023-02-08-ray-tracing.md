---
layout: post
title:  "Adventures in ray tracing"
date:   2023-02-08 02:18:45 +0100
categories: page
github: https://github.com/maturk/image-denoising
---
Here I show the progress I make with ray tracing concepts as I slowly implement features in my own path tracer. I'll start from the very basics and build up to more advanced features. 
<h3>Quick look</h3>
<center>
    <img src="{{ site.baseurl }}/assets/images/raytracing/renderer.jpg" class="img-responsive%" style="width:70%">
</center>
<h3>Basics</h3>
<b>Intersections and normals</b>
<link href="{{ site.baseurl }}/assets/css/twentytwenty.css" rel="stylesheet" type="text/css" />
<div class="twentytwenty-container">
    <img src="{{ site.baseurl }}/assets/images/raytracing/circle_intersection.jpg" alt="Sphere intersection" class="img-responsive%;" >
    <img src="{{ site.baseurl }}/assets/images/raytracing/normals.jpg" alt="Sphere normals" class="img-responsive%;" >
</div>
<b>Multiple object intersections</b>
<div class="twentytwenty-container">
    <img src="{{ site.baseurl }}/assets/images/raytracing/floor.png" alt="Sphere and floor" class="img-responsive%;" >
</div>
<b>Antialiasing by generating pixels with multiple samples</b>
<div class="twentytwenty-container">
    <img src="{{ site.baseurl }}/assets/images/raytracing/alias2.jpg" alt="1 Sample Per Pixel" class="img-responsive%;" >
    <img src="{{ site.baseurl }}/assets/images/raytracing/antialias2.jpg" alt="100 Samples Per Pixel" class="img-responsive%;" >
</div>
<b>Diffuse surfaces and Gamma correction</b>
<div class="twentytwenty-container">
    <img src="{{ site.baseurl }}/assets/images/raytracing/no_gamma.jpg" alt="Diffuse" class="img-responsive%;">
    <img src="{{ site.baseurl }}/assets/images/raytracing/gamma.jpg" alt="Diffuse gamma corrected" class="img-responsive%;" >
</div>
<br><br>
<b>Materials</b>
<div class="twentytwenty-container">
    <img src="{{ site.baseurl }}/assets/images/raytracing/materials_specular.jpg" alt="Specular metal" class="img-responsive%;">
    <img src="{{ site.baseurl }}/assets/images/raytracing/materials_coarse.jpg" alt="Coarse metal" class="img-responsive%;">
</div>
<div class="twentytwenty-container">
    <img src="{{ site.baseurl }}/assets/images/raytracing/hollow_glass_sphere.jpg" alt="Hollow glass" class="img-responsive%;">
</div>
<br><br>
<b>Camera control and lens effects </b><br>
<div class="twentytwenty-container">
    <img src="{{ site.baseurl }}/assets/images/raytracing/camera.jpg" alt="Camera control" class="img-responsive%;">
    <img src="{{ site.baseurl }}/assets/images/raytracing/dof.jpg" alt="Depth of field" class="img-responsive%;">
</div>
<b>Parallelising</b><br>
Raytracing is embarrassingly parallel. OpenMP, as explained by Bisqwit's [Guide to OpenMP](https://bisqwit.iki.fi/story/howto/openmp/), allows for very easy multithreading at runtime. Simply adding the following compiler #pragma before the main rendering loop gives us multithreading performance:

```
#pragma omp parallel for ordered schedule(dynamic)
for (int y = 0; y < image.m_surface.height; y++){
    for (int x = 0; x < image.m_surface.width; x++){
        Color pixel_Color;
        // trace rays per pixel
        image.m_surface.pixels[(y*image.m_surface.width +x)] = pixel_color;
```
Without multithreading, a 800*450 image takes around 18 seconds to render for an image with a single sample per pixel. Adding multithreading, the render takes only 4 seconds on my 4 core linux machine. Not quite real-time, but I will tackle this problem a bit later... 
<br><br>
<h3>Making a GUI</h3>
So far, all the images have been rendered directly into an image file (ppm/png/jpg). Most professional renderers have GUIs so that the user can experiment with various rendering parameters without having to compile the program again. So I set out to use OpenGL, GLFW, GLEW, and ImGUI to make a simple cross-platform GUI application for the renderer.
<br><br>
<b>Displaying a triangle</b> <br>
Little did I know that displaying a simple triangle would take around 200 lines of <a href="../../../../assets/images/raytracing/code.html">code</a> ...
<center>
    <img src="{{ site.baseurl }}/assets/images/raytracing/triangle.png" alt="" class="img-responsive%" style="width:50%">
</center>
<b>Displaying a rendered image</b> <br>
Displaying a rendered image, such as a jpg file, onto the display required some research. References online suggest hacks like displaying images as textured rectangles that match the size of your display; however, this would require defining external vertex and fragment shaders like in the above triangle example. Instead, I learned that OpenGL 3.0 introduced the concept of read and draw [frame buffers](https://registry.khronos.org/OpenGL/extensions/EXT/EXT_framebuffer_blit.txt) that allow the user to render images to other destinations besides the default frame buffer displayed on the screen. Directly attaching a 2D texture onto the default frame buffer is not possible due to it being owned by a resource external to OpenGL (mainly the OS); however, rendering to a separate draw buffer and copying the texture to the default buffer, by an optimized blitting function, is possible.
<br><br>
The main idea is to create a pixel buffer to store color information from the main rendering loop (making sure you account for changes in the window height/width), attaching the pixel buffer data as a [texture](https://learnopengl.com/Getting-started/Textures) to a draw frame buffer, and lastly blitting the texture onto the main display.
<center>
    <img src="{{ site.baseurl }}/assets/images/raytracing/frame_buffer3.gif" class="img-responsive%" style="width:50%">
</center>
<br><br>
<b>Updating with samples</b> <br>
Whilst the rendering process occurs behind the scenes, the GUI should visualize the progress as new samples per pixel come. 
<center>
    <img src="{{ site.baseurl }}/assets/images/raytracing/sample_per_pixel.gif" class="img-responsive%" style="width:70%">
</center>
<b>ImGUI</b> <br>
Adding buttons to control settings and rendering parameters is easy with ImGUI.
<center>
    <img src="{{ site.baseurl }}/assets/images/raytracing/imgui2.jpg" class="img-responsive%" style="width:70%">
</center>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="{{ site.baseurl }}/assets/jquery.twentytwenty.js"></script>
<script src="{{ site.baseurl }}/assets/bootstrap.min.js"></script>
<!-- <script src="/js/offcanvas.js"></script> -->
<script src="{{ site.baseurl }}/assets/jquery.event.move.js"></script>
<script>
$(window).load(function(){$(".twentytwenty-container").twentytwenty({default_offset_pct: 0.5});});
</script>