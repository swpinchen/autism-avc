// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.

// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { showWeather } from "../plugins/weather";
import { SynthVoice } from "../plugins/voice";


// Internal imports, e.g:
// import { webspeech } from '../plugins/webspeech';
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g: initSelect2();
//weather API
  showWeather();
// WEB SPEECH API

// Init SpeechSynth API
const synth = window.speechSynthesis;
const voice = new SynthVoice({voiceURI: "Google UK English Female"});

// DOM Elements
const days = document.querySelectorAll("th");
// const textForm = document.querySelector('form');
const textInput = document.querySelector('#text-input');
const voiceSelect = document.querySelector('#voice-select');
const rate = document.querySelector('#rate');
const rateValue = document.querySelector('#rate-value');
const pitch = document.querySelector('#pitch');
const pitchValue = document.querySelector('#pitch-value');
const body = document.querySelector('main');
const items = document.querySelectorAll("img");
const details = document.querySelector(".details");
const sad = document.querySelector("#readsad")
const comfort = "Thank you for telling me how you feel. Just remember you get to"

//Browser identifier
// Firefox 1.0+
var isFirefox = typeof InstallTrigger !== 'undefined';
// Chrome 1+
var isChrome = !!window.chrome && !!window.chrome.webstore;

// Init voices array.  Hardcoded to US male (unable to implement dropdown on settings page)
let voices = [];
let speakText = "";

//Fix for duplication, run code depending on the browser
if (isFirefox) {
    getVoices();
}
if (isChrome) {
    if (synth.onvoiceschanged !== undefined) {
        synth.onvoiceschanged = getVoices;
    }
}


// EVENT LISTENERS

const readDetails = () => {
  voice.say(details.innerText);
};

const readText = (text) => {
  voice.say(text)
}

days.forEach( day => {
  day.addEventListener("click", function( event ) {
    voice.say(day.innerHTML)
  }, false);
});

items.forEach( item => {
  item.addEventListener("click", function( event ) {
    const intro = 'You have to'
    const text = intro + ' ' + details.innerText
    voice.say(text);
  }, false);
});


  if (sad) {
    console.log(sad.dataset.happyTitle);
    const text = comfort + ' ' + sad.dataset.happyDetails;
    readText(text);
  }
})