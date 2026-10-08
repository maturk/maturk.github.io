---
layout: default
---

## About Me
<div class="profile-section">
	<div class="profile-image-container">
		<img class="profile-picture" src="assets/me_canyon.jpg" alt="Matias Turkulainen's profile picture showing a canyon background" loading="lazy">
    </div>

	<div class="profile-doc">
		<p>PhD Student @ Aalto University</p>
		<p>MSc @ ETH Zurich</p>

        <ul class="contact-list">
            <li>
                <a href="mailto:matiasturkulainen@gmail.com">
                    <i class="fa fa-envelope" aria-hidden="true"></i> matiasturkulainen@gmail.com
                </a>
            </li>
            <li>
                <a href="https://github.com/maturk">
					<i class="fa fa-github" aria-hidden="true"></i> GitHub
                </a>
            </li>
            <li>
                <a href="https://scholar.google.com/citations?user=9ixpc8MAAAAJ&hl=en&oi=ao">
                    <i class="fa fa-google" aria-hidden="true"></i> Google Scholar
                </a>
            </li>
            <li>
                <a href="https://www.linkedin.com/in/matias-turkulainen/">
                    <i class="fa fa-linkedin" aria-hidden="true"></i> LinkedIn
                </a>
            </li>
        </ul>
    </div>

</div>
I'm a computer vision PhD candidate at Aalto University 🇫🇮, advised by [Juho Kannala](https://users.aalto.fi/~kannalj1/) and [Arno Solin](https://users.aalto.fi/~asolin/). I am also a research intern at <a href="https://www.nianticspatial.com/en">Niantic Spatial</a> <img src="assets/favicon-niantic-black.png" alt="" style="height: 1.2em; width: 1.2em; vertical-align: middle; margin-left: 0.2em; object-fit: contain;"> in London (Summer 2025, returning Summer 2026), and part-time engineer at a Finnish stealth startup 🥷. My research focuses on 3D reconstruction and neural rendering. Feel free to reach out for research or business inquiries.


## Publications
{% assign years = site.data.papers | group_by:"year" | sort: "name" | reverse %}

{% for year in years %}
### {{ year.name }}	
---

