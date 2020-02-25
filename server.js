// Configura o servidor
const express =require("express");
const server =express();

// Configura servidor para apresentar arquivos estáticos
server.use(express.static('public'));

//Habilita o corpo do formulário
server.use(express.urlencoded({extended: true}));


// Configura a conexão com o banco de dados
const Pool = require('pg').Pool;
const db = new Pool({
    user: 'postgres',
    password: '12345',
    host: 'localhost',
    port: 5432,
    database: 'doe'

})

//Configura a template engine
const nunjucks = require ("nunjucks")
nunjucks.configure("./", {
    express: server,
    noCache: true,
});






//Configura a apresentação da página
server.get("/", function(req, res){
        
    db.query("SELECT * FROM donors", function(err, result){
        if(err) return res.send ("Erro de banco de dados")

        const donors = result.rows;

        return res.render("index.html", {donors})

    })
        
});

//Pegar os dados do formulário
server.post("/", function(req, res){
        const name= req.body.name
        const email= req.body.name
        const blood= req.body.blood

    

    // Verifica se o valor é vazio
    if(name ==  "" || email == "" || blood == ""){
        return res.send("Todos os campos são obrigatórios.")
    }

    // Coloca valores dentro do banco de dados

    const query = `INSERT INTO donors ("name", "email", "blood")
                   VALUES ($1, $2, $3)`

    const values = [name, email, blood];

    db.query(query, values, function(err){
        //Fluxo de erro
        if (err) return res.send("erro no banco de dados.")

        //Fluxo de ideal
        return res.redirect("/");
    })

        

});

// Ligar o servidor e permitir acesso a porta 3000
server.listen(3000, function(){
    console.log("iniciei o servidor");
});