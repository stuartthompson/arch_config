#!/bin/bash

# Function to print a blob object
print_blob() {
    local hash=$1
    local content=$(git cat-file -p $hash)
    local preview=${content:0:80}
    format_blob_size $hash
    if [ "$compact_mode" == true ]; then
        printf "\033[94mblob \033[0m%s\n" "${preview}"
    else
        printf "\033[94m** Blob: %s **\033[0m\n" "$hash"
printf "  Size: %s\n" "$blob_size"
printf "%s" "$preview"
if [ "${#content}" -gt 80 ]; then
   printf "..."
fi
printf "\n"
    fi
}

# Function used to get the size of a blob
format_blob_size() {
    local hash=$1
    local size=$(git cat-file -s $hash)

    if [ "$size" -gt 1000000 ]; then
        # Convert to megabytes
        size=$((size / 1000000))
        blob_size="${size}m"
    elif [ "$size" -gt 1000 ]; then
        # Convert to kilobytes
        size=$((size / 1000))
        blob_size="${size}k"
    else
        blob_size="${size}b"
    fi
}

# Function to print a tree object
print_tree() {
    local hash=$1
    local tree_details=$(git cat-file -p $hash)
    local file_count=0
    local folder_count=0

    if [ "$compact_mode" == false ]; then
        printf "\033[32m<< Tree: %s >>\033[0m\n" "$hash"
    fi

    while read -r line; do
        read -ra parts <<< "$line"
local hash=${parts[2]}
local short_hash=${hash:0:6}
local name=${parts[3]}
if [ "${parts[1]}" == "blob" ]; then
   format_blob_size $hash
   local blob_content=$(git cat-file -p $short_hash)
   local preview=${blob_content:0:40}
   if [ "$compact_mode" == true ]; then
if [ "$expand_mode" == true ]; then
   # Compact, expand (inline)
   printf "\033[34mblob \033[94m%s \033[97m%-16s \033[35m%5s \033[0m%s\n" "$short_hash" "$name" "$blob_size" "$preview"
else
   # Compact
           printf "\033[34mblob \033[94m%s \033[97m%-16s \033[35m%5s\033[0m\n" "$short_hash" "$name" "$blob_size"
fi
   else
       printf "\033[34mblob \033[94m%s \033[97m%-16s \033[35m%5s\033[0m\n" "$short_hash" "$name" "$blob_size"
if [ "$expand_mode" == true ]; then
   # Normal, expand (preview on next line)
   printf "%s" "$preview"
   if [ "${#blob_content}" -gt 40 ]; then
printf "..."
   fi
   printf "\n"
fi
   fi
else
   printf "tree"
fi
    done <<< "$tree_details"
}

# Function to print a commit object
print_commit() {
    local hash=$1
    local commit_details=$(git cat-file -p $hash)
    local parent_hashes=""

    # Extract commit object content
    while read -r line; do
        if [[ $line == tree* ]]; then
            local long_tree_hash=${line#tree }
            local tree_hash=${long_tree_hash:0:6}
        elif [[ $line == parent* ]]; then
            local parent_hash=${line#parent }
            parent_hashes+="${parent_hashes:+, }${parent_hash:0:6}"
        elif [[ $line == author* ]]; then
            local author=${line#author }
   local email=${author#*<}
   email=${email%>*}
elif [[ $line == committer* ]]; then
   local committer=${line#committer }
else
   local message=$line
        fi
    done <<< "$commit_details"
 
    # Print commit object content
    if [ "$compact_mode" == true ]; then
        printf "\033[37mcommit \033[33m%s \033[32m%s \033[31m%s \033[35m%s\033[0m\n" "$parent_hashes" "$tree_hash" "$email" "${message:0:24}"
    else
        printf "\033[33m[[ Commit: %s ]]\033[0m\n" "$hash"
printf "  \033[37mParents: \033[33m%s\033[0m\n" "$parent_hashes"
printf "     \033[37mTree: \033[32m%s\033[0m\n" "$tree_hash"
printf "   \033[37mAuthor: \033[31m%s\033[0m\n" "$author"
printf "\033[37mCommitter: \033[31m%s\033[0m\n" "$committer"
printf "  \033[37mMessage: \033[97m%s\033[0m\n" "$message"
    fi

    # Check for expansion
    if [ "$expand_mode" == true ]; then
print_tree $tree_hash
    fi
}

# Main function to determine the type and call appropriate function
dump_object() {
    local hash=$1
    local type=$(git cat-file -t $hash)

    case "$type" in
        "blob") print_blob $hash ;;
        "tree") print_tree $hash ;;
        "commit") print_commit $hash ;;
        *) echo "Unknown git object type: $type" ;;
    esac
}

# Options
compact_mode=false
expand_mode=false

while [ $# -gt 0 ]; do
    case "$1" in
        -c)
            compact_mode=true
            shift
            ;;
        -e)
            expand_mode=true
            shift
            ;;
        *)
            break
            ;;
    esac
done

# Call the main function with the provided hash
dump_object $1
