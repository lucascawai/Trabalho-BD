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
	"RenanGemignani.json",
	"Rodrigues.json",
	"ThiagoLima.json",
	"Villote.json"]

for name in names 
	`mongoimport --db curriculos --collection curriculos --file #{name}`
end

#db.curriculos.find({}, {_NACIONALIDADE:"B"}).pretty()
