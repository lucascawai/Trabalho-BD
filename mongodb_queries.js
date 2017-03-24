function get_results(result) {
	print(tojson(result));
}

print("1) Pessoas que falam francês: ")
db.curriculos.find({'CURRICULO-VITAE.DADOS-GERAIS.IDIOMAS.IDIOMA._IDIOMA':"FR"}, {'CURRICULO-VITAE.DADOS-GERAIS._NOME-COMPLETO':1, "_id":0}).forEach(get_results)

print("2) Pessoas que possuem mestrado: ")
db.curriculos.find({'CURRICULO-VITAE.DADOS-GERAIS.FORMACAO-ACADEMICA-TITULACAO.MESTRADO':{$exists:true}}, {'CURRICULO-VITAE.DADOS-GERAIS._NOME-COMPLETO':1, "_id":0}).forEach(get_results)

print("3a) Pessoas e seus prêmios: (sem unwind)")
db.curriculos.find({'CURRICULO-VITAE.DADOS-GERAIS.PREMIOS-TITULOS':{$exists:true}}, {'CURRICULO-VITAE.DADOS-GERAIS._NOME-COMPLETO':1, "_id":0, "CURRICULO-VITAE.DADOS-GERAIS.PREMIOS-TITULOS.PREMIO-TITULO":1}).forEach(get_results)

print("3b) Pessoas e seus prêmios: (com unwind)")
db.curriculos.aggregate([{$unwind: '$CURRICULO-VITAE.DADOS-GERAIS.PREMIOS-TITULOS.PREMIO-TITULO' },{$project:{"_id":1, "CURRICULO-VITAE.DADOS-GERAIS._NOME-COMPLETO":1, "CURRICULO-VITAE.DADOS-GERAIS.PREMIOS-TITULOS.PREMIO-TITULO":1}}]).forEach(get_results)
