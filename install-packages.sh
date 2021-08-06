# packages
echo "Setting up general packages"
sudo apt update
sudo apt install git curl tmux vim zsh  -y

# omz and stuff
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc"

# deadsnakes
os_name="$(grep -oP 'ID=\K\w+' /etc/os-release)"
if [ $os_name == 'ubuntu' ]; then
    echo "Ubuntu detected, setting up deadsnakes ppa"
    sudo add-apt-repository ppa:deadsnakes/ppa -y
    sudo apt-get update
fi

# pipx
echo "Setting up pipx"
python -m pip install --user --upgrade pip
python -m pip install --user pipx
python -m pipx ensurepath

# poetry
echo "Setting up poetry"
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python -
mkdir $ZSH_CUSTOM/plugins/poetry
poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry