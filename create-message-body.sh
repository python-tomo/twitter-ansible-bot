ansible-doc -l | awk '{print $1}' > list.txt
  
# Get total number of modules
total_number=$(cat list.txt | wc -l)
echo ${total_number}

# Set module number
module_number=$(echo $(($RANDOM % ${total_number})))
echo ${module_number}

# Set module name by random number
module=$(sed -n ${module_number}p list.txt)
echo ${module}

# Get module name
ansible-doc ${module} -j | jq ".${module}.doc.module" > module.txt

# Get short_description
ansible-doc ${module} -j | jq ".${module}.doc.short_description" > short_description.txt

# Get supported_by 
ansible-doc ${module} -j | jq ".${module}.metadata.supported_by" > supported_by.txt

# Get version_added 
ansible-doc ${module} -j | jq ".${module}.doc.version_added" > version_added.txt
