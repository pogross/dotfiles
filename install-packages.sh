# packages
echo Setting up general packages
sudo apt install tmux -y
sudo apt install vim -y
sudo apt install curl -y

# pipx
echo Setting up pipx
python3 -m pip install --user --upgrade pip
python3 -m pip install --user pipx
python3 -m pipx ensurepath

# deadsnakes
os_name="$(grep -oP 'ID=\K\w+' /etc/os-release)"
if [ $os_name == 'ubuntu' ]
then
    echo Ubuntu detected, setting up deadsnakes ppa
    sudo add-apt-repository ppa:deadsnakes/ppa -y
    sudo apt-get update
fi
