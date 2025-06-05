# Setup Git on a local repository



clear;
echo "=================================================================="
echo "    SETUP GIT ON THIS COMPUTER"
echo "=================================================================="

echo
echo "-------------------------"
echo "   Git Project Variables"
echo "-------------------------"
echo
echo "Enter the project directory path: "
read answer

if [[ $answer == "." ]] 
  then
    gitRepoPath=$(pwd)    
else
    gitRepoPath=$answer    
fi

echo "The Git repo Library path is set to : "
gitRepoLibPath="$gitRepoPath/scripts"
echo $gitRepoLibPath
echo
echo


gitProfile="local"
gitConfigProfile=""
echo "The Git config profile is set to: $gitProfile"

# echo "Enter the Git config profile: (Local) or (Global)"
# read answer

# regex_pattern="(?-i)[l]+"
# if [[ $answer =~ regex_pattern ]]     # Using a REGEX filter

# if [[ $answer == l* ]] || [[ $answer == L*  ]]     # Using a simple expressing filter
#   then
#     gitProfile="local"
#     gitConfigProfile=""
# else
#     gitProfile="global"
#     gitConfigProfile="--global"
# fi

echo "Enter the user name: "
read username
echo "Enter the user email address: "
read userEmail
echo "Do you wish to set the default Git commit message template"
read answer

# regex_pattern="(?-i)[y]+"
#if [[ answer =~ $regex_pattern ]]

if [[ $answer == y* ]] || [[ $answer == y*  ]]     # Using a simple expressing filter
  then        
    if [ -e $gitRepoLibPath/gitmessage.txt ]
      then 
        gitDefaultCommitMsg="$gitRepoLibPath/gitmessage.txt"
        # mkdir $gitRepoPath/.git
        git init $gitRepoPath
        cp $gitDefaultCommitMsg $gitRepoPath/.git/.gitmessage.txt      
        gitCmdSetupCommitTemplate="commit.template $gitRepoPath/.git/.gitmessage.txt"
    else
      echo "No default Git Commit Message Template set !!"
    fi 
fi


echo ""
echo "----------------------------------"
echo "For this Git setup, you have defined"
echo "the Git profile: " $gitProfile
echo "the User Name: " $username
echo "the User Email: " $userEmail 
echo "the git commit default message: " 
cat $gitRepoPath/.git/.gitmessage.txt
echo "----------------------------------" 


gitCmdSetupUser="$gitConfigProfile user.name $username"
gitCmdSetupUserEmail="$gitConfigProfile user.email $userEmail"

echo "If this is information is correct, I will issue the following commands: " 
echo "1=> [ git config $gitCmdSetupUser ]"
echo "2=> [ git config $gitCmdSetupUserEmail ]"
#echo "3=> [ git config $gitCmdSetupCommitTemplate  ]"
echo
echo "do you wish to proceed ? [ Y/N "
read answer

#regex_pattern="(?-i)[y]+"
#if [[ $answer == $regex_pattern ]]

if [[ $answer == y* ]] || [[ $answer == Y*  ]]     # Using a simple expressing filter
  then
    gitCmd="git config $gitCmdSetupUser"
    eval $gitCmd

    gitCmd="git config $gitCmdSetupUserEmail"
    eval $gitCmd

    gitCmd="git config $gitCmdSetupCommitTemplate"
    eval $gitCmd
else
  echo "-----------------------------------------------------------------------------"
  echo "The information entered is invalid for this operation."
  echo "Please review the required information for this operation and try again"
  echo ""
  echo "[== ABORTING THE OPERATION ==]"
  echo "-----------------------------------------------------------------------------"
fi

# set the main branch to MAIN globally
git config --global init.defaultBranch main
# set the global diff behaviour
git config --global diff.algorithm histogram

echo
echo
echo
echo "-----------------------------------------------------------------------------"
echo "Git Setup Configuration Validation"
echo "git User Name: $(git config --get user.name)"
echo "git User Email: $(git config --get user.email)"
echo "-----------------------------------------------------------------------------"


# 0- Install git

# 1- Setup the user name
  # For All of the repositories on the computer
    # git config --global user.name "Mona Lisa"
  # For a specific repository
    # git config user.name "Mona Lisa"

# 2- Setup the user email
  # Globally
    # git config --global user.email johndoe@example.co
  # For a specific repo
    # git config user.email johndoe@example.co
