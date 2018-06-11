export NVM_DIR=~/.nvm
function nvm {
  if [ -s "$NVM_DIR/nvm.sh" ]; then
    source $(brew --prefix nvm)/nvm.sh
    . "$NVM_DIR/nvm.sh"
    nvm use system
    nvm $@
  fi
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
  . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

source $(brew --prefix nvm)/nvm.sh
export NVM_DIR=~/.nvm

if [[ -n $git_branch ]]; then
  git_branch="test$git_branch"
fi

export PS1="\[$bldcyn\]\n[\t \w]\[$bldylw\]\$git_branch\[$bldcyn\]: \[$txtwht\]"
export VIRTUAL_ENV_DISABLE_PROMPT=true

# This points to the latest version installed by Homebrew
export ANDROID_HOME=/Users/kfawcett/Library/Android/sdk/
export ANDROID_SDK=$ANDROID_HOME
export ANDROID_NDK=/Users/kfawcett/Library/Android/sdk/ndk-bundle/
export ANDROID_NDK_HOME=$ANDROID_NDK
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home

export PATH=${JAVA_HOME}/bin:$PATH

source ~/flask_api/bin/activate
