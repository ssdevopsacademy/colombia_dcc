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

### Student SoftServe Jose Alcaraz
DevOps is currently a very important methodology for companies due to the benefits in the software development flow that it provides. I am very excited to learn about DevOps and acquire knowledge from people who have a lot of experience working with this topic.

### Juan Pablo Montoya Pareja
My expectations of the course is to know different DevOps tools and methodologies and meet how to apply them in the development process.

### Student SoftServe Luigi Giannandrea
My expectations about the SoftServe DevOps Crash Course are foucused in learning more about the Philosophy of DevOps, the most used tools and how this helps to the current clients to improve the software development life cycle. Thanks a lot!

### Luis Angel Naranjo
IT professionals often do not have a correct definition of the term DevOps. With this course I hope to learn everything related to this profile, its functions and good practices to have optimal developments in time and performance.

### Student SoftServe Karen Ramirez
Espero del curso poder adquirir conocimientos, manejo de herramientas, aprender acerca de las actitudes y habilidades para mi vida laboral y necesarias para desempeñarme como DevOps, aprender a trabajar en equipo, y aprender a solucionar problemas.

### Student Juan Calad
I want to learn a LOT of DevOps, branching strategies, tools, best practices, security, some automation and more.

### Student Juan Pabo Castañeda Marín SoftServe comment 1
Gain and improve devops skills than i been got it just by my self.

### Student Juan Pabo Castañeda Marín SoftServe comment 2
Gain advanced insight on how to build, market, and deliver the perfect solution for end-users. Create compelling digital experiences that will appeal to customers and increase revenue (i would say that i´m with this).

### Student Juan Pabo Castañeda Marín SoftServe comment 3
Help to create faster solutions with rights tools and knowlegde.

### Student Juan Pabo Castañeda Marín SoftServe comment 4
Be aware of tools that help me to understand security and learn about it.

### Andres Eduardo Lopez
my expectations of the course is to improve my current skills to be a more complete developer.
In general, our students say they expect to improve both their knowledge and skills of DevOps tools and processes.

### Andres Eduardo Lopez
my expectations of the course is to improve my current skills to be a more complete developer.

### Student SoftServe Giovanny Del Valle
#TODO Laboratory concluded, in this course I hope to know how the Devops role is practiced within a development team.

### Manuel Castaño
I expect from this course to strengthen my previous knowledge such as git, linux or docker. I hope to get started on topics that I have not covered before such as infrastructure as code, scripting, configuration management, among others, and finally I hope to learn a little about the day to day work as a devops engineer.

### Didier Vanegas

Learn the fundamentals of the different tools and patterns used in DevOps and apply that knowleged to my day to day work

### Miguel Bastidas

my expectations of this course is get knowledge about how depovs is implemented in big projects and what would be the best practices to follow for get a good sofware product, also as developer how should be the practices i have to follow to obtain a good relation with the operations deparment

### Giovanny Del Valle
I expect this course to teach me how to practice the Devops role within a development team and also to strengthen my previous knowledge.

---
### ARE YOU FINDING A MERGE CONFLICT HERE? TODO: SOLVE IT, merge and commit only with your feature branch, then create a PR to Main. A Mentor is going to Approve your PR. Please NOT MERGE it by yourself

<br>

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
