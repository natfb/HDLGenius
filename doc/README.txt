QUESTÃO_01: no FSM_clock: por que é CLK_3Hz ao invés de CLK_025Hz?
RQ_01:
VAMOS CONSIDERAR AS FREQUÊNCIAS DE 0.25Hz, 0.5Hz, 1Hz e 2Hz.
CASO NECESSÁRIO MUDAREMOS AS CONSTANTES.

QUESTÃO_02: no Counter_FPGA: como fazer o "total"?
RQ_02:
TOTAL É UM REGISTRADOR DE N BITS, OU SEJA, QUANDO CHEGAR NO 
VALOR DESEJADO DEVE ZERAR. NAO ESQUEÇA DE HABILITAR A CONTAGEM

QUESTÃO_03: o que são os módulos decSeq00, decSeq01, decSeq10, decSeq11?
RQ_03:
SÃO DECODIFICADORES.PARA CADA ENDEREÇO DE ENTRADA TEMOS UM VALOR DE
SAÍDA. ATENÇÃO AO decSeq00 QUE A PRINCÍPIO PARA QUALQUER ENDEREÇO
A SAÍDA SERÁ 4'b0001.
-- ATENÇÃO -- VER DOCUMENTO ADICIONADO NA PASTA DOC.
Output_Address_Mapping.pdf

QUESTÃO_04: no SEQ: é parecido com dec7seg? como fazer SEQ2, SEQ3?
RQ_04:
CONSIDERAR A ESPECIFICAÇÃO decSeq00, decSeq01, decSeq10, decSeq11
-- ATENÇÃO -- VER DOCUMENTO ADICIONADO NA PASTA DOC.
Output_Address_Mapping.pdf

QUESTÃO_05: no REG_FPGA: por que tem duas saídas na especificação (q e q3) e 
no desenho apenas uma?
RQ_05:
   A SAÍDA q3 AO FINAL DA MONTAGEM DA SEQUÊNCIA NO ESTADO Play_FPGA
   SERÁ COMPARADA COM A SEQUÊNCIA DIGITADA PELO USUÁRIO
 
QUESTÃO_06: o que são as letras "P", "S", "g" nos mux?
RQ_06:
	SÃO CONSTANTES QUE DEVEM SER ESCRITAS NO DISPLAY DE SETE SEGMENTOS
	VER COMO FUNCIONA UM DISPLAY DE SETE SEGMENTOS

QUESTÃO_07: sobre o buttonsync, logica e comp: vão ser feitos em aula?
RQ_07:
	CÓDIGO DISPONÍVEL NA PASTA src

QUESTÃO_08: controle: como fazer a máquina de estados? vai ser feito em aula?
RQ_08:
	VAMOS OPTAR POR MOORE. VER AULA SOBRE MOORE
	
QUESTÃO_09: vai ter a apresentação?
RQ_09:
	SOMENTE 101 (PROFESSOR VS DUPLA) COM A DUPLA 

--

QUESTÃO_10: 
Fato: decSeq10 == SEQ1 ("decSeq10.pdf" e "SEQ1.pdf" implementam a mesma tabela)
Porém, deveria ser: SEQ1 == decSeq00 ("GENIUS_alunos.pdf" mostra a relação visual entre "SEQ1" e "decSeq00")
Dúvida: "SEQ1.pdf" deveria estar ali na pasta doc?
Os corretos não seriam apenas "decSeqXX"? (Em ordem: 00, 01, 10, 11)
RQ_10:
	EXATO. CORRIGIDO EM QUESTÃO_04 

QUESTÃO_11:
O fio "SEQUSER" (GENIUS_alunos.pdf) não está presente no 
módulo Counter_User (Counter_User.pdf)
RQ_11:
	ANALISANDO A LÓGICA, A PRINCÍPIO NÃO EXISTE A NECESSIDADE DESSE SINAL.
	PODE DESCONSIDERAR POR ENQUANTO.

QUESTÃO_12:
"buttonsync.pdf" está como "dado", mas tive que 
criar um (GENIUS_alunos.pdf).
RQ_12:
CORRIGIDO EM QUESTÃO_04


QUESTÃO_13:
Valores de clock de "FSM_Clock.pdf" não batem com "GENIUS_alunos.pdf".
Considerei "FSM_Clock.pdf" pela divisão proporcional entre os clocks.
RQ_13:
	CONSIDERE OS CALCULOS EM FUNÇÃO DA FREQUÊNCIA DE 50MHz.
	VAMOS OPTAR PELAS FREQUÊNCIAS DE -> 0.25Hz, 0.5Hz, 1Hz e 2Hz
	SE NECESSÁRIO MUDAREMOS AS CONSTANTES.

QUESTÃO_14:
Avisos de outputs indefinidos do DATAPATH (fica assim mesmo?)
Warning (13024): Output pins are stuck at VCC or GND
Warning (13410): Pin "LEDR[4]" is stuck at GND
Warning (13410): Pin "LEDR[5]" is stuck at GND
RQ_14:
	ESTE AVISO "DIZ" QUE A LÓGICA LEDR[5] E LEDR[4] ESTÃO RECEBENDO 
	UMA CONSTANTE OU ZERO OU NÃO FORAM CONECTADOS. OLHA COM CALMA ONDE
	O SINAL ESTÁ "CHEGANDO".


QUESTÃO_15:

"LOGICA.pdf": o valor "j" do registrador não seria 
de 0 a 3? Está de 1 a 4.
RQ_15: