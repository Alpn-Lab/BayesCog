# BayesCog - Bayesian Statistics and Hierarchical Bayesian Modeling for Psychological Science

[![GitHub repo size](https://img.shields.io/github/repo-size/lei-zhang/BayesCog_Wien?color=brightgreen&logo=github)](https://github.com/lei-zhang/BayesCog_Wien)
[![GitHub language count](https://img.shields.io/github/languages/count/lei-zhang/BayesCog_Wien?color=brightgreen&logo=github)](https://github.com/lei-zhang/BayesCog_Wien)
[![GitHub last commit](https://img.shields.io/github/last-commit/lei-zhang/BayesCog_Wien?color=orange&logo=github)](https://github.com/lei-zhang/BayesCog_Wien) 
<br/>
[![X (formerly Twitter) URL](https://img.shields.io/twitter/url?url=https%3A%2F%2Fx.com%2Flei_zhang_lz&label=lei_zhang_lz)](https://twitter.com/lei_zhang_lz)
[![X (formerly Twitter) URL](https://img.shields.io/twitter/url?url=https%3A%2F%2Fx.com%2FAamirNSohail&label=AamirNSohail)](https://twitter.com/AamirNSohail)

<p align="center">
  <img src="https://github.com/sohaamir/BayesCog/blob/main/images/introduction/bayes_banner.png" alt="Bayes Banner" width="90%">
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

## Setup

The course requires minimal set-up, however requires specific software:

1. Install the latest version of `R` [here](https://cloud.r-project.org/bin/macosx/) and RStudio [here](https://posit.co/download/rstudio-desktop/)

2. Install and set-up the latest version of RStan [here](https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started)

Then:

3. Clone the repository and change directory into the project root:

```bash
# Clone the repository
git clone https://github.com/your-username/BayesCog.git
cd BayesCog
```

4. Install the relevant `R` packages using `renv`

Open `R` in the project directory (`BayesCog.Rproj`) and run:

```r
source("setup.R")
```

After running this command once, the project environment will load automatically whenever you open the project.

## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/lei-zhang"><img src="https://avatars.githubusercontent.com/u/16256709?v=4?s=100" width="150px;" alt="Lei Zhang"/><br /><sub><b>Lei Zhang</b></sub></a><br /><a href="#maintenance-lei-zhang" title="Maintenance">🚧</a> <a href="#content-lei-zhang" title="Content">🖋</a></td>
       <td align="center" valign="top" width="14.28%"><a href="https://github.com/sohaamir"><img src="https://avatars.githubusercontent.com/u/35841800?v=4?s=100" width="150px;" alt="Aamir Sohail"/><br /><sub><b>Aamir Sohail</b></sub></a><br /><a href="#maintenance-sohaamir" title="Maintenance">🚧</a> <a href="#content-sohaamir" title="Content">🖋</a></td>
    </tr>
  </tbody>
</table>

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