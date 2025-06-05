# Configure Git on a local repository

clear;
echo "=================================================================="
echo "    CONFIGURE GIT ON THIS COMPUTER"
echo "=================================================================="

echo
echo "Enter the project directory path: "
read gitRepoPath
if [[ $gitRepoPath == '.' ]]
  then
    gitRepoPath=$(pwd)
    echo "current path: " $gitRepoPath
fi  

echo "The Git repo Library path is set to : "
gitRepoLibPath="/home/eoex/Documents/EOEX/CONSULTING/DEVELOPER/Salesforce/projects/Template-Proj"
echo $gitRepoLibPath

# copy library files to project directory
cp -rf $gitRepoLibPath/* $gitRepoPath
echo

echo "Enter the Git project source Repo: (downstream)"
read answer
if [[ $answer == d* ]] || [[ $answer == D* ]]
  then    
    # gitDownstream="https://github.com/EOEX/eoex-base-dev.git"   # set default repo vis HTTPS
    gitDownstream="git@github.com:EOEX/eoex-base-dev.git"   # set default repo via SSH
  else
  gitDownstream=$answer
fi
git remote rm downstream
git remote add downstream $gitDownstream
git pull downstream main   # updates/refresh main with the contents of the downstream repo



echo "Enter the Git project target Repo: (upstream)"
read answer
if [[ $answer == d* ]] || [[ $answer == D* ]]
  then    
    # gitUpstream="https://github.com/EOEX/eoex-client.git"   # set default repo via HTTPS
    gitUpstream="git@github.com:EOEX/eoex-client.git"   # set default repo via SSH
  else
  gitUpstream=$answer
fi
git remote add upstream $gitUpstream


# create the first branch (main)
echo
echo 
git checkout -b main                # branch where payload from the downstream repo are downloaded


# Create a first commit
echo 
echo 
echo "create readme file"
echo "Hello World !" > $gitRepoPath/doc/Readme.md

echo 
echo "==> current project directory view"
tree $gitRepoPath

echo
echo
echo "we are currently here:"
pwd

git add doc/
git add pack/

echo
echo
echo "-----------------------------"
echo "untracked files:"
git status
echo "Staging and Committing and all of the new contents on this repo"
echo
echo
git add .
git commit -m "First commit" .
echo "-----------------------------"


# create the other local branches
echo
echo
echo "-----------------------------"
git checkout -b integration                 # branch from where the final (ready) payload is pushed to the upstream repo
git checkout -b feature             # branch onto which the feature developments are created/edited
git checkout -b fix                 # branch onto which the bug fix developments are created/edited
git checkout -b stash               # branch onto which the "temporary" developments are saved/restored
git checkout -b archive             # branch onto which the feature-ready and fix-ready developments are saved/archived
# create the project domain context branches (the branches for each stage of development of the feature/fix)
git checkout -b 1-issue             # Phase 1: analyze the issue requirements
git checkout -b 2-design            # Phase 2: design the solution
git checkout -b 3-package           # Phase 3: prepare the solution packaging for deployment
git checkout -b 4-test              # Phase 4: TDD approach to development
git checkout -b 5-architecture      # Phase 5: plan the architecture of the solution
git checkout -b 6-code              # Phase 6: write the algorithm and code of the solution
git checkout -b 7-doc               # Phase 7: document the solution
git checkout -b 8-log               # Phase 8: compile all of the log files produced during the development and testing of the solution
git checkout -b 9-deploy            # Phase 9: deploy the solution bundle to the target upper repo branch (upstream)
git checkout main
echo "-----------------------------"


echo
echo
echo "-----------------------------"
echo "Set Tracking branches"          # !! IMPORTANT: make sure to have the local pc SSH connected to github repo!!
echo
git switch integration
echo
echo "git pull upstream to integration branch"
git pull upstream integration --rebase
echo
echo "push changes from integration branch to upstream"
git push -u upstream integration:integration



echo 
echo
echo "=================================================================="
echo "Project directory: $gitRepoPath"
echo "Project library directory: " $gitRepoLibPath
echo "------------------------------------------------------------------"
echo "For this Git config, you have defined"
echo "the project Downstream Repo: " $gitDownstream
echo "the project Upstream Repo: " $gitUpstream
echo "------------------------------------------------------------------"
echo "Show the list of local branches: "
git branch -vv
echo "Show the list of remote repositories: "
git remote -v
echo "=================================================================="

