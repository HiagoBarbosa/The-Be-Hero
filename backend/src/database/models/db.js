const {DataTypes} = require("sequelize");
const sequelize = require("../sequelize");

//alterar pasta arquivo para db.js

const Genero = sequelize.define("tb_generos",{
    id_sexo: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    sexo: {
        type: DataTypes.CHAR(8),
        allowNull: false
    }
});

const Endereco = sequelize.define("tb_enderecos",{
    id_endereco:{
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true 
    },
    cep:{
        type: DataTypes.STRING,
        allowNull: false
    },
    nome_rua: {
        type: DataTypes.STRING(180),
        allowNull: false
    },
    num:{
        type: DataTypes.INTEGER,
        allowNull: false
    },
    complemento:{
        type: DataTypes.STRING(180),
    }
});

const Telefone = sequelize.define("tb_telefones",{
    id_telefone:{
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    ddi:{
        type: DataTypes.INTEGER,
        allowNull: false
    },
    ddd:{
        type: DataTypes.INTEGER,
        allowNull: false
    },
    num_celular:{
        type: DataTypes.INTEGER,
        allowNull: false
    },
    num_fixo:{
        type: DataTypes.INTEGER,
        allowNull: false
    }

});

const Fotos = sequelize.define("tb_fotos",{
    id_fotos:{
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    image:{
        type: DataTypes.BLOB,
        allowNull: false
    }
});

const Descricao = sequelize.define("tb_descricoes",{
    id_descricao:{
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    descricao:{
        type: DataTypes.STRING(180),
        allowNull: false
    }
});

const Especie = sequelize.define("tb_especies",{
    id_especie:{
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true 
    },
    especie:{
        type: DataTypes.STRING(50),
        allowNull: false
    }
});

const Casos = sequelize.define("tb_casos", {
    id_caso:{
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    nome_caso: {
        type: DataTypes.STRING(180),
        allowNull: false
    },
    raca:{
        type: DataTypes.STRING(180),
        allowNull: false
    },
    dta_recolhido:{
        type: DataTypes.DATE,
        allowNull: false
    }
},);

Casos.belongsTo(Descricao, {
    constraints: true,
    foreignKey: 'id_descricao'
});

Casos.hasMany(Fotos, {
    foreignKey: 'id_fotos',
});

Casos.belongsTo(Genero, {
    constraints: true,
    foreignKey: 'id_sexo'
});

Casos.belongsTo(Especie, {
    constraints: true,
    foreignKey: 'id_especie'
});


const Ong = sequelize.define("tb_ongs", {
    id_ong:{
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    cnpj:{
        type: DataTypes.INTEGER,
        allowNull: false
    },
    nome_ong:{
        type: DataTypes.STRING(60),
        allowNull: false
    },
});

Ong.belongsTo(Telefone, {
    constraints: true,
    foreignKey: 'id_telefone'
});

Ong.belongsTo(Endereco, {
    constraints: true,
    foreignKey: 'id_endereco'
});

Ong.belongsTo(Descricao, {
    constraints: true,
    foreignKey: 'id_descricao'
});

Ong.hasMany(Casos,{
    foreignKey: 'id_caso',
});

Ong.hasMany(Fotos,{
    foreignKey: 'id_fotos',
})

const Voluntario = sequelize.define("tb_voluntarios", {
    id_voluntario:{
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    cpf: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    nome_voluntario:{
        type: DataTypes.STRING(60),
        allowNull: false
    }
});

Voluntario.belongsTo(Telefone, {
    constraints: true,
    foreignKey: 'id_telefone'
});

Voluntario.belongsTo(Endereco, {
    constraints: true,
    foreignKey: 'id_endereco'
});

Voluntario.belongsTo(Descricao, {
    constraints: true,
    foreignKey: 'id_descricao'
});

Voluntario.hasMany(Fotos,{
    constraints: true,
    foreignKey: 'id_fotos'
});

Voluntario.belongsTo(Genero,{
    constraints: true,
    foreignKey: 'id_sexo'
});

const init = async () => {
    await Genero.sync();
    await Endereco.sync();
    await Telefone.sync();
    await Fotos.sync();
    await Descricao.sync();
    await Especie.sync();
    await Casos.sync({force: true});
    await Ong.sync({force: true});
    await Voluntario.sync({force: true});
}

init();

module.exports= Genero;
module.exports = Endereco;
module.exports = Telefone;
module.exports = Fotos;
module.exports = Descricao;
module.exports= Especie;
module.exports = Casos;
module.exports = Ong;
module.exports = Voluntario;