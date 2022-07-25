# Instalar impressora EPSON no Linux

## Instalar o driver

- Acessar este [link](http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX) para baixar o driver da impressora;
- Escolher o driver correto e baixar o tar.gz;
- Extrair em qualquer pasta (extrai e deixei na pasta `/opt`);
- Ler a Seção **6.3** parase guiar;
- Rodar o comando `sudo ./boostrap && sudo ./configure --prefix=/usr --with-cupsfilterdir=/usr/lib/cups/filter --with-cupsppddir=/usr/share/ppd`;
- Se der erro pode rodar o comando `sudo automake --add-missing` e depois só rodar `sudo ./configure --prefix=/usr --with-cupsfilterdir=/usr/lib/cups/filter --with-cupsppddir=/usr/share/ppd`;
- Rodar `sudo make` e depois `sudo make install`.

## Configurar a impressora com o CUPS

- Procurar no computador pelo gerenciador de impressora *CUPS Web Interface*;
- Com a impressora ligada na rede, clique na aba *Administration* e em seguida em *Add Printer*;
- No passo anterior será necessário colocar o usuário e senha do computador. Caso não funcione, adicione o seu usuário ao grupo da impressora (lp);
- Em *Discovered Network Printers*, selecione a impressora que possua o protocolo llpd (selecione qualquer uma que isso só aparecerá na próxima página);
- Preencha o campo *Name* com o nome que você deseja que apareça sempre que for usar a impressora e clique em *Continue*;
- Em *Or Provide a PPD*, selecione o arquivo de extensão *.ppd* referente a sua impressora que estará na pasta `/usr/share/ppd` e clique em *Add Printer*;
- Com isso basta selecionar a configuração default e a impressora já estará pronta para uso.

