var medidaModel = require("../models/medidaModel");

function sensoresTotaisAtivos(req, res) {
    medidaModel.sensoresTotaisAtivos()
        .then(function (resultado) {
            resultado.length > 0 ? res.status(200).json(resultado) : res.status(204).send("Nenhum resultado encontrado!");
        }).catch(function (erro) {
            console.log("Erro sensoresTotaisAtivos:", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

function alertasCriticos(req, res) {
    medidaModel.alertasCriticos()
        .then(function (resultado) {
            resultado.length > 0 ? res.status(200).json(resultado) : res.status(204).send("Nenhum resultado encontrado!");
        }).catch(function (erro) {
            console.log("Erro alertasCriticos:", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

function maiorTempMediana(req, res) {
    medidaModel.maiorTempMediana()
        .then(function (resultado) {
            resultado.length > 0 ? res.status(200).json(resultado) : res.status(204).send("Nenhum resultado encontrado!");
        }).catch(function (erro) {
            console.log("Erro maiorTempMediana:", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

function maiorMedianaUmidade(req, res) {
    medidaModel.maiorMedianaUmidade()
        .then(function (resultado) {
            resultado.length > 0 ? res.status(200).json(resultado) : res.status(204).send("Nenhum resultado encontrado!");
        }).catch(function (erro) {
            console.log("Erro maiorMedianaUmidade:", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

function graficoTempGeral(req, res) {
    medidaModel.graficoTempGeral()
        .then(function (resultado) {
            resultado.length > 0 ? res.status(200).json(resultado) : res.status(204).send("Nenhum resultado encontrado!");
        }).catch(function (erro) {
            console.log("Erro graficoTempGeral:", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

function graficoUmidadeGeral(req, res) {
    medidaModel.graficoUmidadeGeral()
        .then(function (resultado) {
            resultado.length > 0 ? res.status(200).json(resultado) : res.status(204).send("Nenhum resultado encontrado!");
        }).catch(function (erro) {
            console.log("Erro graficoUmidadeGeral:", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

function graficoTempSensor1(req, res) {
    medidaModel.graficoTempSensor1()
        .then(function (resultado) {
            resultado.length > 0 ? res.status(200).json(resultado) : res.status(204).send("Nenhum resultado encontrado!");
        }).catch(function (erro) {
            console.log("Erro graficoTempSensor1:", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

function estadoSensor(req, res) {
    medidaModel.estadoSensor()
        .then(function (resultado) {
            resultado.length > 0 ? res.status(200).json(resultado) : res.status(204).send("Nenhum resultado encontrado!");
        }).catch(function (erro) {
            console.log("Erro estadoSensor:", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

function capturaSensor(req, res) {
    medidaModel.capturaSensor()
        .then(function (resultado) {
            resultado.length > 0 ? res.status(200).json(resultado) : res.status(204).send("Nenhum resultado encontrado!");
        }).catch(function (erro) {
            console.log("Erro capturaSensor:", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

function umidadeSensor(req, res) {
    medidaModel.umidadeSensor()
        .then(function (resultado) {
            resultado.length > 0 ? res.status(200).json(resultado) : res.status(204).send("Nenhum resultado encontrado!");
        }).catch(function (erro) {
            console.log("Erro umidadeSensor:", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

module.exports = {
    sensoresTotaisAtivos,
    alertasCriticos,
    maiorTempMediana,
    maiorMedianaUmidade,
    graficoTempGeral,
    graficoUmidadeGeral,
    graficoTempSensor1,
    estadoSensor,
    capturaSensor,
    umidadeSensor
}