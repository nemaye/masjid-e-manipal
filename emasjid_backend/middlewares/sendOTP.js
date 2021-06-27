("use strict");
const nodemailer = require("nodemailer");

module.exports = function sendOTP(req, res, next){
    const otp = generateOTP();
    sendMail(otp, req.body.email).catch(console.error);
}

function generateOTP(){
    const otp = Math.floor(1000 + Math.random()*9000)
    console.log(otp)
    return otp;
}


async function sendMail(otp, email) {
  let transporter = nodemailer.createTransport({
    host: "smtp.googlemail.com", // Gmail Host
    port: 465, // Port
    secure: true, // this is true as port is 465
    auth: {
      user: "emasjidmanipal@gmail.com", // generated ethereal user
      pass: "abdullah@masjid", // generated ethereal password
    },
  });

  // send mail with defined transport object
  let info = await transporter.sendMail({
    from: '"Manipal Masjid" emasjidmanipal@gmail.com', // sender address
    to: `${email}`, // list of receivers
    subject: "Welcome Email", // Subject line
    // text: "Hello world?", // plain text body
    html: `Your otp is <b>${otp}</b>`, // html body
  });

  console.log("Message sent: %s", info.messageId);
}
