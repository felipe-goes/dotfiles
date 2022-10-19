# dotfiles
Arquivos de configuração do sistema.

## Clone o repositório

1. Adicionar a linha abaixo ao .bashrc.

```
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

2. Para evitar problemas de recursão esquisitos, rode o comando abaixo.

```
echo ".dotfiles" >> .gitignore
```

3. Agora clone o repositório.

```
git clone --bare <git-repo-url> $HOME/.dotfiles
```

4. Faça o checkout dos arquivos do repositório.

```
config checkout
```

5. O passo acima pode falhar com uma mensagem como essa:

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

6. Defina a flag `showUntrackedFiles` para `no` neste repositório.

```
config config --local status.showUntrackedFiles no
```

## Instalação das dependências

O arquivo *setup* é um script que contém todas as dependências necessárias
para o sistema. Caso você esteja instalando no *WSL*, alguns programas podem
ser removidos antes de instalar, pois são programas de interface gráfica.

Uma vez que o script tenha sido revisado, instale com `sudo ./setup`.

## Configurando o NeoVim

Navegue até a pasta de configuração do NeoVim em `$HOME/.config/nvim`, abra o
arquivo de plugins com o comando `nvim lua/user/plugins.lua` e salve-o. Isto
irá sincronizar todos os plugins e configurar o que for necessário. Aguarde um
pouco que esta operação pode demorar um pouco. Talvez seja necessário repeti-la.
