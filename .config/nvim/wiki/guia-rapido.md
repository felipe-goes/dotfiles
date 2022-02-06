# Guia Rápido

Este é um guia com um resumo das funcionalidades disponíveis no momento. Aqui
irei incluir tanto mapeamentos de teclas de plugins, quanto mapeamentos gerais
e funcionalidades que estão rodando no background, quando conveniente.

## Geral

`leader` está mapeado para a tecla `Space`.

Caso queira alterar o modo do corretor ortográfico basta fazer `<leader>pt`, para 
exclusivamente português, `<leader>en` para exclusivamente inglês ou `<leader>pe`
para ambas as línguas ao mesmo tempo.

Esses são os atalhos para editar e dar *source* nos arquivos relacionados ao
*Neo Vim*:
- `<leader>ve` -> `~/.config/nvim/init.vim`
- `<leader>vc` -> `~/.config/nvim/coc-settings.json`
- `<leader>wk` -> `~/.config/nvim/wiki/index.md`
- `<leader>gr` -> `~/.config/nvim/wiki/guia-rapido.md`
- `<leader>vr` -> `~/.config/nvim/init.vim`

`<leader>s` remove o highlight após uma pesquisa no arquivo.

O *Normal Mode* está mapeado para `jj`.

Digitar rapidamente `;` ou `,` adiciona o carácter ao final da linha.

O comando `z=` em cima de uma palavra marcada como errada pelo corretor ortográfico,
abre uma lista de sugestões.

`<leader>o` e `<leader>O` adiciona uma linha vazia embaixo e em cima da linha
atual, respectivamente, sem sair do *Normal Mode*.

Algumas opções estão disponíveis para se movimentar texto nos 3 principais
modos. São elas:
    - *Normal Mode* -> `<leader>j` move para baixo e `<leader>k` para cima.
    - *Insert Mode* -> `<Control>j` move para baixo e `<Control>k` para cima.
    - *Visual Mode* -> `J` move para baixo e `K` para cima.

Use `J` para juntar ( *join* ) o conteúdo da linha abaixo ao final da linha atual.

## Plugins

Atalhos para se acessar o terminal integrado **floaterm**:
- `F1` -> **Alterna**
- `F2` -> **Próximo**
- `F3` -> **Anterior**
- `F4` -> **Novo**

Atalhos para o **fzf**:
- `<leader>f`  :Files     - Customizado para fazer o comando `Files` usar o `ripgrep`, respeitando o arquivo .gitignore.
- `<leader>F`  :AllFiles  - Customizado para fazer uma variação do comando `AllFiles` que ignora o arquivo .gitignore.
- `<leader>b`  :Buffers   - Abre os *buffers*.
- `<leader>h`  :History   - `v:oldfiles` e abre os *buffers*.
- `<leader>r`  :Rg<cr>    - Procura pelo texto nos arquivos usando o `ripgrep` na interface do **fzf**.
- `<leader>R`  :Rg<space> - Procura pelo texto nos arquivos usando o `ripgrep` antes de abrir a interface do **fzf**.
- `<leader>gb` :GBranches - Mostra os branches se estiver dentro de um repositório git.

Alinhando texto com o **lion**:
- `gl` adiciona espaço à esquerda do carácter a ser alinhado e `gL` à direita.
- Pode ser usado junto com outros comandos. Por exemplo: `glip-` alinha todo
o parágrafo adicionando espaços à esquerda do carácter `-`.

`<leader>md` em um arquivo markdown, abre uma pré-visualização do arquivo usando
o plugin **markdown-preview**.

`<leader>n` abre o **NERDTree** e `<leader>N` o comando `:NERDTreeFind`.

Use `<leader>q` para usar o **Sayonara** para fechar o buffer. Acostuma a usar
ele pois é bem útil.

Condense ou expanda código com o **splitjoin**. Use `gJ` para juntar código de
múltiplas linhas em uma sintaxe que ocupe menos linhas, mantendo o resultado do
código, ou `gS` para fazer o contrário.

Comente e remova comentário nas linhas de código independente da linguagem com
**vim-commentary**. Use `gcc` para comentar uma linha, `gc` no *Visual Mode* para
comentar o trecho selecionado ou `gc`+`motion` para comentar o conteúdo alvo da
`motion`. Caso o código já estiver comentado o plugin irá remover o comentário.

**Dispatch** (Faltando).

Use comandos *UNIX* sem sair do *Neo Vim* com **eunuch**. Para ver a lista de
comandos acesse *~/.config/nvim/wiki/plugins/vim-eunuch.md*.

Comandos do **vim-exchange** para trocar textos:
- `cx`  -> Na primeira vez, define a primeira `motion` para trocar. Na segunda,
define a segunda `motion` e aplica a troca.
- `cxx` -> mesmo que `cx`, porém na linha inteira.
- `X`   -> mesmo que `cx`, porém no *Visual Mode*.
- `cxc` -> limpa qualquer `motion` pendente para troca.

**vim-fugitive** (PRECISANDO ATUALIZAR ANTES DE INSERIR AQUI)

Principais comandos do **vim-surround**:
- `cs` -> *change surround*
- `ds` -> *delete surround*
- `ys` -> *add surround*

**vim-test** (FALTANDO)

**vim-tmux-navigator** proporciona os seguintes atalhos para navegar entre
painéis do *Neo Vim* e *tmux splits*:
- `<ctrl-h>` -> Esquerda
- `<ctrl-j>` -> Baixo
- `<ctrl-k>` -> Cima
- `<ctrl-l>` -> Direita
- `<ctrl-\>` -> *split* anterior

Alguns atalhos disponíveis vem do plugin **vim-unimpaired**. Estes são alguns
destes:
- `[b` - Navega para o *buffer* anterior.
- `]b` - Navega para o próximo *buffer*.

Use o **vim-visual-multi** para criar mais de um cursor ao mesmo tempo com o
atalho `<ctrl>Seta` ou `<ctrl>Seta`. Use `<shift>Seta` após entrar no *Visual Multi Mode*
e selecione carácter por carácter.

## Language Server Protocol

Para esta função estou usando o plugin **coc.nvim**(LSP). (FALTANDO).
