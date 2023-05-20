alias jup='jupyter notebook'
alias pylinecount="find . -name '*.py' | xargs wc -l"
alias sshlambda="ssh shane@lambda-quad-shane.local"
alias sshaddlambda="ssh-add --apple-use-keychain ~/.ssh/lambda"

alias docker_info="docker system info"
alias docker_containers="docker ps -a"
alias docker_monitor="docker stats"

alias nvidia_info="nvidia-smi"
# https://unix.stackexchange.com/questions/38560/gpu-usage-monitoring-cuda
alias nvidia_monitor="watch -d -n 1 nvidia-smi"
alias nvidia_driver="dkms status nvidia"
alias nvidia_driver2="cat /proc/driver/nvidia/version"
alias cuda_info="nvcc --version"
alias gpu_info="sudo lshw -C display"

alias system_monitor="top"
alias system_monitor2="htop"
alias system_info="uname -a"
alias linux_distro_version="lsb_release -a"

alias linux_cpu_info="lscpu"
alias linux_cpu_info2="lscpu"


ssh_lambda() {
    sshaddlambda
    sshlambda
}

keepawake() {
    if [[ "$1" == "" ]]
    then
        caffeinate -d -t 3600
    else
        caffeinate -d -t $(( $1 * 3600 ))
    fi
}

show() {
    if [[ "$1" == "" ]]
    then
        ls -al .
    else
        ls -al $1
    fi
}

browser() {
    open http://127.0.0.1:$1
}

# https://superuser.com/questions/1213886/how-to-open-port-via-ssh-tunnel
ssh_port() {
    ssh -NL $1:127.0.0.1:$1 shane@lambda-quad-shane.local
}

####
# Git
####
git_save() {
    git add .
    git commit -a -m $1
    git push
}

####
# Conda
####
conda_create() {
    conda create --name $1 python=$2
}

alias conda_install_packages="conda install jupyter notebook dask distributed pandas numpy flake8 plotly pytest scikit-learn scipy"
alias conda_export="conda env export > environment.yml"
alias conda_create_from_yml="conda env create -f environment.yml"
alias conda_rollback="conda install --revision 0"

conda_remove() {
    conda env remove -n $1
}

####
# Profiling
####
# Run cProfile on python file (first argument) and optional output file (optional second argument)
profile_file() {
    if [[ "$2" != "" ]]
    then
        python -m cProfile -o $2 $1
    else
        python -m cProfile -o profile.stats $1
    fi
    
}
# Run visualize profile output from cProfile
profile_viz() {
    if [[ "$1" != "" ]]
    then
        snakeviz $1
    else
        snakeviz profile.stats
    fi
}
# profile a function
# must add @profile to function
# optionally add this to file:
# ----
# try:
#     profile
# except NameError:
#     profile = lambda x: x
# ----
profile_function() {
    kernprof -l -v $1
}

profile_memory() {
    python -m memory_profiler $1
}

# if running in .zshrc
if [ -f ~/.bash_profile ]; then 
    . ~/.bash_profile;
fi
