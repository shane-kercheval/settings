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

# https://superuser.com/questions/1213886/how-to-open-port-via-ssh-tunnel
ssh_port () {
    ssh -NL $1:127.0.0.1:$1 shane@lambda-quad-shane.local
}
