# Can Git ignore just one line?

Git does not have built-in support for ignoring individual lines within a file.
Git's `.gitignore` file is used to specify patterns for files or directories to
be ignored by Git, rather than specific lines of content within a file.

If you need to ignore a specific line within a file, you have a few options:

1. **Manually Manage Changes**: You can manually avoid staging or committing
the specific line you want to ignore. This requires discipline to review and
manage changes on a line-by-line basis.

2. **Use Git Attributes**: Git has a feature called "smudge" and "clean"
filters that can process files on checkout and commit. While these can be used
to modify the content of files, it is a complex and uncommon solution.

3. **Use a Separate Configuration File**: Depending on your use case, you might
consider storing the line you want to ignore in a separate configuration file.
This configuration file can then be ignored in Git by adding it to your
`.gitignore`.

Remember that ignoring individual lines can lead to complications when
collaborating with others or maintaining a project. It's generally better
practice to manage your codebase in a way that doesn't require ignoring
specific lines.

# [Conventional Commits Pattern](https://medium.com/linkapi-solutions/conventional-commits-pattern-3778d1a1e657)

As regras são muito simples, como demonstrado abaixo temos um tipo de *commit*
(*type*), o escopo/contexto do *commit* (*scope*) e o assunto/mensagem do
*commit* (*subject*), mas adiante irei detalhar cada um.

```
!type(?scope): !subject
<?body>
<?footer>
```

Dessa maneira, `!` indica os atributos obrigatórios e `?` indica os atributos
não obrigatórios. Nesse artigo não iremos falar sobre o `body` e nem o `footer`
do commit. Mas tratam-se de especificações simples, que vocês podem ver mais
[aqui](https://www.conventionalcommits.org/pt-br/v1.0.0-beta.4/#especifica%C3%A7%C3%A3o).

Type: Quais são os tipos de commit

O type é responsável por nos dizer qual o tipo de alteração ou iteração está
sendo feita, das regras da convenção, temos os seguintes tipos:

- `test:` indica qualquer tipo de criação ou alteração de códigos de teste.

**Exemplo:** Criação de testes unitários.

- `feat:` indica o desenvolvimento de uma nova feature ao projeto.

**Exemplo:** Acréscimo de um serviço, funcionalidade, endpoint, etc.

- `refactor:` usado quando houver uma refatoração de código que não tenha
qualquer tipo de impacto na lógica/regras de negócio do sistema.

**Exemplo:** Mudanças de código após um code review

- `style:` empregado quando há mudanças de formatação e estilo do código que
não alteram o sistema de nenhuma forma.

**Exemplo:** Mudar o style-guide, mudar de convenção lint, arrumar indentações,
remover espaços em brancos, remover comentários, etc..

- `fix:` utilizado quando há correção de erros que estão gerando bugs no sistema.

**Exemplo:** Aplicar tratativa para uma função que não está tendo o
comportamento esperado e retornando erro.

- `chore:` indica mudanças no projeto que não afetem o sistema ou arquivos de
testes. São mudanças de desenvolvimento.

**Exemplo:** Mudar regras do eslint, adicionar prettier, adicionar mais
extensões de arquivos ao .gitignore

- `docs:` usado quando há mudanças na documentação do projeto.

**Exemplo:** adicionar informações na documentação da API, mudar o README, etc.

- `build:` utilizada para indicar mudanças que afetam o processo de build do
projeto ou dependências externas.

**Exemplo:** Gulp, adicionar/remover dependências do npm, etc.

- `perf:` indica uma alteração que melhorou a performance do sistema.

**Exemplo:** alterar ForEach por while, melhorar a query ao banco, etc.

- `ci:` utilizada para mudanças nos arquivos de configuração de CI.

**Exemplo:** Circle, Travis, BrowserStack, etc.

- `revert:` indica a reverão de um commit anterior.

Observações:

- Só pode ser utilizado um *type* por commit;
- O *type* é **obrigatório**;
- Caso esteja indeciso sobre qual *type* usar, provavelmente trata-se de uma
grande mudança e é possível separar esse *commit* em dois ou mais *commits*;
- A diferença entre `build` e `chore` pode ser um tanto quanto sutil e pode
gerar confusão, por isso devemos ficar atentos quanto ao tipo correto. No caso
do Node.js por exemplo, podemos pensar que quando há uma adição/alteração de
certa dependência de desenvolvimento presente em `devDependencies`, utilizamos
o `chore`.  Já para alterações/adições de dependências comuns aos projeto, e
que haja impacto direto e real sobre o sistema, utilizamos o `build`.
