# BayesCog - Bayesian Statistics and Hierarchical Bayesian Modeling for Psychological Science

![Visitors](https://pageview.vercel.app/?github_user=alpn-lab/BayesCog)
[![GitHub contributors](https://img.shields.io/github/contributors/alpn-lab/BayesCog.svg)](https://github.com/alpn-lab/BayesCog/graphs/contributors) 
[![GitHub last commit](https://img.shields.io/github/last-commit/alpn-lab/BayesCog?color=orange&logo=github)](https://github.com/alpn-lab/BayesCog)
[![GitHub repo size](https://img.shields.io/github/repo-size/alpn-lab/BayesCog?color=brightgreen&logo=github)](https://github.com/alpn-lab/BayesCog)
<br/>

<p align="center">
  <img src="https://github.com/alpn-lab/BayesCog/blob/main/images/introduction/bayes_banner.png" alt="Bayes Banner" width="90%">
</p>

This website[^1] is an adapted version of teaching materials originally made for the <ins>award winning</ins>\* **BayesCog** seminar at the [Faculty of Psychology](https://psychologie.univie.ac.at/), [University of Vienna](https://www.univie.ac.at/en/), as part of the Advanced Seminar for master's students (Mind and Brain track; recorded during Summer Term 2020/2021).
Further content from the [BayesCog workshop at UKE Hamburg](https://github.com/lei-zhang/BayesCog_Part1) (2023) have also been added. 

**Recording**: Recordings from the original version of the course are available on [YouTube](https://www.youtube.com/watch?v=8RpLF7ufZs4&list=PLfRTb2z8k2x9gNBypgMIj3oNLF8lqM44-).
The most recent recording from the 2021 summer semester is also available on [YouTube](https://youtube.com/playlist?list=PLfRTb2z8k2x8ZCqDJ0WEFNs2ymXQCliLa).

**Outreach**: [**Twitter thread**](https://twitter.com/lei_zhang_lz/status/1276506555660275714?s=20) (being **liked 700+ times** on Twitter) summarizing the contents of the course. 

**Award/Recognition**: The original course received a commendation award from the [Society for the Improvement of Psychological Science (SIPS)](https://improvingpsych.org/mission/awards/) (also see a [tweet](https://twitter.com/improvingpsych/status/1323269273033281538?s=20)), as well as an ECR Teaching Award from the [Faculty of Psychology, University of Vienna](https://ecr-psychology.univie.ac.at/news/).

## Table of contents

- [Course Summary](#course-summary)
- [List of folders and contents](#-folders-content)
- [Setup](#setup)
- [Contributors](#contributors)
- [License](#-license)
- [Citing](#citing)
- [Contact](#contact)

## Course summary

Computational modeling and mathematical modeling provide an insightful quantitative framework that allows researchers to inspect latent processes and to understand hidden mechanisms. Hence, computational modeling has gained increasing attention in many areas of cognitive science through **cognitive modeling**. One illustration of this trend is the growing popularity of Bayesian approaches to cognitive modeling. To this end, this course teaches the theoretical and practical knowledge necessary to perform, evaluate and interpret Bayesian modeling analyses, with a specific emphasis towards modeling latent cognitive processes. 

In the course, students will be formally grounded in key principles of cognitive modeling including Bayesian statistics, statistical distibrutions and reinforcement learning. 
We will use [R/RStudio](https://posit.co/download/rstudio-desktop/) and a newly developed statistical computing language - [Stan](mc-stan.org) - to perform Bayesian analyses, ranging from simple binomial models and linear regression models to more complex hierarchical reinforcement learning (RL) models.

## List of folders and contents

Folder | Task | Model
-----  | ---- | ----
01.R_basics |NA | NA
02.binomial_globe | Globe toss | Binomial Model
03.bernoulli_coin | Coin flip  | Bernoulli Model
04.regression_height | Observed weight and height | Linear regression model
05.regression_height_poly |  Observed weight and height | Polynomial regression model
06.reinforcement_learning  | 2-armed bandit task |   Simple reinforcement learning (RL)
07.optm_rl   | 2-armed bandit task |   Simple reinforcement learning (RL)
08.compare_models | Probabilistic reversal learning task |  Simple and Fictitious RL models
09.debugging |  Memory Retention | Exponential decay model
10.model_based |  WIP | WIP
11.delay_discounting |  WIP | WIP

## Set-up

There is no additional set-up needed if you aim to work solely from the website. However, to work on the exercises yourself, several software and packages are required. 

### Locally using RStudio and `renv`

You can work with the course material by **installing the software and packages locally.** To do this:

- Install the latest version of `R` [here](https://cloud.r-project.org/bin/macosx/) and RStudio [here](https://posit.co/download/rstudio-desktop/)

- Install and set-up the latest version of RStan [here](https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started)

To create the environment, first clone the repository and change to the project directory:

```bash
git clone https://github.com/alpn-lab/BayesCog.git
cd BayesCog
```

The various analyses across the workshops require specific packages to be installed. This project uses `renv` to manage package dependencies. 

To set up the environment, firstly open `RStudio` in the project root and run in the console:

```r
source("setup.R")
```

After executing this command once, the project environment will **load automatically whenever you open the project,** for both project root and individual workshops. 
All you need to do is to load the packages required for the relevant scripts when necessary e.g., `library(rstan)`.

> You can always check if you are missing a certain package by clicking on the 'Packages' tab (next to 'Files/Plots' tab) or by running `library()`.

### Building the Docker image

We also provide a Docker image which can be used to create an R/RStudio container with the required packages. This assumes you have [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed.

To do so, after cloning the `git` repository as above, from the project root run:

```bash
docker pull sohamir/bayescog:latest

docker run -p 8787:8787 \
  --mount type=bind,source=$(pwd),target=/home/rstudio/project \
  -e PASSWORD=your_chosen_password \
  --name bayescog \
  sohamir/bayescog
```

This will mount the Docker image onto the BayesCog repository. 

Then, navigate to [http://localhost:8787](http://localhost:8787/) in a browser, and type your username (which is always 'rstudio') and the password chosen in the command prior.

Then once RStudio has loaded, click on the `project` folder and the BayesCog material will appear.

To start/stop the container, type (from the command line):

```bash
docker start bayescog
docker stop bayescog
```

To see/remove the container type:

```bash
docker ps -a
docker rm your_docker_image
```

And to see/remove the image, type:

```bash
docker images
docker rmi your_docker_image # e.g. docker rmi sohamir/bayescog
```

## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="http://lei-zhang.net"><img src="https://avatars.githubusercontent.com/u/16256709?v=4?s=100" width="100px;" alt="Dr. Lei Zhang"/><br /><sub><b>Dr. Lei Zhang</b></sub></a><br /><a href="https://github.com/Alpn-Lab/BayesCog/commits?author=lei-zhang" title="Code">💻</a> <a href="#maintenance-lei-zhang" title="Maintenance">🚧</a></td>
    </tr>
  </tbody>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://allcontributors.org) specification.

## License

This course is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-sa/4.0/deed.en).

You are free to share, copy, and redistribute the material in any medium or format. Additionally, you can adapt, remix, transform, and build upon the material for any purpose, including commercial use.
However, you must provide appropriate attribution, including credit to the original source, a link to the license, and an indication if changes were made. Furthermore, if you remix, transform, or build upon the material, you are required to distribute your contributions under the same license as the original.

<img src="images/introduction/cc_by_sa.png" width="10%">


## Citing

If you use materials from this course in your work or research, please cite it as:

Zhang, L., & Sohail, A. (2025). BayesCog: Bayesian Statistics and Hierarchical Bayesian Modeling for Psychological Science [Online course]. Zenodo. https://doi.org/[DOI_HERE]

For BibTeX users:

```tex
@online{zhang_sohail_2025,
    title = {BayesCog: Bayesian Statistics and Hierarchical Bayesian Modeling for Psychological Science},
    author = {Zhang, Lei and Sohail, Aamir},
    year = {2025},
    publisher = {Zenodo},
    doi = {DOI_HERE},
    url = {ZENODO_URL},
    note = {Online course},
    repository = {https://github.com/REPOSITORY_URL}
}
```

Note: Once this course is published on Zenodo, this citation information will be updated with the corresponding DOI and URL.

## Contact

For bug reports, issues or comments, please contact [Lei Zhang](mailto:lei.zhang.13@bham.ac.uk), or [Aamir Sohail](mailto:axs2210@bham.ac.uk), or open a thread on the GitHub repository.

[^1]: Bayes' photo credit: Burrsettles (2016). The three faces of Bayes. Slackprop.