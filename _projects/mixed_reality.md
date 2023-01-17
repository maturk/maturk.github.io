---
layout: post
title: Interactive 3D Point Cloud Segmentation with HoloLens 2
author: Changan Chen, Matias Turkulainen, and Nora Eirich
image: mixed_reality_demo.gif
show_image: True
report: Mixed_Reality_Final_Report.pdf
github: 
show_report: True
priority: 300
---

<div style="margin-top: 2em"></div>
  <div class="row">
  <p class="project-links">
        <svg class="svg-icon grey"><use xlink:href="{{ '/assets/minima-social-icons.svg#pdf' | relative_url }}"></use></svg>
        Report: <a href="{{ site.baseurl }}/assets/reports/{{ page.report }}" target="_blank">{{ page.report }}</a>
    </p> 
        <p> This page showcases our team project for 3D volumetric segmentation from egocentric views using the Microsoft HoloLens 2. We implemented Theodora Kontogianni et al.'s paper
        <a href="https://arxiv.org/abs/2204.07183">Interactive Object Segmentation in 3D Point Clouds</a> on the HoloLens 2.
        </p> 
    <h3>Background</h3>
    <p>3D semantic segmentation is important for various applications in general scene understanding tasks. However, annotating ground truth datasets is a time-consuming and costly process. We propose an auto-labeling tool using the Microsoft HoloLens 2 for interactive egocentric object segmentation. We implement a tool on the HoloLens capable of visualizing point clouds, segmentation results, iterative refinement of segmentations, as well as a 3D mesh visualizer of the final segmentation. 
    <br><br>
    This interactive first-person semantic segmentation tool significantly improves the time and effort required for labeling tasks in custom environments and enables faster workflows for other research endeavors. Furthermore, it allows for real-time verification and correction of segmentations with minimal user annotation.</p>
    <h3>Results</h3>
    <div class = 'project-image'>
        <img src="../assets/images/mixed_reality_results.png" >
      </div>
    <h3>Demo Video</h3>
    <video height="400" loop="true" autoplay="autoplay" controls="controls" id="vid" muted>
            <source src="../assets/images/mixed_reality_demo.mp4" type="video/mp4">
            Your browser does not support the video tag.
    </video>
    <br><br>
    <h3>Tools Used</h3>
    <ul>
        <li>C#, Python, and Unity.</li>
    </ul>

   
            
  </div>







