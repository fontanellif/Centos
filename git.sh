#/bin/bash
GIT_NAME=$1
GIT_MAIL=$2

yum install git
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_MAIL"
echo 'Download the helper'
curl -s -O https://github-media-downloads.s3.amazonaws.com/osx/git-credential-osxkeychain
echo 'Fix the permissions on the file so it can be run'
chmod u+x git-credential-osxkeychain
echo 'Move the helper to the path where git is installed'
sudo mv git-credential-osxkeychain \
  "$(dirname $(which git))/git-credential-osxkeychain"
echo 'Set git to use the osxkeychain credential helper'
git config --global credential.helper osxkeychain
cd ~/.ssh
echo 'Creates a new ssh key, using the provided email as a label \n
Generating public/private rsa key pair. \n
Enter file in which to save the key (/Users/you/.ssh/id_rsa): '
ssh-keygen -t rsa -C "$GIT_MAIL"
ssh-add ~/.ssh/id_rsa
echo 'Copies the contents of the id_rsa.pub file'
cat ~/.ssh/id_rsa.pub
echo 'Now that you have the key copied, it is time to add it into GitHub:\n
https://help.github.com/articles/generating-ssh-keys\n#step-3-add-your-ssh-key-to-github'
echo 'Test: ssh -T git@github.com'

