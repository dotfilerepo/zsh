# set PATH so it includes private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
    
# set PATH so it includes cabals bin if it exists
if [ -d "$HOME/.cabal/bin" ] ; then
    PATH="$HOME/.cabal/bin:$PATH"
fi
        
