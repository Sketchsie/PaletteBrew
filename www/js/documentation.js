// intro.js based documentation
function startIntro() {
  var intro = introJs();
  intro.setOptions({
    steps: [{
      element: document.querySelector('h2'),
      intro: 'Welcome to PaletteBrew!'
    },
    {
      element: document.querySelector('h2'),
      intro: 'PaletteBrew is an app that generates a color palette from an ' +
             'arbitrary JPEG image.'
    },
    {
      element: document.querySelector('form.well'),
      intro: 'Using it is very simple: first submit a JPEG image file with ' +
             'the "Choose File" button.',
      position: 'right'
    },
    {
      element: document.querySelector('form.well'),
      intro: 'Then choose the number of colors via the slider and, when ' +
             'you\'re ready, just click the "Process Image" button.',
      position: 'right'
    },
    {
      element: document.querySelector('#results-panel'),
      intro: 'The generated palette will then show up inside this panel.',
      position: 'top'
    },
    {
      element: document.querySelector('#results-panel'),
      intro: 'The RGB hex codes are given as well, so you can copy them and ' +
             'use the colors in your designs and applications!',
      position: 'top'
    },
    {
      intro: "And that's it! Hope you have fun with PaletteBrew!"
    }]
  });
  intro.start();
}
