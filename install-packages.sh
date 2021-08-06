# packages
echo "Setting up general packages"
sudo apt update
sudo apt install git curl tmux vim zsh -y

# omz and stuff
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# deadsnakes
os_name="$(grep -oP 'ID=\K\w+' /etc/os-release)"
if [ $os_name == 'ubuntu' ]; then
    echo "Ubuntu detected, setting up deadsnakes ppa"
    sudo add-apt-repository ppa:deadsnakes/ppa -y
    sudo apt-get update
fi

# pipx
echo "Setting up pipx"
python3 -m pip install --user --upgrade pip
python3 -m pip install --user pipx
python3 -m pipx ensurepath

# poetry
echo "Setting up poetry"
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python3 -
mkdir ${HOME}/.oh-my-zsh/custom/plugins/poetry
poetry completions zsh > ${HOME}/.oh-my-zsh/custom/plugins/poetry/_poetry
