--[[

Copyright 2012 connectFree k.k. and the lev authors. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS-IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

--]]

-- Bootstrap require system
local lev = require('lev')
local debug = require('debug')
local utils = require('utils')
local callbox = require('callbox')
local signal = lev.signal

_G.getcwd = nil
_G.argv = nil

-- clear some globals
-- This will break lua code written for other lua runtimes
_G.process = callbox:new()
for k,v in pairs(io) do _G.process[k] = v end
for k,v in pairs(lev.process) do lev[k] = v end
lev._process, lev.process = lev.process, nil
_G.io = nil
_G.os = nil
_G.math = nil
_G.string = nil
_G._coroutine = _G.coroutine --private function
_G.coroutine = nil
_G.jit = nil
_G.debug = debug
_G.table = nil
_G.print = utils.print
_G.p = utils.prettyPrint
_G.debug = utils.debug
_G.Buffer = lev.buffer

_G.WorkerID = lev.getenv("LEV_WORKER_ID")

lev.activate_signal_handler( signal.SIGPIPE )

