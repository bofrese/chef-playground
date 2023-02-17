echo "Running .bashrc ..."

export PS1="\[\e[32m\]\u\[\e[m\]@\[\e[31m\]playground\[\e[m\]:\[\e[33m\]\w\[\e[m\]\[\e[34m\]\\$\[\e[m\]  "

export CHEF_LICENSE=accept-no-persist

#eval "$(chef shell-init bash)" # This also outputs a warning, which when parsed by bash generates an error.
export PATH="/opt/chef-workstation/bin:/chef/.chefdk/gem/ruby/3.0.0/bin:/opt/chef-workstation/embedded/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/chefdk/bin:/opt/chef-workstation/gitbin"
export GEM_ROOT="/opt/chef-workstation/embedded/lib/ruby/gems/3.0.0"
export GEM_HOME="/chef/.chefdk/gem/ruby/3.0.0"
export GEM_PATH="/chef/.chefdk/gem/ruby/3.0.0:/opt/chef-workstation/embedded/lib/ruby/gems/3.0.0"
_chef_comp() {
    local COMMANDS="exec env gem generate shell-init install update push push-archive show-policy diff export clean-policy-revisions clean-policy-cookbooks delete-policy-group delete-policy undelete describe-cookbook provision"
    COMPREPLY=($(compgen -W "$COMMANDS" -- ${COMP_WORDS[COMP_CWORD]} ))
}
complete -F _chef_comp chef

