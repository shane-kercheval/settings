alias nlp='cd ~/repos/nlp-template'
alias dst='cd ~/repos/data-science-template'
alias helpsk='cd ~/repos/python-helpers'
alias shiny='cd ~/repos/shiny-explore-dataset'
alias rtools='cd ~/repos/rtools'
alias virt='source .venv/bin/activate'
alias jup='jupyter notebook'
alias keepawake='caffeinate -d -t 86400'
alias keepawake1='caffeinate -d -t 3600'
alias keepawake9='caffeinate -d -t 32400'
alias browser5000='open http://127.0.0.1:5000'
alias browser1234='open http://127.0.0.1:1234'
alias pylinecount="find . -name '*.py' | xargs wc -l"
alias sshlambda="ssh shane@lambda-quad-shane.local"

browser() {
    open http://127.0.0.1:$1
}

# https://superuser.com/questions/1213886/how-to-open-port-via-ssh-tunnel
ssh_port() {
    ssh -NL $1:127.0.0.1:$1 shane@lambda-quad-shane.local
}

####
# Conda
####
conda_create() {
    conda create --name $1 python=$2
}

alias conda_install_packages="conda install jupyter notebook dask distributed pandas numpy flake8 plotly pytest scikit-learn scipy"
alias conda_export="conda env export > environment.yml"
alias conda_rollback="conda install --revision 0"

conda_remove() {
    conda env remove -n $1
}
