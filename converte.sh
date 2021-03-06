#!/bin/bash
npm install
for file in $( ls ./CVs/XMLNOVO | sed "s/\\..*//g"); do
node <<EOF
var fs = require("fs");
var util = require("util");
var parser = require("xml2json")

fs.readFile("./CVs/XMLNOVO/$file.xml","utf-8",function(err,data){
	if(err){
		console.log("erro ao converter $file");
		console.log(err);
	}else{
		fs.writeFile("./CVs/JSON/$file.json",parser.toJson(data),function(){
			console.log("arquivo $file convertido com sucesso!");
		})
	}
});
EOF
done
