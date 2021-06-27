const express = require('express');
const router = express.Router();
const sendOTP = require('../middlewares/sendOTP')

router.post('/', sendOTP,(req, res) => {
    console.log('test', req.body);
    res.send('Success')
})

module.exports = router