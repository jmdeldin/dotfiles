##############################################################################
# Paths                                                                   {{{1
##############################################################################

paths="$HOME/bin \
  /opt/local/apache2/bin \
  /opt/local/bin \
  /opt/local/sbin \
  /opt/local/lib/mysql5/bin"

for p in $paths; do [[ -d $p ]] && export PATH=$p:$PATH; done
unset paths p # cleanup the global vars

export MANPATH=/opt/local/share/man:$MANPATH

# source the bashrc if it's an interactive shell
[[ -n "$PS1" && -f .bashrc ]] && . .bashrc

