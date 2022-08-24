# Guia para o *pacman*

## Atualizar pacotes

- Atualiza pacotes                   : `pacman -Sy`
- Atualiza e dá o upgrade nos pacotes: `pacman -Syu`

## Queries

- Procura o pacote no repositório remoto: `pacman -Ss <pacote>`
- Procura o pacote no sistema           : `pacman -Qs <package>`

## Instalação

- Instala pacote: `pacman -S <pacote>`

## Desinstalação

- Remove o pacote junto com todas suas dependências: `pacman -Rs <pacote>`

## Reverter atualização

- Reverte atualização de pacote:

```
pacman -U /var/cache/pacman/pkg/<versão-do-pacote-a-regredir>.pkg.tar.zst
```

## Resolver problema de velocidade no download

```
sudo pacman-mirrors --fasttrack && sudo pacman -Syuu
```

