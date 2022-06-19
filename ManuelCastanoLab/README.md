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

### 5. Create a working copy of a local Github repository:
- A. clone git /path/to/repository
- B. git /path/to/repository clone
- C. git clone /path/to/repository ✅
- D. github clone /path/to/repository
> `git clone` can clone either local or remote repositories.

### 6. Add one or more files to staging (index) to Github:
- A. github add *
- B. git * add *
- C. git add * ✅
- D. git push add *
> Another alternative could be `git add .` (where `.` is the current directory) as long as we are standing on the root directory of our repository.

### 7. Send changes to the master branch of your remote  Github repository:
- A. github push origin master
- B. git push origin moster
- C. git push oragun master
- D. git push origin master ✅
> This not only works for Github, this command sends the changes to the remote repository we have set with the name `origin` and to the `master` branch no matter if our remote repository is on github, gitlab, or any other.

### 8. In SCRUM, usually the User Stories are translated to the Technical Team as:
- A. Features branches ✅
- B. Hot Fixes and Bug Fixes Branches
- C. Master Branches
- D. A & B 
> I'm not sure if a hotfix or a bugfix can be user stories by themselves, because they are usually born from a flaw in the design or implementation of another story.

### 9. Merge conflicts are:
- A. Normal events that occurs when Git is unable to automatically resolve differences in code between two commits. ✅
- B. Code build Errors
- C. Feature branch code with bad structure, and git is unable to automatically resolve it. Developers have to delete the feature branch.
- D. A & C
> It is a good practice that when we are resolving a conflict we are in communication with the people in the team whose work may be affected.

