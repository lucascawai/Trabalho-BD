module namespace bd = "/";

declare %updating function bd:f1(){
	for $x in //ATUACOES-PROFISSIONAIS[count(*) = 0]
	  return insert node
	  <ATUACAO-PROFISSIONAL>
	  </ATUACAO-PROFISSIONAL>
	  into $x
};

declare %updating function bd:f2(){
	for $x in //ATUACAO-PROFISSIONAL[not(exists(@CODIGO-INSTITUICAO))]
		return insert node attribute CODIGO-INSTITUICAO {'0'} into $x 
};

declare %updating function bd:f3(){
	for $x in //INFORMACOES-ADICIONAIS-CURSOS[count(*) = 0]
	  return insert node
		<INFORMACAO-ADICIONAL-CURSO
			CODIGO-CURSO="0"
			CODIGO-INSTITUICAO="0"
			CODIGO-ORGAO=""
			NIVEL-CURSO=""
			NOME-DA-AREA-DO-CONHECIMENTO=""
			NOME-DA-ESPECIALIDADE=""
			NOME-DA-SUB-AREA-DO-CONHECIMENTO=""
			NOME-GRANDE-AREA-DO-CONHECIMENTO=""
			NOME-INSTITUICAO=""
			NOME-ORGAO="" />
	  into $x
};

declare %updating function bd:f4(){
	for $x in //INFORMACOES-ADICIONAIS-INSTITUICOES[count(*) = 0]
	  return insert node
		<INFORMACAO-ADICIONAL-INSTITUICAO
		  CODIGO-INSTITUICAO="0"
		  FLAG-AGENCIA-FOMENTO=""
		  FLAG-INSTITUICAO-DE-ENSINO=""
		  NOME-PAIS-INSTITUICAO=""
		  SIGLA-INSTITUICAO=""
		  SIGLA-PAIS-INSTITUICAO=""
		  SIGLA-UF-INSTITUICAO=""
		  />
	  into $x
};
