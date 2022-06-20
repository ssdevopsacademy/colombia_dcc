![N|Solid](https://media-exp2.licdn.com/dms/image/C4E0BAQEhqEYDn2-LkA/company-logo_100_100/0/1580391093627?e=1663200000&v=beta&t=EO7vueG3ailmZ1RfTbu4knkfQGiqf5LZa1RJ90nt5do)

# DevOps Crash course -​ GIT From Zero
## Welcome to Git Laboratory - Module 1

### Tasks
1. Answer the following questions in a new README file in a new folder. Use the path: NameLastnameLab/README.md
2. Do the changes required in this readme file, find the "TODO:" section

---
### 1. GIT is a type of Version Control System?
- A. True <br>
- B. False <br>

### 2. The following are examples of git tools:
- A: Apache Subversion, GitLab, GitHub <br>
- B: Bitbucket, Gitlab, Github, monotone, CVS <br>
- C: Mercurial, Monotone, Apache Subversion, Bazaar, CVS <br>
- D: Bitbucket, GitLab, Github, Git <br>

### 3. What is the versioning strategy / workflow that only has one main branch
- A. Git-Flow
- B. feature Branches
- C. Trunk-based development 

### 4. the difference between "Commit" and "Add" commands is:
- A. "Commit"" save all staged changes and "Add" includes a change in the working directory
- B. "Add" save all staged changes and "Commit" includes a change in the working directory
- C. "Commit" save all staged changes and "Add" only save one staged change

### 5. Create a working copy of a local Github repository:
- A. clone git /path/to/repository
- B. git /path/to/repository clone 
- C. git clone /path/to/repository 
- D. github clone /path/to/repository 

### 6. Add one or more files to staging (index) to Github:
- A. github add *
- B. git * add * 
- C. git add * 
- D. git push add * 

### 7. Send changes to the master branch of your remote  Github repository:
- A. github push origin master
- B. git push origin moster
- C. git push oragun master
- D. git push origin master

### 8. In SCRUM, usually the User Stories are translated to the Technical Team as:
- A. Features branches
- B. Hot Fixes and Bug Fixes Branches
- C. Master Branches
- D. A & B

### 9. Merge conflicts are:
- A. Normal events that occurs when Git is unable to automatically resolve differences in code between two commits.
- B. Code build Errors
- C. Feature branch code with bad structure, and git is unable to automatically resolve it. Developers have to delete the feature branch.
- D. A & C

### 10. Exists two Git Workflow used in DevOps Practices:
- A. Git tree-flow & gitFly
- B. Gitflow and Trunk-based development 
- C. Git Master and Trunk-based development 
- D. Git-tree flow & gitflow 

---
## ¡Thanks Guys for beaing Part of the SoftServe Crash Courses! 
## Made with ❤ by 
![N|Solid](https://mms.businesswire.com/media/20211116006314/es/832960/4/SoftServe_Logo_2.jpg)

---
## Students Comments - What are your expectations of the course?


### Andrés Restrepo Cadavid
Learn about something new for me, improve my programming basic knowledge and expand to new fields of work. 

### Luigi Giannandrea
Learn about the hole DevOps cycle and how it is applied in current customers. Get a clear view about each technology related with this discipline and be prepared to apply this knowledge into our careers.

### Jose Alcaraz
DevOps is currently a very important methodology for companies due to the benefits in the software development flow that it provides. I am very excited to learn about DevOps and acquire knowledge from people who have a lot of experience working with this topic.
### Julian gallo Londoño
I Expect to really improve my knowledge in DevOps tools and practices as right now is a little confusing for me as developer

### Juan Pablo Montoya Pareja
My expectations of the course is to know different DevOps tools and methodologies and meet how to apply them in the development process.

---

## How the git merge conflict was fixed by [Jose Alcaraz](https://github.com/JoseAlcarazA "Jose Alcaraz")
A git merge conflict, like the one presented in this case, is due to two developers modifying the same lines in a file, the first developer merges his changes. When the second developer goes to update his branch with the latest changes from the repository conflict is generated.
To solve it, git provides help indicating which is the file that presents the conflict

*Example:*
>`Auto-merging README.md` <br>
`CONFLICT (content): Merge conflict in README.md` <br>
`Automatic merge failed; fix conflicts and then commit the result` <br>

Also, inside the file, it shows which lines have the problem.

*Example:*
>`<<<<<<< HEAD` <br>
`(Current Change)` <br>
`=======` <br>
`(Incoming Change)` <br>
`>>>>>>>`

You must choose the content between **"<<<<<<< HEAD y ======="** (Local branch changes) and **"======= y >>>>>>"** content present in the remote main branch.
After choosing what information should be left in the file, changes must be saved.
Now, you can add the changes and make a commit. Once this is done, the conflict will be resolved, and you can make the pull request to the main branch without any problem.

*Commands:*
>`git add .` <br>
`git commit -m "message"` <br>
`git push origin branch` <br>

---