The script to build the Docker image (`docker_build.sh`) takes the SSH key called `repo-key` in the current directory as the key to access the git repo._
You can create a (temporary) key using the following command `ssh-keygen -q -t rsa -N '' -f repo-key`. You also need to add this key as a (deploy key) in the git repo.
