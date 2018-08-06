#!/bin/bash
#Script to get all repositories under a user from bitbucket
#Usage: getAllRepos.sh [username]
#source: http://haroldsoh.com/2011/10/07/clone-all-repos-from-a-bitbucket-source/

curl -u ${1} https://api.bitbucket.org/1.0/users/${1} > repoinfo
# curl -u adomingues https://api.bitbucket.org/1.0/users/adomingues
# cat repoinfo

for repo_name in `cat repoinfo | gsed -r 's/("name": )/\n\1/g' | gsed -r 's/"name": "(.*)"/\1/' | gsed -e 's/{//' | cut -f1 -d\" | tr '\n' ' '`
do
    echo "Cloning " $repo_name
    git clone https://${1}@bitbucket.org/${1}/$repo_name
    echo "---"
done
