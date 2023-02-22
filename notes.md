---
layout: page
permalink: /notes/
---

<h2>Python</h2>
<b>Dictionary</b>:
- dict.setdefault(key, default=None)
- dict.get(key, default=None)
- lists cannot be keys, only immutable types can be keys to dictionaries. Could use tuple([]) to make list to tuple immutable. 

<b>Sets</b>
- construct with {} or set()
- set.add(elem) // adds elem to set
- Unordered, no indexing. 
- Sets are mutable, tuples not.
- use set.update(other_collection) to add to set with other collection type e.g. list []

<b>Strings</b>:
- Can add new letters to string with s +='let'. No append function like arrays. 

<b>Random Functions</b>:
- ord(): for unicode characters
- reversing a string: string[::-1]. Creates a copy (more memory).

<h2>C++</h2>
<b>Membership/Inheritance</b>
- Public members can be accessed from anywhere. Public members are usually used to define the interface of a class, as they represent the parts of the class that are intended to be used by other parts of the program. A base class's private members are never accessible directly from a derived class, but can be accessed through calls to the public and protected members of the base class.
- Protected members can be accessed from within the class, from derived classes, but not from objects of the class or from outside the class. 
- Private members can only be accessed within the class and cannot be accessed from derived classes or from outside the class.

<b>Static</b>
- static member functions can be called without an instance of a class. 

<h2>Random</h2>
- ffplay for preview with ffmpeg

<h2>Research</h2>
<b>Generative Modelling Resources </b> 
- Tuomas Kynk&auml;nniemi: Evaluation Metrics of Generative Adversarial Networks 
- Elucidating the Design Space of Diffusion-Based Generative Models 
- On the Mathematics of Diffusion Models

<b>Differential Rendering Papers </b>
- Extracting Triangular 3D Models, Materials, and Lighting From Images
- Modular Primitives for High-Performance Differentiable Rendering

<h2>Tutorials:</h2>
- Paper: Deep Unsupervised Learning using Nonequilibrium Thermodynamics <br>
- Paper: https://arxiv.org/pdf/2006.11239.pdf <br>
- Paper: https://arxiv.org/pdf/2102.09672.pdf <br>
- Paper: https://arxiv.org/pdf/2105.05233.pdf <br>
- VAE & Reparam. Trick: https://lilianweng.github.io/posts/2018-08-12-vae/#reparameterization-trick <br> 
- Written Tutorial: lilianweng.github.io/posts/2021-07-11-diffusion-models/ <br>