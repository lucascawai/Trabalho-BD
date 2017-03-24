#!/bin/bash
npm install
for file in $( ls ./CVs/XMLNOVO | sed "s/\\..*//g"); do
node <<EOF
var fs = require("fs");
var util = require("util");
var parser = require("xml2js").parseString;

fs.readFile("./CVs/XMLNOVO/$file.xml","utf-8",function(err,data){
	if(err){
		console.log("erro ao converter $file");
		console.log(err);
	}else{
			parser(data,{mergeAttrs: true,attrNameProcessors: [function(name){
				return "_"+name;
			}]},function(err,json){
			fs.writeFile("./CVs/JSON/$file.json",JSON.stringify(json),function(){
				console.log(util.inspect(err));
				console.log("arquivo $file convertido com sucesso!");
			})
		})
	}
});
EOF
done
