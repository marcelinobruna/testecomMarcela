var database = require("../database/config");

function sensoresTotaisAtivos() {
    return database.executar(`SELECT * FROM sensoresTotaisAtivos`);
}

function alertasCriticos() {
    return database.executar(`SELECT * FROM alertasCriticos`);
}

function maiorTempMediana() {
    return database.executar(`SELECT * FROM maiorTempMediana`);
}

function maiorMedianaUmidade() {
    return database.executar(`SELECT * FROM maiorMedianaUmidade`);
}

function graficoTempGeral() {
    return database.executar(`SELECT * FROM graficoTempGeral`);
}

function graficoUmidadeGeral() {
    return database.executar(`SELECT * FROM garficoTempVisaoGeral`);
}

function graficoTempSensor1() {
    return database.executar(`SELECT * FROM graficoTempSensor1`);
}

function estadoSensor() {
    return database.executar(`SELECT * FROM EstadoSensor`);
}

function capturaSensor() {
    return database.executar(`SELECT * FROM CapturaSensor`);
}

function umidadeSensor() {
    return database.executar(`SELECT * FROM UmidadeSensorSelecionado`);
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
