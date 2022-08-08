const Ong = require("../database/models/db");
const sequelize = require("../sequelize");

const users = sequelize.query("SELECT * FROM `tb_ongs`", { type: QueryTypes.SELECT });

const Ongs = 
{

    all(req,res,next){
        Ong.findAll().then((result) => {
            res.json(result);
        }).catch(next);
    },

    //precisa ajustar os parametros
    create(req, res, next) {
        const { cnpj, nomeOng, telefone, endereco, descricao } = req.body;
    
        Ong.create({
          cnpj,
          nomeOng,
          telefone,
          endereco,
          descricao
        })
          .then((result) => {
            res.status(201).json(result); //return with ID -> 201 (CREATED)
          })
          .catch(next);
      },
};

module.exports = users;


// const Ongs = {
//     all(req,res){
//         return res.json(["emailtetete", "senhasenha"]);
//     },
// };
// module.exports = Ongs;