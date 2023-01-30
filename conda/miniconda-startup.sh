#CONDA ADDED THIS IN .BASHRC

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jwrr/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jwrr/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jwrr/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jwrr/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

