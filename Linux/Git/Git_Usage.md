Git Usage
================================
Create by alex on 2018.05.07
--------------------------------

--------------------------------

# 1. Install

## 1. Install git
  - $ sudo apt update
  - $ sudo apt install git

## 2. Install tools
  - $ sudo apt install tig
  - $ sudo apt install git-cola
  - $ sudo apt install meld
  - $ sudo apt install colordiff
  - $ sudo apt install diffmerge

--------------------------------

# 2. Config

## 1. Config Scope
  - /etc/gitconfig  对所有用户有效
  - ~/.gitconfig 对当前用户有效
  - ./Project_Working_Dir/.git/config 仅对当前项目有效

## 2. Config common
  - $ git config --list
  - $ git config --global user.name "alex"
  - $ git config --global user.email "yxinsiva@e163.com"
  - $ git config --global core.editor emacs
  - $ git config --global core.editor vim
  - $ git config --global core.excludesfile ~/.gitignore
  - $ git config --global color.ui auto
  - $ git config --global alias.glog "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
  - $ git config -e [--global] 
  - $ git config [--global] user.name "[name]" $ git config [--global] user.email "[email address]"

## 3. Config Diff

### - difftool = meld
  - $ git config --global difftool.prompt true
  - $ git config --global alias.d difftool  
  - $ git config --global diff.tool meld
  - $ git config --global merge.tool meld
  - $ git d (hashid)

### - difftool = vimdiff
  - $ git config --global difftool.prompt true
  - $ git config --global alias.d difftool  
  - $ git config --global diff.tool vimdiff
  - $ git config --global merge.tool vimdiff
  - $ git d (hashid)

# 3. Creat Repository

## - Clone
  - $ git clone [url]
  - $ git clone https://github.com/yxinalex/Repository

## - Location
  - $ git init
  - $ git init [project_name]

## - Name 
  - Workspace：工作区
  - Index / Stage：暂存区
  - Repository：仓库区 或 本地仓库
  - Remote：远程仓库 

# 4. Add/Remove/Rename

## - 添加指定文件到暂存区
  - $ git add .
  - $ git add *.c *.h *.py
  - $ git add [file1] [file2] ... 
  - $ git add [dir] 

## - 删除工作区文件，并且将这次删除放入暂存区
  - $ git rm .
  - $ git rm -r *.obj
  - $ git rm -r *.obj *.bin *.doc *docx *.xls *.xlsx *.pdf *.graphml *.uml *.suo *.sdf *.opensdf *.idb *.pdb
  - $ git rm [file1] [file2] ... 
  - $ git rm [dir]

## - 停止追踪指定文件，但该文件会保留在工作区
  - $ git rm --cached [file]
  - $ git rm --cached .
  - $ git rm --cached -r [dir]
  - $ git rm --cached -r *.obj

## - 删除掉untracked状态的目录
  - $ git clean -fd  "使用git rm -rf dir 命令删除非空目录之后，本地还是会有空的目录存在，这时候空目录已经是untracked状态了, 再删除掉untracked状态的目录

## - 改名文件，并且将这个改名放入暂存区 
  - $ git mv [file-original] [file-renamed]

# 5. Commit

  - $ git commit -m "comments"   "提交暂存区到仓库区 
  - $ git commit [file1] [file2] -m "comments"   "提交暂存区的指定文件到仓库区 
  - $ git commit -a  "提交工作区自上次commit之后的变化，直接到仓库区 
  - $ git commit -a -m "comments"
  - $ git commit -v  "提交时显示所有diff信息 
  
  - $ git commit --amend "使用一次新的commit，替代上一次提交
  - $ git commit --amend -m "comments"  "如果代码没有任何新变化，则用来改写上一次commit的提交信息 

# 6. Branch
## - List
  - $ git branch      "列出所有本地分支 
  - $ git branch -r   "列出所有远程分支
  - $ git branch -a   "列出所有本地分支和远程分支 
## - Create
  - $ git branch [branch-name] "新建一个分支，但依然停留在当前分支 
  - $ git checkout -b [branch] "新建一个分支，并切换到该分支 
  - $ git checkout -b [branch] [tag] # 新建一个分支，指向某个tag 
  - $ git branch [branch] [commit] "新建一个分支，指向指定commit 
  - $ git branch --track [branch] [remote-branch] "新建一个分支，与指定的远程分支建立追踪关系 
  - $ git branch --set-upstream [branch] [remote-branch] "建立追踪关系，在现有分支与指定的远程分支之间 
## - Switch
  - $ git checkout [branch-name] "切换到指定分支，并更新工作区 
## - Delete
  - $ git branch -d [branch-name] "删除分支 
  - $ git push origin --delete  "删除远程分支 
  - $ git branch -dr "删除远程分支 

# 7. Tag
  - $ git tag       # 列出所有tag 
  - $ git tag [tag] # 新建一个tag在当前commit 
  - $ git tag [tag] [commit]  # 新建一个tag在指定commit 

# 8. Check
  - $ git status      # 显示有变更的文件 
 
  - $ git log         # 显示当前分支的版本历史  
  - $ git log --all
  - $ git log --graph
  - $ git log --stat  # 显示commit历史，以及每次commit发生变更的文件  
  - $ git log --follow [file] # 显示某个文件的版本历史，包括文件改名 
  - $ git whatchanged [file]  # 显示某个文件的版本历史，包括文件改名 
  - $ git log -p [file]   # 显示指定文件相关的每一次diff 
  - $ git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit

  - $ git reflog  # 显示当前分支的最近几次提交 
  - $ git blame [file]    # 显示指定文件是什么人在什么时间修改过 

  - $ git show --name-only [commit] # 显示某次提交发生变化的文件 
  - $ git show [commit]   # 显示某次提交的元数据和内容变化  
  - $ git show [tag] 
  - $ git show [tag] [commit]
  - $ git show [branch] 
  - $ git show [branch] [commit]

# 9. Diff

  - $ git diff  # 显示工作区和暂存区的差异 
  - $ git diff --stat       # 显示工作区和暂存区的差异 
  - $ git diff --cached []  # 显示暂存区和上一个commit的差异 
  - $ git diff HEAD    # 显示工作区与当前分支最新commit之间的差异 
  - $ git diff [first-branch]... [second-branch]  # 显示两次提交之间的差异  

# 10. Redo

# 11. Merge

  - $ git merge [branch] "合并指定分支到当前分支 
  - $ git cherry-pick [commit] "选择一个commit，合并进当前分支 

# 12. Remote

  - $ git clone [url]
  - $ git clone https://github.com/yxinalex/Repository

  - $ git remote -v # 显示所有远程仓库 
  - $ git remote show [remote]  # 显示某个远程仓库的信息 
  - $ git remote add [shortname] [url]  # 增加一个新的远程仓库，并命名 

  - $ git fetch [remote]  # 下载远程仓库的所有变动 
  - $ git pull [remote] [branch]  # 取回远程仓库的变化，并与本地分支合并 

  - $ git push [remote] [tag]     # 提交指定tag 
  - $ git push [remote] [branch]  # 上传本地指定分支到远程仓库 
  - $ git push [remote] --force   # 强行推送当前分支到远程仓库，即使有冲突 
  - $ git push [remote] --all     # 推送所有分支到远程仓库 
  - $ git push [remote] --tags # 提交所有tag 

