---
layout: post
title: Object Reconstruction
author: Matias
image: display_gif_1240.gif
show_image: false
report: Coming soon
github: Coming Soon
show_report: false
priority: 300
---

<div style="margin-top: 2em"></div>
  <div class="row">
    <p class="project-links">
        <svg class="svg-icon grey"><use xlink:href="{{ '/assets/minima-social-icons.svg#pdf' | relative_url }}"></use></svg>
        Code: <a href="{{ site.baseurl }}/assets/reports/{{ page.github }}" target="_blank">{{ page.github }}</a>
    </p> 
    <p class="project-links">
        <svg class="svg-icon grey"><use xlink:href="{{ '/assets/minima-social-icons.svg#pdf' | relative_url }}"></use></svg>
        Report: <a href="{{ site.baseurl }}/assets/reports/{{ page.report }}" target="_blank">{{ page.report }}</a>
    </p> 
    <p>
    Work in progress... <br> <br>

    This page showcases my work on 3D Object Reconstruction from images. The main goal is to learn category level object class and shape information from a large dataset of shape models. I trained a 
    auto-encoder neural network architecture on multi-view images of common objects from the ShapeNet dataset.  </p>
    <div class="row">

    <h2>Multi-View Image Dataset</h2>
    <p> I used Blender scripts to automatically generate synthetic renders of models from the ShapeNet dataset. I render ground truth color and depth images as well as ground truth camera poses, point cloud, and voxel grid information. Below you can see some example renders. 
    </p>
    <div class = '.image'>
        <img src="../assets/images/dataset.png" class="">
    </div>  

    <h2>Architecture</h2>
    <p> The multi-view auto-encoder consists of a <a href="https://arxiv.org/abs/1612.00593">PointNet</a> like encoder network that fuses embedding vectors from multiple views. The intutition is that regardless of the viewing angle or pose of the input image, each image of the same object should project to the same latent representation. The decoder network is composed of series of linear and 2D convolutional layers that expand the shape embedding vector to a voxel grid of size 128x128x128. I use the cross-entropy loss for shape reconstruction loss and I use a contrastive loss on the embedding vectors to promote clustering in the latent space. </p>
    <div class = '.image'>
        <img src="../assets/images/diagram.png" class="">
    </div>  

    <h2>Results</h2>

    <p>I trained my network for around 4 days with 6 RTX 2080 GPU's on the <a href = "https://scicomp.ethz.ch/wiki/Euler">Euler</a> compute cluster. 9 object categories with 50 object instances each and 16 input color/depth views.
    </p>

    <div class = '.image'>
        <img src="../assets/images/results_pic.png" class="">
    </div>  

    The auto-encoder embedding space is clustered into classes as seen in the following TSNE embedding illustration:
     <div class = '.image'>
        <img src="../assets/images/tsne_okay_4.png" class="">
    </div>  
    <div class = '.image'>
        <img src="../assets/images/results_table.png" class="">
    </div>  
    <h3>Tools Used</h3>
    <ul>
        <li>Python, Blender, and various bash scripts.</li>
        <li>Main libraries: PyTorch, <a href="https://github.com/facebookresearch/pytorch3d">PyTorch3D</a>, OpenCV, and Open3D.</li>
    </ul>
  </div>







