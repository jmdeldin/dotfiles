##############################################################################
# Paths                                                                   {{{1
##############################################################################

paths="\
  /opt/local/bin            \
  /opt/local/sbin           \
  /opt/local/lib/mysql5/bin \
  /usr/local/bin            \
  /usr/local/sbin           \
  $HOME/bin                 \
"

for p in $paths; do [[ -d $p ]] && export PATH=$p:$PATH; done
unset paths p

# source the bashrc if it's an interactive shell
[[ -n "$PS1" && -f .bashrc ]] && . .bashrc
