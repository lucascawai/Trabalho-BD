function get_results(result) {
	print(tojson(result));
}

print("########################################")
print("1) Pessoas que falam francês: ")
db.curriculos.find({'CURRICULO-VITAE.DADOS-GERAIS.IDIOMAS.IDIOMA.IDIOMA':"FR"}, {'CURRICULO-VITAE.DADOS-GERAIS.NOME-COMPLETO':1, "_id":0}).forEach(get_results)
print("########################################")

print("########################################")
print("2) Pessoas que possuem mestrado: ")
db.curriculos.find({'CURRICULO-VITAE.DADOS-GERAIS.FORMACAO-ACADEMICA-TITULACAO.MESTRADO':{$exists:true}}, {'CURRICULO-VITAE.DADOS-GERAIS.NOME-COMPLETO':1, "_id":0}).forEach(get_results)
print("########################################")

print("########################################")
print("3) Quantas pessoas de cada estado: ")
db.curriculos.group({key:{'CURRICULO-VITAE.DADOS-GERAIS.UF-NASCIMENTO':1}, reduce: function(curr, result){result.total += 1}, initial: {total: 0}}).forEach(get_results)
print("########################################")


print("########################################")
print("4a) Pessoas e seus prêmios: (sem unwind)")
db.curriculos.find({'CURRICULO-VITAE.DADOS-GERAIS.PREMIOS-TITULOS':{$exists:true}}, {'CURRICULO-VITAE.DADOS-GERAIS.NOME-COMPLETO':1, "_id":0, "CURRICULO-VITAE.DADOS-GERAIS.PREMIOS-TITULOS.PREMIO-TITULO":1}).forEach(get_results)
print("########################################")

print("########################################")
print("4b) Pessoas e seus prêmios: (com unwind)")
db.curriculos.aggregate([{$unwind: '$CURRICULO-VITAE.DADOS-GERAIS.PREMIOS-TITULOS.PREMIO-TITULO' },{$project:{"_id":1, "CURRICULO-VITAE.DADOS-GERAIS.NOME-COMPLETO":1, "CURRICULO-VITAE.DADOS-GERAIS.PREMIOS-TITULOS.PREMIO-TITULO":1}}]).forEach(get_results)
print("########################################")
