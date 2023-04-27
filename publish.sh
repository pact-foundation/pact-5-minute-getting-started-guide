#!/bin/bash
GIT_COMMIT=$(git rev-parse HEAD)
GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
pact-broker publish pacts \
  --branch $GIT_BRANCH \
  --consumer-app-version $GIT_COMMIT \
  --broker-base-url ${PACT_BROKER_BASE_URL} \
  --broker-username ${PACT_BROKER_USERNAME} \
  --broker-password ${PACT_BROKER_PASSWORD} 

echo "Pact contract publishing complete!"
echo "Head over to ${PACT_BROKER_BASE_URL}/pacts/provider/GettingStartedOrderApi/consumer/GettingStartedOrderWeb/version/$GIT_COMMIT and login with"
echo "=> Username: ${PACT_BROKER_USERNAME}"
echo "=> Password: ${PACT_BROKER_PASSWORD}"
echo "to see your published contracts."