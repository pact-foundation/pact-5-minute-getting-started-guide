#!/bin/bash -eu
set -eu # This needs to be here for windows bash, which doesn't read the #! line above


node --version
npm run intro
npm run test:consumer
npm run pact:show
npm run test:provider
npm test
npm run get:broker