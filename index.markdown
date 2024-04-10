---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
email: matiasturkulainen@gmail.com
---
  <div class="row">
    <div class = "column">
      <img src="../assets/images/me-crop.jpg" class="profile-image">
    </div>
    <div class = "column">
      <div class = "center">
            {%- if site.github_username -%}<a href="https://github.com/{{ site.github_username| cgi_escape | escape }}"><svg class="svg-icon"><use xlink:href="{{ '/assets/minima-social-icons.svg#github' | relative_url }}"></use></svg> <span class="username">{{ site.github_username| escape }}</span></a>{%- endif -%}
            &nbsp;&nbsp;&nbsp;&nbsp;
            {%- if site.linkedin_username -%}<a href="https://www.linkedin.com/in/{{ site.linkedin_username| cgi_escape | escape }}"><svg class="svg-icon"><use xlink:href="{{ '/assets/minima-social-icons.svg#linkedin' | relative_url }}"></use></svg> <span class="username">{{ site.linkedin_username| escape }}</span></a>{%- endif -%}
        </div>
        <br>
      <p class = "right">
          I am originally from Finland. I am interested in computer vision, computer graphics and AI. 
      </p>
    </div>
  </div>
