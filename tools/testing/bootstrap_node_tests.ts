import 'core-js/es7/reflect';
import 'zone.js/dist/zone-node.js';
import 'zone.js/dist/long-stack-trace-zone.js';
import 'zone.js/dist/sync-test.js';
import 'zone.js/dist/async-test.js';
import 'zone.js/dist/fake-async-test.js';
require('zone.js/dist/proxy');

const jasmineCore: any = require('jasmine-core');
const patchedJasmine = jasmineCore.boot(jasmineCore);
(global as any)['jasmine'] = patchedJasmine;

jasmineCore.boot = function() {
  return patchedJasmine;
};

import { TestBed } from '@angular/core/testing';
import {
  ServerTestingModule,
  platformServerTesting,
} from '@angular/platform-server/testing';

require('zone.js/dist/jasmine-patch.js');

TestBed.initTestEnvironment(ServerTestingModule, platformServerTesting());
