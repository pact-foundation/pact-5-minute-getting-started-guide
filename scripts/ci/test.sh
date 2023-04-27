#!/bin/bash

node --version
npm run intro
npm run test:consumer
npm run pact:show
npm run test:provider
npm test
npm run get:broker