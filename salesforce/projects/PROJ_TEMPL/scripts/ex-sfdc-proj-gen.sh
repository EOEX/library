# generata a project and create a manifest file

# sf project generate --name mywork --default-package-dir myapp --manifest

clear;
echo "=================================================================="
echo "    CREATE A SFDX PROJECT"
echo "=================================================================="

echo "Enter the project name: "
read projName
echo "Enter the project directory path: "
read projDir

echo "----------------------------------"
echo "For this project, you have defined"
echo "the project name: " $projName
echo "the project directory: " $projDir
echo "----------------------------------" 

echo "If this is information is correct, do you wish to proceed ? [ Y/N ]"
read answer

if [ $answer == 'y' ] || [ $answer == 'Y' ] || [ $answer == 'YES' ] || [ $answer == 'YEs' ] || [ $answer == 'Yes' ] || [ $answer == 'yes' ]
  then
  sf project generate --name $projName --default-package-dir $projDir --manifest &>> script-log.txt 
else
  echo "-----------------------------------------------------------------------------"
  echo "The information entered is invalid for the creation of a Salesforce project"
  echo "Please review the required information for this operation and try again"
  echo ""
  echo "[== ABORTING THE OPERATION ==]"
  echo "-----------------------------------------------------------------------------"
fi
