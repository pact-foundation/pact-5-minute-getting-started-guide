const pact = require("@pact-foundation/pact");
const Pact = pact.Pact;
const path = require("path");
const consumerName = "GettingStartedOrderWeb";
const providerName = "GettingStartedOrderApi";
const pactFile = path.resolve(`./pacts/${consumerName}-${providerName}.json`);

module.exports = {
  pactFile,
};

const provider = new Pact({
  logLevel: "info",
  consumer: consumerName,
  provider: providerName,
  host: "127.0.0.1"
});

module.exports = {
  provider,
  pactFile,
  consumerName,
  providerName,
  consumerVersion: "1.0.0",
};
