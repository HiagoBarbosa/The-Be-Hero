const { DataTypes } = require('json-server');

const sequelize = require("../sequelize");

const Ong = sequelize.define("ong", {
  nome: DataTypes.STRING,
  email: DataTypes.STRING,
});

//create table if not exists...
const init = async () => {
  await Ong.sync();
};

init();

module.exports = Ong;