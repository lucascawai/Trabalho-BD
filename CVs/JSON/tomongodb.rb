names=[
	"Althoff.json",
	"Bretas.json",
	"DaPaz.json",
	"EduardoRocha.json",
	"Horta.json",
	"KizzyTerra.json",
	"LeticiaCremasco.json",
	"LucasSampaio.json",
	"MarinaCruz.json",
	"OscarMartins.json",
	"RafaelCacao.json",
	"RafaelChaves.json",
	"RafaelDePaulaPaiva.json",
	"RafaelSilveira.json",
	"RenanGemignani.json",
	"RicardoZalla.json",
	"RobinsonCallou.json",
	"Rodrigues.json",
	"Russo.json",
	"Saldanha.json",
	"ThiagoLima.json",
	"Villote.json"]

for name in names 
	`mongoimport --db curriculos --collection curriculos --file #{name}`
end

#db.curriculos.find({}, {_NACIONALIDADE:"B"}).pretty()
