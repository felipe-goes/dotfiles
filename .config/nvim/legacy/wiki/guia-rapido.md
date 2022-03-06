# Guia Rápido

Este é um guia com um resumo das funcionalidades disponíveis no momento. Aqui
irei incluir tanto mapeamentos de teclas de plugins, quanto mapeamentos gerais
e funcionalidades que estão rodando no background, quando conveniente.

## Geral

`leader` está mapeado para a tecla `Space`.

`<leader>h` remove o highlight após uma pesquisa no arquivo.

O _Normal Mode_ está mapeado para `jj`.

Digitar rapidamente `;;` ou `,,` no modo `INSERT`, adiciona o carácter ao final
da linha.

`<leader>o` e `<leader>O` adiciona uma linha vazia embaixo e em cima da linha
atual, respectivamente, sem sair do modo `Normal`.

Movimente linhas para cima ou para baixo usando `Alt+k` ou `Alt+j`. Faça o mesmo
no modo `Visual` com `Shift+k` ou `Shift+j`.

Use `J` para juntar ( _join_ ) o conteúdo da linha abaixo ao final da linha atual.

`<leader>w` to save the file and `<leader>Q` to close it.

Use `<leader>q` para fechar o buffer atual.

## Plugins

Alinhando texto com o **lion**:

- `gl` adiciona espaço à esquerda do carácter a ser alinhado e `gL` à direita.
- Pode ser usado junto com outros comandos. Por exemplo: `glip-` alinha todo
  o parágrafo adicionando espaços à esquerda do carácter `-`.

`<leader>M` em um arquivo markdown, abre uma pré-visualização do arquivo usando
o plugin **markdown-preview**.

`<leader>e` abre o **NvimTree**.

Comente e remova comentário nas linhas de código independente da linguagem com
**Comment**. Use `gcc` para comentar uma linha, `gc` no _Visual Mode_ para
comentar o trecho selecionado ou `gc`+`motion` para comentar o conteúdo alvo da
`motion`. Use `gcA` para adicionar um comentário no final da linha. Caso o código
já estiver comentado o plugin irá remover o comentário.

Principais comandos do **vim-surround**:

- `cs` -> _change surround_
- `ds` -> _delete surround_
- `ys` -> _add surround_
