#!/bin/bash

alias ls='ls --color=auto'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

alias gerp="grep"
alias cgrep='grep --color=always --exclude=\*.svn\*'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias cegrep='egrep --color=always'
alias egrep='egrep --color=auto'

alias sls='screen -ls'
alias nsc='screen -dmS'
alias scw='screen -wipe'
alias scr="screen -r"
## todo: add tmux aliases
alias halt="echo 'Cannot halt. Use /sbin/halt'"
alias reboot="echo 'Cannot reboot. Use /sbin/reboot'"
alias lns="ln -s"
alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"
#alias sudo="sudo -E" ## does not work on lenny
alias please="sudo"
alias gaeny="geany"
alias vul="vim"
alias gti="git"
alias sys_create_dirs="mkdir -p bin etc lib usr/{src,share} var/{www,run,lib,log} tmp"
alias anonssh="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias vul="vim"
alias gti="git"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias old-ssh="ssh -oKexAlgorithms=+diffie-hellman-group1-sha1"

alias openssl-view-csr="openssl req -noout -text -in"
alias openssl-view-crt="openssl x509 -noout -text -in"

openssl-modulus-crt() {
	openssl x509 -noout -modulus -in $1 | openssl md5
}
openssl-modulus-key() {
	openssl rsa -noout -modulus -in $1 | openssl md5
}
openssl-modulus-csr() {
	openssl req -noout -modulus -in $1 | openssl md5
}

export EDITOR="vim"

# https://github.com/lf94/peek-for-tmux
peek() { tmux split-window -p 33 "$EDITOR" "$@" || exit; }

## blue
#	export PS1='\[\033[1;34m\]\[\033)0\016\]\[\]lq\[\017\033(B\](\[\033[1;37m\]\u\[\033[1;34m\]@\[\033[1;37m\]\h\[\033[1;34m\])(\[\033[1;37m\]\t\[\033[1;34m\])\n\[\033[1;34m\]\[\033)0\016\]\[\]mq\[\017\033(B\](\[\033[1;37m\]\w\[\033[1;34m\])\[\033[1;37m\]->\[\033[0m\] '

## red
#PS1='\[\033[1;31m\]\[\033)0\016\]\[\]lq\[\017\033(B\](\[\033[1;37m\]\u\[\033[1;31m\]@\[\033[1;37m\]\h\[\033[1;31m\])(\[\033[1;37m\]\t\[\033[1;31m\])\n\[\033)0\016\]\[\]mq\[\017\033(B\](\[\033[1;37m\]\w\[\033[1;31m\])\[\033[1;37m\]->\[\033[0m\] '

## light blue
#PS1='\[\033[1;36m\]\[\033)0\016\]\[\]lq\[\017\033(B\](\[\033[1;37m\]\u\[\033[1;36m\]@\[\033[1;37m\]\h\[\033[1;36m\])(\[\033[1;37m\]\t\[\033[1;36m\])\n\[\033[1;36m\]\[\033)0\016\]\[\]mq\[\017\033(B\](\[\033[1;37m\]\w\[\033[1;36m\])\[\033[1;37m\]->\[\033[0m\] '
redPrompt='\[\033[1;31m\]\[\033)0\016\]\[\]lq\[\017\033(B\](\[\033[1;37m\]\u\[\033[1;31m\]@\[\033[1;37m\]\h\[\033[1;31m\])(\[\033[1;37m\]\t\[\033[1;31m\])\n\[\033)0\016\]\[\]mq\[\017\033(B\](\[\033[1;37m\]\w\[\033[1;31m\])\[\033[1;37m\]->\[\033[0m\] '

## FIXME
## alias au cas où
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

if [ $UID -eq 0 ]
then
  ## root
  #PS1='\[\033[1;31m\]\[\033)0\016\]\[\]lq\[\017\033(B\](\[\033[1;37m\]\u\[\033[1;31m\]@\[\033[1;37m\]\h\[\033[1;31m\])(\[\033[1;37m\]\t\[\033[1;31m\])\n\[\033)0\016\]\[\]mq\[\017\033(B\](\[\033[1;37m\]\w\[\033[1;31m\])\[\033[1;37m\]->\[\033[0m\] '
  export PS1=$redPrompt
