# Um estudo sobre menções de métricas computacionais, termos e testes estatísticos em artigos apresentados no WSCAD

### Autoria: Rodrigo S. Nurmberg , Rogério L. Rizzi , Claudia B. Rizzi, Guilherme Galante, Thiago S. Elias, Gustavo R. Malacarne

Repositório do artigo submetido ao WSCAD2023.

## Estrutura do repositório:

 - /artigo.pdf
 - /Código
	 - WSCAD2023.ipynb - Jupyter notebook exportado do Google Colab, com todo o código utilizado no artigo
 - /Dados - Dados processados no artigo
	 - PDF/
		 -	WSCAD\<AAAA\>/ - Um subdiretório para cada ano do WSCAD
			 - links.txt: Links para os artigos em PDF nos Anais do WSCAD (SBC Open Lib - SOL)
	 - TXT/ Será gerado durante a etapa de pré-processamento, refletindo a estrutura de pastas dos arquivos PDF
 - /Planilhas/
	 - PréProcessamento.{ods,xlsx} - Utilizada durante a etapa de pré-processamento, contém a aba de arquivos ignorados e a as expressões regulares para substituição/remoção de textos.
	 - ListaERs.ods - Utilizada durante a etapa de processamento, contém as listas de ERs utilizadas para extração de termos.
	 - ValidaçãoManual.ods - Resultado da validação manual de 40 artigos
 - /Resultados/: Arquivos gerados durante o processamento e análise (.csv, .tex e .svg)


## Replicação
 - [ ] Clonar o repositório para o computador local
	 - [ ] Baixar os artigos
	- Para isso pode-se executar o script`./Dados/PDF/download.sh [--from <ano>] [--to <ano>] [--ieee]`
	- **from**: Ano inicial
	- **to**: Ano final (inclusive)
	- **ieee**: Baixar também os artigos do IEEE. Utilize somente se sua rede tiver acesso ao IEEE (por ex. rede acadêmica ou proxy http/https devidamente configurado)
	- ***ano***: Inteiro entre [2000, 2022]
- No Google
	 - [ ] Fazer upload de todo o diretório do artigo
		 - Ex. Meu Drive/WSCAD2023
		 - [ ] Anotar o nome do diretório apenas (ex. WSCAD2023)
		 - [ ] Anotar o link (Compartilhar -> Copiar Link)
	 - [ ] Abrir a planilha ListaERs.xlsx e salvar como Google Sheets
		 - [ ] Anotar o link (Compartilhar -> Copiar Link)
	 - [ ] Abrir a planilha PréProcessamento.xlsx e salvar como Google Sheets
		 - [ ] Anotar o link (Compartilhar -> Copiar Link)
	 - [ ] Abrir o arquivo Código/WSCAD2023.ipynb (Botão direito, abrir com -> Google Colaboratory)
	 - Ajustar as URLs, de acordo com os links copiados:
		 - [ ] WSCAD2023_URL
		 - [ ] URL_PLANILHA_PRE
		 - [ ] URL_PLANILHA_TERMOS
	 - [ ] Descomentar pd2txt_dir()
		 - Localizar e Substituir (CTRL+H)
			 - Localizar: \#pdf2txt_dir()
			 - Substituir: pdf2txt_dir()
	 - [ ] Executar Tudo (CTRL+F9)
	 - [ ] Salvar execução (CTRL+S)
