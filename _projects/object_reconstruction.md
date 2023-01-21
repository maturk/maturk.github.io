---
layout: post
title: Object Reconstruction
author: Matias
image: cup_resize.gif
show_image: false
report: Coming soon
github: Coming Soon
show_report: false
priority: 300
---

<div style="margin-top: 2em"></div>
  <div class="row">
  <div class = "column">
    <p class="project-links">
        <svg class="svg-icon grey"><use xlink:href="{{ '/assets/minima-social-icons.svg#pdf' | relative_url }}"></use></svg>
        Code: <a href="{{ site.baseurl }}/assets/reports/{{ page.github }}" target="_blank">{{ page.github }}</a>
    </p> 
    </div>
    <div class = "column">
    <p class="project-links">
        <svg class="svg-icon grey"><use xlink:href="{{ '/assets/minima-social-icons.svg#pdf' | relative_url }}"></use></svg>
        Report: <a href="{{ site.baseurl }}/assets/reports/{{ page.report }}" target="_blank">{{ page.report }}</a>
    </p> 
    </div>
    <p>
    Work in progress... <br> <br>
    This page showcases my work on 3D Object Reconstruction from images. The main goal is to learn category level object class and shape information from a large dataset of shape models. I trained a 
    auto-encoder neural network architecture on multi-view images of common objects from the ShapeNet dataset.  </p>
    <div class="row">
    <h2>Multi-View Image Dataset</h2>
    <p> I used Blender scripts to automatically generate synthetic renders of models from the ShapeNet dataset. I render ground truth color and depth images as well as ground truth camera poses, point cloud, and voxel grid information. Below you can see some example renders. 
    </p>
    <div class = 'project-image'>
        <img src="../assets/images/dataset.png" class="">
    </div>  
    <h2>Architecture</h2>
    <p> The multi-view auto-encoder consists of a <a href="https://arxiv.org/abs/1612.00593">PointNet</a> like encoder network that fuses embedding vectors from multiple views. The intuition is that regardless of the viewing angle or pose of the input image, each image of the same object should project to the same latent representation. The decoder network is composed of series of linear and 2D convolutional layers that expand the shape embedding vector to a voxel grid of size 128x128x128. I use the cross-entropy loss for shape reconstruction loss and I use a contrastive loss on the embedding vectors to promote clustering in the latent space. </p>
    <div class = 'project-image'>
        <img src="../assets/images/reconstruction/architecture_diagram.png" class="">
    </div>  
    <h2>Results</h2>
    <p>I trained my network for 4 days with 6 RTX 2080 GPU's on the <a href = "https://scicomp.ethz.ch/wiki/Euler">Euler</a> compute cluster. The dataset consisted of 8 object categories with 50 object instances each and 16 input color/depth views.
    </p>
    <h3>Quantitative</h3>
    <p> I evaluate reconstruction performance with a cross-entropy loss, chamfer distance loss, and intersection over union. I run ablation studies and find that increasing the number of input views to the network improves reconstruction.<p>
    <div class = "row">
      <img src="../assets/images/table_res.png" class="">
    </div>
   <div class="row">
        <div class = "column">
        <img src="../assets/images/graph2.png" class="">
        </div>
        <div class = "column"> 
            <img src="../assets/images/graph.png" class="">
        </div>
    </div>
    <h3>Qualitative</h3>
    <div class="row">
        <div class = "column">
        <div class = "column">
        <p class>Ground Truth</p>
            <img src="../assets/images/reconstruction/bottle_gt_scan_gif.gif" class="">
            <img src="../assets/images/reconstruction/can_gt_scan_gif.gif" class="">
            <img src="../assets/images/reconstruction/cellphone_gt_scan_gif.gif" class="">
            <img src="../assets/images/reconstruction/display_gt_scan_gif.gif" class="">
            <img src="../assets/images/reconstruction/laptop_gt_scan_gif.gif" class="">
            <img src="../assets/images/reconstruction/camera_gt_scan_gif.gif" class="">
        </div> 
        <div class = "column">
        <p class>1 Input View Prediction</p>
            <img src="../assets/images/reconstruction/bottle_scan_1_view_gif.gif" class="">
            <img src="../assets/images/reconstruction/can_scan_1_view_gif.gif" class="">
            <img src="../assets/images/reconstruction/cellphone_scan_1_view_gif.gif" class="">
            <img src="../assets/images/reconstruction/display_scan_1_new_gif.gif" class="">
            <img src="../assets/images/reconstruction/laptop_scan_1_view_gif.gif" class="">
            <img src="../assets/images/reconstruction/camera_scan_1_view_gif.gif" class="">
        </div>
        </div>
        <div class = "column">
        <div class = "column"> 
        <p class>5 Input View Prediction</p>
            <img src="../assets/images/reconstruction/bottle_scan_5_view_gif.gif" class="">
            <img src="../assets/images/reconstruction/can_scan_5_view_gif.gif" class="">
            <img src="../assets/images/reconstruction/cellphone_scan_5_view_gif.gif" class="">
            <img src="../assets/images/reconstruction/display_scan_5_new_gif.gif" class="">
            <img src="../assets/images/reconstruction/laptop_scan_5_view_gif.gif" class="">
            <img src="../assets/images/reconstruction/camera_scan_5_view_gif.gif" class="">
        </div>
        <div class = "column">
        <p class>1-5 Input View Prediction</p> 
            <img src="../assets/images/reconstruction/bottle_gif.gif" class="">
            <img src="../assets/images/reconstruction/can_gif.gif" class="">
            <img src="../assets/images/reconstruction/cellphone_gif.gif" class="">
            <img src="../assets/images/reconstruction/display_new_gif.gif" class="">
            <img src="../assets/images/reconstruction/laptop_gif.gif" class="">
            <img src="../assets/images/reconstruction/camera_gif.gif" class="">
        </div>
    </div>
    <p>The auto-encoder embedding space is clustered into classes as seen in the following TSNE embedding illustration:</p>
     <div class = 'project-image'>
        <img src="../assets/images/tsne_okay_4.png" max-width='10%'>
    </div>  
    <h3>Tools Used</h3>
    <ul>
        <li>Python, Blender, and various bash scripts.</li>
        <li>Main libraries: PyTorch, <a href="https://github.com/facebookresearch/pytorch3d">PyTorch3D</a>, OpenCV, and Open3D.</li>
    </ul>