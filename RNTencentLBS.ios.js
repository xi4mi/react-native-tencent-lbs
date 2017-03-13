/**
 * @providesModule RNTencentLBS
 * @flow
 */
'use strict';

var NativeRNTencentLBS = require('NativeModules').RNTencentLBS;

/**
 * High-level docs for the RNTencentLBS iOS API can be written here.
 */

var RNTencentLBS = {
  test: function() {
    NativeRNTencentLBS.test();
  }
};

module.exports = RNTencentLBS;
