'use strict';

require('ace-css/css/ace.css');
require('font-awesome/css/font-awesome.css');


// Require index.html so it gets copied to dist
require('./index.html');
var CodeMirror = ('codemirror');
var Elm = require('./Main.elm');
var mountNode = document.getElementById('main');

// .embed() can take an optional second argument. This would be an object describing the data we need to start a program, i.e. a userID or some token
var app = Elm.Main.embed(mountNode);

App.ports.output.subscribe(function (options) {
    var doc = document.getElementById("demo");
    CodeMirror.fromTextArea(doc, {
          lineNumbers: true,
           mode: "htmlmixed"
        });
/*
    var $selectContainer = $('#select2-container');

    // Generate DOM tree with <select> and <option> inside and embed it in to the root node.
    var select = $('<select>', {
        html: options.map(function (option) {
            return $('<option>', {
                value: option[ 0 ],
                text: option[ 1 ]
            })
        })
    }).appendTo($selectContainer);

    // Initialize Select2, when everything is ready.
    var select2 = $(select).select2();

    // Setup change port subscription.
    select2.on('change', function (event) {
        App.ports.input.send(event.target.value);
    });

    // Trigger the change for initial value.
    select2.trigger('change');
    */
});