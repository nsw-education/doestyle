# Contributing

When contributing to `doestyle`, please discuss the change you wish to make via the [project's kanban board](https://nsw-education.atlassian.net/jira/software/c/projects/DOES/boards/1013), in [its Teams channel](https://teams.microsoft.com/l/channel/19%3Ab8e6ff4d3c1b4d9ebcba76af4e8c0f42%40thread.tacv2/doestyle?groupId=1c2dd9eb-a6ae-4724-b4e1-25838f4c126a&tenantId=05a0e69a-418a-47c1-9c25-9387261bf991), or even [email](mailto:samuel.gardiner7@det.nsw.edu.au;Jonathan.McGuire1@det.nsw.edu.au).

If you're not sure how to get started, please read [Setting up your development environment](#markdown-header-setting-up-your-development-environment), [Contribution workflow - tutorial](#markdown-header-contribution-workflow-tutorial) and watch [the video walkthrough](https://schoolsnsw.sharepoint.com/:v:/s/DataVisWorkingGroup/EYthJPlfW4ZOhP-6aT0JrMABgWWB2bX_sEOVSlPMwlZwWg?e=OxCP6i&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0%3D). If you're comfortable with Git and with working on open source software, you can probably skip down to [Conventions](#markdown-header-conventions).

## Code of Conduct

We follow the [NSW Department of Education Code of Conduct](https://education.nsw.gov.au/rights-and-accountability/department-of-education-code-of-conduct).

Most importantly, please be kind to potential contributors. We have R users and developers from across the entire spectrum of experience, and we want to foster a safe environment - and hopefully the desire to engage with other open source software projects.

## Setting up your development environment

You will need R (>=4.1), RStudio (>=2024.12) and Git. On DoE devices, you can install them from Company Portal.

Clone the `doestyle` Git repository: `https://bitbucket.org/nsw-education/doestyle`. If you're not a confident Git user, the easiest way to do this will be in RStudio:

1. Navigate to File -> New Project -> Version Control -> Git
2. Paste `https://bitbucket.org/nsw-education/doestyle` in the 'Repository URL' field
3. Use the 'Browse' button to choose a directory on your computer to hold the `doestyle` RStudio project directory.
4. Click 'Create Project'. RStudio and Git will clone the project and open the project in RStudio, ready for use.

To check that your development environment is set up, you can try building the `doestyle` package. With the `doestyle` RStudio project open, navigate to Build -> Install Package (or use Ctrl+Shift+B, on Windows). RStudio should initiate the package build and installation. You will be able to see the progress in RStudio's 'Build' pane.

You'll generally only need to clone the repository once. In the future, when you want to work on `doestyle`, you can open the RStudio project from the directory you chose when cloning. When you do this, you usually start your work by using 'Pull' in the Git pane to ensure that you are working with the current state of the `doestyle` repository.

## Contribution workflow - tutorial

There are many workflows that will achieve similar outcomes, but this is a simple approach to contributing a feature or a bugfix. This is also similar to the workflow used by most open source software in the wild. The general process will be:

1. Create a branch for your work
2. Work on your new branch in RStudio
3. Open a Bitbucket pull request to merge your work into `doestyle`

The [accompanying video tutorial](https://schoolsnsw.sharepoint.com/:v:/s/DataVisWorkingGroup/EYthJPlfW4ZOhP-6aT0JrMABgWWB2bX_sEOVSlPMwlZwWg?e=OxCP6i&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0%3D) demonstrates this workflow.

If at any point you are prompted by Git or Bitbucket to log in, choose 'Authenticate with browser' and log in using the usual DoE single-sign-on process.

### Create a branch for your work

Because `doestyle` is in use, we make changes in new Git branches, rather than changing the released production code that is in use. This lets us test and check the new code before making it available for everyone as a new release.

Select or create an issue from the [`doestyle` Jira kanban board](https://nsw-education.atlassian.net/jira/software/c/projects/DOES/boards/1013), and using the Jira interface, create a new Git branch for your work:

1. Click on the issue in Jira to open it.
2. In the issue's right-hand 'Details' panel, under 'Development', click 'Create branch' and then 'Create branch in Bitbucket Cloud'.
3. Add some details for your new branch and click 'Create':
    - 'Repository' should already be set to `nsw-education/doestyle`.
    - Set the 'Type' as appropriate for what you want to work on - most likely 'Feature' or 'Bugfix'.
    - The 'From branch' should almost always be 'main', in our current branching model. This represents the starting state of your new branch.
    - 'Branch name' will have an automatic name based on the Jira issue you chose, but you can alter it to make it shorter or more readable. Make sure you leave the issue ID (e.g. `DOES-XX`) intact at the front of the branch name, as this helps link your code to the Jira issue.

### Work on your new branch in RStudio

1. Open the `doestyle` RStudio project that you cloned in [Setting up your development environment](#markdown-header-setting-up-your-development-environment), above.
2. Run `git pull` or `git fetch` to retrieve the current state of the repository. The easiest way to do this is to click 'Pull' in RStudio's Git pane.
3. Switch to your new branch. The easiest way to do this is in the RStudio Git pane:
    - In the top right corner of the Git pane, you'll see the name of the current branch - most likely, `main`.
    - Click on the drop-down to see a list of branches.
    - Under `(REMOTE: ORIGIN)` you should see the branch you created. Click on your branch to switch to it. RStudio will show you the output of the Git command. Once you see output that looks like `Switched to new branch [your new branch name]`, you can close the Git output window.
4. Add, remove or edit code as needed to implement your change.
5. As you work, commit your changes to your branch:
    - Save the file(s) you're working on.
    - In the RStudio Git panel, click the checkbox next to any file that you want to include in the commit.
    - Click the 'Commit pending changes' button. Depending on your screen resolution and size of the your Git panel, the button may not be labelled. In RStudio 2024.12, the button looks like a checkbox with a tick.
    - Write a commit message to describe the change. The first line of the commit message should be a short description of the change. Ideally, use the imperative mood (as if you were telling the computer what to do), because this produces commit messages that are shorter and easier to read. For example, the commit message associated with adding this guide will be something like "Add contributor's guide".
6. It's typical to make a series of commits as you work on a new feature. Choosing appropriate chunks of work to commit is up to you, and is a skill you will develop with practice. A nice goal is to have your commits tell a sensible, sequential story about how you implemented your feature or fix, but don't get too hung up on this.
7. When you are ready to include your committed code in the `doestyle` package, use `git push` to push your branch back to the central Bitbucket Git repository. The easiest way to do this is with the 'Push' button in RStudio's Git pane.

### Open a Bitbucket pull request to merge your work into `doestyle`

Every time you `git push` to the central `doestyle` repository on Bitbucket, Bitbucket runs a series of tests to make sure that the new code works and that the package can still be built. If the automated tests pass, you'll be able to request that your new code be merged into `doestyle` in a process called a 'pull request'.

1. In your browser, navigate to the [list of branches for nsw-education/doestyle](https://bitbucket.org/nsw-education/doestyle/branches/). You should see your branch in the list.
2. In the 'Pull request' column, click 'Create'.
3. Add details for your pull request. Bitbucket will automatically populate the source branch (ie. the branch you've been working on), the destination branch (main), title, description and reviewers, but you can update to clarify if needed.
4. Click the 'Create pull request' button to create the pull request and notify the reviewers.
5. A reviewer will either:
    - Approve the pull request, in which case your code will be merged into the `main` branch and become part of `doestyle`.
    - Start a conversation with you to request changes to your branch until it is ready to merge.

Congratulations - you just contributed to an open source software project!

## Conventions

This section may be worth a quick read if you don't need a tutorial.

### Git branching model

We use a [feature branch](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow) workflow. Any new feature, fix, documentation or other change should be made in a new branch. We use branch name prefixes to denote the type of work: `feature/`, `bugfix/`, `hotfix/` etc.

Branches can be merged into `main` via pull request after they have passed automated testing and been approved by a reviewer. 

### Versioning and releases

We try to use [semantic versioning](https://semver.org/). In-development versions should have the same version number as the last release, with an [additional version suffix starting with 9](https://r-pkgs.org/lifecycle.html#sec-lifecycle-version-number-tidyverse) - e.g. 0.2.1.9000.

### Continuous integration and testing

Continuous integration (CI) is run on every push, for any branch, using a Bitbucket pipeline defined in [`bitbucket-pipelines.yml`](./bitbucket-pipelines.yml). The pipeline builds `doestyle` and runs [R CMD check](https://r-pkgs.org/R-CMD-check.html), including any tests defined in the `tests` directory. We use the [`testthat`](https://testthat.r-lib.org/) framework to write unit and regression tests. Contribution of tests is very welcome!

The CI environment is a Docker container based on the [rocker/tidyverse](https://rocker-project.org/images/versioned/rstudio.html) image. Any dependencies as specified in [DESCRIPTION](./DESCRIPTION) are installed within the CI environment prior to it building or testing `doestyle`.

Pull requests cannot be merged into `main` until the CI pipeline has succeeded.

### Style and other conventions

Please use the [tidyverse style guide](https://style.tidyverse.org/) for your code. It is a good idea to run [`styler`](https://styler.r-lib.org/) over your code before submitting a pull request - this means you don't have to think too much about code style, and can just let `styler` take care of it.

Where possible, please use the native pipe, `|>`, over the `magrittr` pipe, `%>%`.
