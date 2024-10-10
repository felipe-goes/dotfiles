# dotfiles

## Clone o repositório

1. Adicionar a linha abaixo ao .bashrc.

```
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

2. Agora clone o repositório.

```
git clone --bare <git-repo-url> $HOME/.dotfiles
```

3. Faça o checkout dos arquivos do repositório.

```
config checkout
```

4. O passo acima pode falhar com uma mensagem como essa:

```
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```

Isto pode ocorrer se a sua pasta $HOME tiver arquivos de configuração que o git
iria sobrescrever. A solução é simples: faça um back up dos arquivos que se
quiser ou delete se não se importar.

Uma vez que você resolver estes conflitos é só rodar `config checkout`
novamente.

5. Defina a flag `showUntrackedFiles` para `no` neste repositório.

```
config config --local status.showUntrackedFiles no
```

## Instalação das dependências

Rode o comando:

```
cd "$HOME/.install-packages/" && sudo bash apt.sh && bash nix-setup.sh && bash repos.sh && sudo bash move.sh"
```

## Configurando o NeoVim

Abra qualquer arquivo com o neovim e ele irá automaticamente instalar os plugins.
