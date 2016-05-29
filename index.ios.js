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
  test: function() {
    NativeRNOpenCV.test();
  }
};

module.exports = RNOpenCV;