{% for paper in year.items %}
<table class="paper-list">
  <tr>
  	{% if paper.paper-logo %}
    <td><img class="paper-logo" src="{{paper.paper-logo}}"></td>
	{% endif %}
	{% if paper.paper-logo-mp4 %}
    <td>
		<div class="paper-logo">
		<video muted autoplay loop playsinline>
			<source src="{{paper.paper-logo-mp4}}" type="video/mp4">
			Your browser does not support the video tag.
		</video>
		</div>
	</td>
	{% endif %}
    <td>
		<p class="paper-title">{{paper.paper-title}}</p>  
		<p class="paper-authors">
			{% for author in paper.paper-authors %}
				{% if forloop.last == true %}
					{{author.name}}.
				{% else %}
					{{author.name}},
				{% endif %}
			{% endfor %}
		</p>
		<p class="paper-pub">{{paper.paper-pub}}</p>
		<p class="paper-links">
			{% if paper.link-pdf %}
			<a href="{{paper.link-pdf}}" target="_blank" rel="noopener">
				<i class="fa fa-file-pdf-o" aria-hidden="true"></i> PDF </a>
			{% endif %}

			{% if paper.link-arxiv %}
			<a href="{{paper.link-arxiv}}" target="_blank" rel="noopener">
				<i class="fa fa-file" aria-hidden="true"></i> arXiv </a> 
			{% endif %}

			{% if paper.link-projectpage %}
			<a href="{{paper.link-projectpage}}" target="_blank" rel="noopener">
				<i class="fa fa-link" aria-hidden="true"></i> ProjectPage </a>  
			{% endif %}

			{% if paper.link-supplementary %}
			<a href="{{paper.link-supplementary}}" target="_blank" rel="noopener">
				<i class="fa fa-file-pdf-o" aria-hidden="true"></i> Supplementary </a>  
			{% endif %}

			{% if paper.link-gitcode %}
			<a href="{{paper.link-gitcode}}" target="_blank" rel="noopener">
				<i class="fa fa-github" aria-hidden="true"></i> Github </a>  
	        {% endif %}

			{% if paper.link-gitcode-button %}
			<a href="{{paper.link-gitcode}}" target="_blank" rel="noopener">
				<i class="fa " aria-hidden="true"></i></a>  
				<iframe style="margin-left: 2px; margin-bottom:-5px;" 
					frameborder="0" scrolling="0" width="100px" height="20px"
	                src="{{paper.link-gitcode-button}}">
	        	</iframe>
	        {% endif %}

	        {% if paper.link-gitdata %}
			<a href="{{paper.link-gitdata}}" target="_blank" rel="noopener">
				<i class="fa fa-github" aria-hidden="true"></i> Dataset </a> 
	        {% endif %}

	        {% if paper.link-video %}
	        <a href="{{paper.link-video}}" target="_blank" rel="noopener">
				<i class="fa fa-file-video-o" aria-hidden="true"></i> Video </a> 
			{% endif %}

			{% if paper.link-video1 %}
	        <a href="{{paper.link-video1}}" target="_blank" rel="noopener">
				<i class="fa fa-file-video-o" aria-hidden="true"></i> Video1 </a> 
			{% endif %}

			{% if paper.link-video2 %}
	        <a href="{{paper.link-video2}}" target="_blank" rel="noopener">
				<i class="fa fa-file-video-o" aria-hidden="true"></i> Video2 </a> 
			{% endif %}

			{% if paper.link-slides %}
	        <a href="{{paper.link-slides}}" target="_blank" rel="noopener">
				<i class="fa fa-files-o" aria-hidden="true"></i> Slides </a> 
			{% endif %}

			{% if paper.link-poster %}
	        <a href="{{paper.link-poster}}" target="_blank" rel="noopener">
				<i class="fa fa-file" aria-hidden="true"></i> Poster </a> 
			{% endif %}

		</p>
	</td>
  </tr>
</table>
{% endfor %}
{% endfor %}

---
## Open-source projects
<ul class="project-list">
    <li>
        <a href="https://github.com/nerfstudio-project/gsplat">
            <i class="fa fa-github" aria-hidden="true"></i> gsplat
        </a> — a modular reimplementation of the 3D Gaussian Splatting backend.
    </li>
    <li>
        <a href="https://github.com/nerfstudio-project/nerfstudio">
            <i class="fa fa-github" aria-hidden="true"></i> Nerfstudio
        </a> — maintainer on the collaborative Nerfstudio project, working to bring this technology to more users. Active on Discord (@maturk).
    </li>
</ul>

---
## Invited talks & events

Date | Event | Details
-----|-------|--------
June, 23rd 2026 | Google PhD Summit | Invited PhD event at the Google Zürich office.
Dec, 2nd 2024 | FCAI SIG Workshop| FCAI Special Interest Group, AI for Computer Vision workshop. Talk about 3D Vision research. [Link](https://fcai.fi/calendar/2024/12/3/fcai-sig-in-computer-vision-workshop)
April, 24th 2024 | FMX 2024  | Survey on NeRFs and 3DGS for the Lighting & Rendering track organized by [Christophe Hery](https://www.linkedin.com/in/christophehery/) in Stuttgart, Germany. Thank you all for the great time there!
May, 6th 2024 | Machine Learning Coffee Seminar | Finnish Center for Artificial Intelligence (FCAI) [talk](https://fcai.fi/calendar/2024/5/6/juho-kannala-tba) on neural rendering.
July, 6th 2024 | Gaussian splatting online meetup | Talk about Nerfstudio project for splatting enthusiasts. YouTube [link](https://www.youtube.com/watch?v=kfXrnkXiN8E).

---
<br>
> No man is an island, entire of itself; every man is a piece of the continent, a part of the main. And therefore never send to know for whom the bell tolls; it tolls for thee. - J. Donne