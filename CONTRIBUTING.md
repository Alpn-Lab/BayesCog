# Contributing

We welcome contributions regarding content or with fixing errors on the current website. Making and committing these changes is simple.

Assuming you have cloned the repository and have [Quarto](https://quarto.org/) installed, you can preview any changes that you have in the browser by running:

`quarto preview`

If you are fortunate enough to have admin access (i.e., are a member of the ALPN Lab), you can just commit the changes:

```bash
git add .
git commit -m "your commit message"
git push origin main
```

And once the changes have been pushed, re-build the website by running:

`quarto publish gh-pages`

If you do not have admin privileges, you can commit the changes to the `main` branch by following the steps below:

```bash
# First, make sure you fork https://github.com/Alpn-Lab/BayesCog to your GitHub account

# Add the original as upstream
git remote add upstream https://github.com/Alpn-Lab/BayesCog.git

# Create and switch to a new branch for your changes
git checkout -b your-feature-name

# Add and commit your changes
git add .
git commit -m "Describe your changes here"

# Push to your fork
git push origin your-feature-name
```
You will then need to go to your fork on GitHub, where you'll see a prompt to "Compare & pull request" for your new branch. Click that to create a pull request to suggest your changes to the `main` repository.

If approved, we will both add the changes and you to the 'Contributors' list!
