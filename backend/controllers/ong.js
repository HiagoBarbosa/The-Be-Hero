const Ong = {
  all(req, res, next) {
    Car.findAll()
      .then((result) => {
        res.json(result);
      })
      .catch(next);
  },

  create(req, res, next) {
      const { brand, model, hp } = req.body;

      Ong.create({
        nome,
        email,
      })
        .then((result) => {
          res.status(201).json(result); //return with ID -> 201 (CREATED)
        })
        .catch(next);
    },
};
module.exports = Ong;