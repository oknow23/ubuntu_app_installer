#!/bin/bash

NODE_VERSION=10
GOLANG_VERSION=1.11
AG_VERSION=2.2.0
FD_VERSION=7.3.0
RIPGREP_VERSION=0.10.0
HTOP_VERSION=2.2.0
CMAKE_VERSION=3.14.0
LLVM_VERSION=8.0.0
LLVM_UBUNTU_VERSION=18.04

export LC_ALL=en_US.UTF-8

# update locale
sudo locale-gen en_US.UTF-8
sudo update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_CTYPE=en_US.UTF-8

# change bash to default
# sudo dpkg-reconfigure dash

# add neovim ppa
sudo apt-add-repository ppa:neovim-ppa/unstable
# sudo add-apt-repository ppa:webupd8team/java
sudo add-apt-repository ppa:gophers/archive

# update apt list
sudo apt update

# install essential softwares
sudo dpkg --add-architecture i386
sudo apt install -y --no-install-recommends --allow-unauthenticated \
    software-properties-common \
    python-pip python-dev \
    python3-software-properties python3-dev python3-pip \
    build-essential libncurses5-dev libncursesw5-dev \
    silversearcher-ag \
    npm autoconf autogen libncursesw5-dev \
    wget curl zsh net-tools iputils-ping samba \
    file bc mtd-utils fakeroot cpio unzip rsync \
    bzr cvs mercurial subversion neovim gparted \
    gdb exuberant-ctags cscope netcat-openbsd socat psmisc libc6-dbg \
    automake libtool pkg-config libpcre3-dev zlib1g-dev liblzma-dev \
    libtool-bin strace git-flow tig libc6:i386 zlib1g:i386 
    u-boot-tools genext2fs || echo "Fail! will exit";return

sudo  apt install -y --no-install-recommends --allow-unauthenticated \
    golang-${GOLANG_VERSION}.go || echo "Fail! will exit";return
# sudo apt install -y oracle-java8-installer patch patchutils libc6-dev \
#     libxml-dom-perl zlib1g zlib1g-dev libcurl4-openssl-dev \
#     libncursesw5-dev libncurses5:i386

# install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim || echo "Fail! will exit";return

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true

# install python2 and necessary modules
sudo python2 -m pip install pip --upgrade && sudo python2 -m pip install setuptools && sudo python2 -m pip install wheel neovim pynvim --upgrade || echo "Fail! will exit";return

# install python3 and necessary modules
sudo python3 -m pip install pip --upgrade && sudo python3 -m pip install setuptools && sudo python3 -m pip install wheel neovim pynvim compiledb pylint black yapf --upgrade || echo "Fail! will exit";return

# clone necessary
pushd ~/workspaces/dotfiles
git clone https://github.com/sindresorhus/pure.git
cd ~

# link pure
ln -s /home/${USER}/workspaces/dotfiles/pure/pure.zsh /home/${USER}/bin/prompt_pure_setup
ln -s /home/${USER}/workspaces/dotfiles/pure/async.zsh /home/${USER}/bin/async

# download extra zsh plugins
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-autosuggestions.git
cd ~

# download && install useful utilities
cd ~/Downloads
wget https://github.com/ggreer/the_silver_searcher/archive/${AG_VERSION}.tar.gz -O the_silver_searcher-${AG_VERSION}.tar.gz
wget https://github.com/hishamhm/htop/archive/${HTOP_VERSION}.tar.gz -O htop-${HTOP_VERSION}.tar.gz
wget https://github.com/sharkdp/fd/releases/download/v${FD_VERSION}/fd_${FD_VERSION}_amd64.deb
wget https://github.com/BurntSushi/ripgrep/releases/download/${RIPGREP_VERSION}/ripgrep_${RIPGREP_VERSION}_amd64.deb

# install fd, ripgrep
sudo dpkg -i *.deb

# build and install ag
tar xvf the_silver_searcher-${AG_VERSION}.tar.gz
cd the_silver_searcher-${AG_VERSION}
./build.sh
sudo make install
cd ..

# build and install htop
tar xvf htop-${HTOP_VERSION}.tar.gz
cd htop-${HTOP_VERSION}
./autogen.sh
./configure
make -j8
sudo make install
cd ..

# remove all debs and gzips downloaded
rm the_silver_searcher-${AG_VERSION} -rf
rm htop-${HTOP_VERSION} -rf
rm *.deb *.gz
cd ~/

export PATH=~/bin:~/.npm-global/bin:/usr/lib/go-${GOLANG_VERSION}/bin:~/go/bin:$PATH


# download and build ccls (preq cmake > 8, llvm > 8)
cd ~/workspaces/c/opensource

## llvm
wget http://releases.llvm.org/${LLVM_VERSION}/clang+llvm-${LLVM_VERSION}-x86_64-linux-gnu-ubuntu-${LLVM_UBUNTU_VERSION}.tar.xz
tar xvf clang+llvm-${LLVM_VERSION}-x86_64-linux-gnu-ubuntu-${LLVM_UBUNTU_VERSION}.tar.xz

## cmake
wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-Linux-x86_64.sh
sh cmake-${CMAKE_VERSION}-Linux-x86_64.sh
ln -s /home/${USER}/workspaces/c/opensource/cmake-${CMAKE_VERSION}-Linux-x86_64/bin/cmake ~/bin/cmake

git clone --recursive https://github.com/MaskRay/ccls
cd ccls
cmake -H. -B. -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/home/${USER}/workspaces/c/opensource/clang+llvm-${LLVM_VERSION}-x86_64-linux-gnu-ubuntu-${LLVM_UBUNTU_VERSION}
cmake --build . -j4
cd ~

# download and build bear
cd ~/workspaces/c/opensource
git clone https://github.com/rizsotto/Bear.git
cd Bear
mkdir build
cd build
cmake ..
make all
sudo make install
cd ~

#nodejs & yarn
curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install -y yarn nodejs
npm config set prefix "~/.npm-global"
npm i -g bash-language-server vue-language-server
go get -u github.com/saibing/bingo

popd
# install font
pushd /tmp
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts/patched-fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Hack.zip
cd ..
# ./install.sh Hack
./install.sh BitstreamVeraSansMono
popd

# install git cz
pushd /tmp
git clone https://github.com/commitizen/cz-cli.git
cd cz-cli
sudo npm install -g commitizen cz-conventional-changelog
popd

# setup neovim
cp init.vim ~/.config/nvim/init.vim || echo "Fail! will exit";return
cp coc-settings.json ~/.config/nvim/coc-settings.json || echo "Fail! will exit";return
cp user.zshrc ~/.zshrc || echo "Fail! will exit";return
sed -i "s/\/user\//\/$USER\//g" ~/.zshrc || echo "Fail! will exit";return
nvim +PlugInstall +UpdatePlugins +qa || echo "Fail! will exit";return
nvim "+CocInstall coc-json coc-tsserver coc-html coc-css coc-vetur coc-python coc-highlight coc-emmet coc-snippets" || echo "Fail! will exit";return
cd ~

sudo apt update
sudo apt upgrade -y


echo "Done !! Re-login and Enjoy"
