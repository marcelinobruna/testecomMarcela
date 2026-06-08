var express = require("express");
var router = express.Router();
var medidaController = require("../controllers/medidaController");

router.get("/sensoresTA", function (req, res) {
    medidaController.sensoresTotaisAtivos(req, res);
});

router.get("/criticoAlertas", function (req, res) {
    medidaController.alertasCriticos(req, res);
});

router.get("/maiorTemperaturaMediana", function (req, res) {
    medidaController.maiorTempMediana(req, res);
});

router.get("/maiorUmidadeMediana", function (req, res) {
    medidaController.maiorMedianaUmidade(req, res);
});

router.get("/graficoTempGeral", function (req, res) {
    medidaController.graficoTempGeral(req, res);
});

router.get("/graficoUmidadeGeral", function (req, res) {
    medidaController.graficoUmidadeGeral(req, res);
});

router.get("/graficoTempSensor1", function (req, res) {
    medidaController.graficoTempSensor1(req, res);
});

router.get("/estadoSensor", function (req, res) {
    medidaController.estadoSensor(req, res);
});

router.get("/capturaSensor", function (req, res) {
    medidaController.capturaSensor(req, res);
});

router.get("/umidadeSensor", function (req, res) {
    medidaController.umidadeSensor(req, res);
});

module.exports = router;