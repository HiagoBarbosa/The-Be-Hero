const Ong = require("../database/models/db")

const Ongs = 
{

    all(req,res,next){
        Ong.findAll().then((result) => {
            res.json(result);
        }).catch(next);
    },

    //precisa ajustar os parametros
    create(req, res, next) {
        const { brand, model, hp } = req.body;
    
        Ong.create({
          brand,
          model,
          hp,
        })
          .then((result) => {
            res.status(201).json(result); //return with ID -> 201 (CREATED)
          })
          .catch(next);
      },
};

module.exports = Ongs;


// const Ongs = {
//     all(req,res){
//         return res.json(["emailtetete", "senhasenha"]);
//     },
// };
// module.exports = Ongs;