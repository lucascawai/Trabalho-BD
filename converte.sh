#!/bin/bash
npm install
for file in $( ls ./CVs/XMLNOVO | sed "s/\\..*//g"); do
node <<EOF
fs = require("fs");
p = require("xml2json");
fs.readFile("./CVs/XMLNOVO/$file.xml","utf-8",function(err,data){
	if(err){
		console.log("erro ao converter $file");
		console.log(err);
	}else{
		fs.writeFile("./CVs/JSON/$file.json",data,function(){
			console.log("arquivo $file convertido com sucesso!");
		})
	}
});
EOF
done
