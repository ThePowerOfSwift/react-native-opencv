/**
 * @providesModule RNOpenCV
 * @flow
 */
'use strict';

var NativeModules = require('react-native').NativeModules;
var NativeRNOpenCV = NativeModules.RNOpenCV;

/**
 * High-level docs for the RNOpenCV iOS API can be written here.
 */

var RNOpenCV = {
  makeGrayscale: function(imageBase64, callback) {
    NativeRNOpenCV.makeGrayscale(imageBase64, function (result) { callback(result) } );
  }
};

module.exports = RNOpenCV;
