/**
 * @providesModule RNTencentLBS
 * @flow
 */
'use strict';
import {NativeModules} from 'react-native';

var NativeRNTencentLBS = NativeModules.RNTencentLBS;

/**
 * High-level docs for the RNTencentLBS iOS API can be written here.
 */

var RNTencentLBS = {
  ...NativeRNTencentLBS
};

module.exports = RNTencentLBS;
