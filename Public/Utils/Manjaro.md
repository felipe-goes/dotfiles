# Manjaro

## **pacman**
- Atualizar pacotes:
~~~
pacman -Sy
~~~
- Atualiza e dá o upgrade nos pacotes:
~~~
pacman -Syu
~~~
- Procura o pacote no repositório remoto:
~~~
pacman -Ss <package>
~~~
- Procura o pacote no sistema:
~~~
pacman -Qs <package>
~~~
- Instala pacote:
~~~
pacman -S <package>
~~~
- Remove o pacote junto com todas suas dependências:
~~~
pacman -Rs <package>
~~~

## **sed**
- Replace the first occurrence of a regular expression in each line of a file, and print the result:
~~~
sed 's/regular_expression/replace/' <filename>
~~~
- Replace all occurrences of a string in a file, overwriting the file (i.e. in-place):
~~~
sed -i 's/find/replace/g' <filename>
~~~
- Replace only on lines matching the line pattern:
~~~
sed '/line_pattern/s/find/replace/' <filename>
~~~
- Delete lines matching the line pattern:
~~~
sed '/line_pattern/d' <filename>
~~~
- A "expressão regular" `\(.*\)` dá match em qualquer coisa e pode ser usada em algumas situações particulares. No exemplo abaixo eu mostro primeiro uma string, depois o comando para ser usado para o `sed` e em seguida o resultado obtido. Nesse exemplo `\1` é o primeiro match e o `\2` é o segundo.
~~~
./lua/refactoring/tests/extract.simple-function.ts.commands #string pra usar de exemplo
sed s/\(.*\)simple-function\(.*\)/\1simple-function\2 \1simple_function\2
./lua/refactoring/tests/extract.simple-function.ts.commands  ./lua/refactoring/tests/extract.simple_function.ts.commands
~~~

## **xargs**
- Run a command using the input data as arguments:
~~~
<arguments_source> | xargs <command>
~~~
- A flag `-n` serve para passar repetir o comando pelo número escolhido, 2 no exemplo abaixo:
~~~
<arguments_source> | xargs -n 2 <command>
~~~

## **awk**
- Print the fifth column (a.k.a. field) in a space-separated file:
~~~
awk '{print $5}' filename
~~~
- Print the second column of the lines containing "foo" in a space-separated file:
~~~
awk '/foo/ {print $2}' filename
~~~
- Print the last column of each line in a file, using a comma (instead of space) as a field separator:
~~~
awk -F ',' '{print $NF}' filename
~~~
- Print different values based on conditions:
~~~
awk '{if ($1 == "foo") print "Exact match foo"; else if ($1 ~ "bar") print "Partial match bar"; else print "Baz"}' filename
~~~




