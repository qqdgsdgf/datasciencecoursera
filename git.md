# Git Tutorial

origin: remote repo
master: local repo

## clone
It supports HTTPS, SSH, Git. 

- git clone https://github.com/qqdgsdgf/datasciencecoursera.git

## remote
git remote 
It displays all the remote repos.

git remote -v
It displays the addresses of remote repos.

git remote add origin https://github.com/qqdgsdgf/datasciencecoursera.git

git remote rm origin https://github.com/qqdgsdgf/datasciencecoursera.git

git remote rename origin https://github.com/qqdgsdgf/datasciencecoursera.git


## pull
It is equivalent to fetch and merge.

1. pwd
2. cd the right directory
3. git pull origin master;  git pull origin remoteBranch: master


## push
1. add files
- git add .
2. git commit -m "content"
3. git push origin localBranch: master

when you have multiple remote repos.
git push -u origin master


## reset 回退
遇到大文件上传限制的解决：
1. http://www.cnblogs.com/qmmq/p/4604862.html
2. https://www.cnblogs.com/NewBigLiang/p/7015887.html

- git reset --hard 版本号 (版本号可以在git log, git reflog中查到)
- git reset 版本号 (撤销到某commit)

## checkout
git checkout --fileName


## branch
git branch
git branch name
git branch -d name // delete


## others
- git status
- git log
- git reflog


