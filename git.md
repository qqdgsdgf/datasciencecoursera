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
- git add 
2. git commit -m "content"
3. git push origin localBranch: master

when you have multiple remote repos.
git push -u origin master


## reset 回退
git reset --hard 版本号

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


