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
 
