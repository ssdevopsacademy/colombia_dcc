Malcak (Manuel)             |  SoftServe
:-------------------------:|:-------------------------:
<img src="https://avatars.githubusercontent.com/u/59063272?v=4" width="100" height="100" alt="Malcak GitHub Avatar">  |  ![SoftServe](https://media-exp2.licdn.com/dms/image/C4E0BAQEhqEYDn2-LkA/company-logo_100_100/0/1580391093627?e=1663200000&v=beta&t=EO7vueG3ailmZ1RfTbu4knkfQGiqf5LZa1RJ90nt5do)

# DevOps Crash course - GIT From Zero
## Welcome to Git Laboratory - Module 1

In this file you will find my solutions to the 2 tasks proposed in the [README](../README.md) file.

---

### 1. GIT is a type of Version Control System?
- A. True ✅
- B. False
> It is also a distributed, allowing to have remote repositories in which to share all the history (or versions) that our repository has gone through.

### 2. The following are examples of git tools:
- A: Apache Subversion, GitLab, GitHub
- B: Bitbucket, Gitlab, Github, monotone, CVS
- C: Mercurial, Monotone, Apache Subversion, Bazaar, CVS
- D: Bitbucket, GitLab, Github, Git ✅
> Github, Gitlab and Bitbucket are services that allow storing and managing remote repositories (mainly, but they also offer many other functions in their services).
> > Git is a Git tool? other examples of tools are: Gitkraken or Gitlens (in vscode).

### 3. What is the versioning strategy / workflow that only has one main branch
- A. Git-Flow
- B. feature Branches
- C. Trunk-based development ✅
> I think some teams may prefer this way of working to avoid merger hell.

### 4. the difference between "Commit" and "Add" commands is:
- A. "Commit"" save all staged changes and "Add" includes a change in the working directory ✅
- B. "Add" save all staged changes and "Commit" includes a change in the working directory
- C. "Commit" save all staged changes and "Add" only save one staged change
> The `git add` command adds changes from the working directory to the staging area and the `git commit` command commits changes found in the staging area to the local repository, but unstaged changes may still exist in the working directory.