else
  case $HOSTNAME in
    *xen*|*prod*|*hyp*)
      export PS1=$redPrompt
      ;;
    ot-fixe-052|ot-port-053)
      PS1='\[\033[1;32m\]\[\033)0\016\]\[\]lq\[\017\033(B\](\[\033[1;37m\]\u\[\033[1;32m\]@\[\033[1;37m\]\h\[\033[1;32m\])(\[\033[1;37m\]\t\[\033[1;32m\])\n\[\033[1;32m\]\[\033)0\016\]\[\]mq\[\017\033(B\](\[\033[1;37m\]\w\[\033[1;32m\])\[\033[1;37m\]->\[\033[0m\] '
      ;;
    *)
      PS1='\[\033[1;93m\]\[\033)0\016\]\[\]lq\[\017\033(B\](\[\033[1;37m\]\u\[\033[1;93m\]@\[\033[1;37m\]\h\[\033[1;93m\])(\[\033[1;37m\]\t\[\033[1;93m\])\n\[\033[1;93m\]\[\033)0\016\]\[\]mq\[\017\033(B\](\[\033[1;37m\]\w\[\033[1;93m\])\[\033[1;37m\]->\[\033[0m\] '
      ;;
  esac
fi

if [ -d "$HOME/bin" ]
then
	export PATH=$HOME/bin:$PATH
fi

mysql-stats() {
  for i in key_buffer_size query_cache_size tmp_table_size innodb_buffer_pool_size innodb_additional_mem_pool_size innodb_log_buffer_size max_connections
  do
    val=$(echo "SHOW VARIABLES WHERE Variable_Name = '$i';" | mysql -N | awk '{ print $2 }')
    t=""
    if [ $val -gt 1048576 ]
    then
      val=$(echo "$val / 1024 / 1024" | bc)
      t="M"
    elif [ $val -gt 1024 ]
    then
      val=$(echo "$val / 1024" | bc)
      t="k"
    fi
    echo "$i: $val $t"
  done

  for i in sort_buffer_size read_buffer_size read_rnd_buffer_size join_buffer_size thread_stack binlog_cache_size
  do
    val=$(echo "SHOW VARIABLES WHERE Variable_Name = '$i';" | mysql -N | awk '{ print $2 }')
    t=""
    if [ $val -gt 1048576 ]
    then
      val=$(echo "$val / 1024 / 1024" | bc)
      t="M"
    elif [ $val -gt 1024 ]
    then
      val=$(echo "$val / 1024" | bc)
      t="k"
    fi
    echo "$i: $val $t"
  done
}

mysql-calc-memory () {
  echo "SELECT ROUND((@@key_buffer_size + @@query_cache_size + @@tmp_table_size + @@innodb_buffer_pool_size + @@innodb_log_buffer_size + @@max_connections * (@@sort_buffer_size + @@read_buffer_size + @@read_rnd_buffer_size + @@join_buffer_size + @@thread_stack + @@binlog_cache_size)) / 1024 / 1024, 2) AS 'Required memory';" | mysql
}

mysql-db-size() {
    echo "SELECT table_schema AS \"Database\",
ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) AS \"Size (MB)\"
FROM information_schema.TABLES
GROUP BY table_schema;" | mysql
}

mysql-db-engines() {
  echo "SELECT TABLE_SCHEMA, TABLE_NAME, ENGINE FROM information_schema.TABLES" | mysql
}

mysql-table-size() {
    echo "SELECT
  TABLE_SCHEMA AS \`Database\`,
  TABLE_NAME AS \`Table\`,
  ROUND((DATA_LENGTH + INDEX_LENGTH) / 1024 / 1024) AS \`Size (MB)\`
FROM
  information_schema.TABLES
ORDER BY
  (DATA_LENGTH + INDEX_LENGTH)
DESC;
" | mysql
}

