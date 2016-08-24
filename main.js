const jsdom = require("jsdom");
const Elm = require("./dist/elm-main.js");
const readline = require('readline');

global.document = jsdom.jsdom("<main id='main'></main>");
const window = document.defaultView;
const body = window.document.body;


function runElmApp(text, cb) {
  // This is pretty slow...
  const app = Elm.Main.embed(body, {
    text: text.trim() || null,
  });

  // This is the only way I could find of determining when the Elm
  // app has initialized.
  // I bet there is a race condition here.
  //
  app.ports.initialized.subscribe(() => {
    cb(body.outerHTML);
  });
}


const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question("Input a string for Elm to embed\n> ", answer => {
  runElmApp(answer, html => {
    console.log("Elm says:");
    console.log(html);
    rl.close();
  });
});
