// Setting up our test framework
import * as chai from 'chai';
const expect = chai.expect;
import chaiAsPromised from 'chai-as-promised';
chai.use(chaiAsPromised);

// We need Pact in order to use it in our test
import { provider } from "../pact.js";
import { MatchersV3 } from "@pact-foundation/pact";
const { eachLike } = MatchersV3;

// Importing our system under test (the orderClient) and our Order model
import { Order } from "./order.js";
import { fetchOrders } from "./orderClient.js";

// This is where we start writing our test
describe("Pact with Order API", () => {
  describe("given there are orders", () => {
    const itemProperties = {
      name: "burger",
      quantity: 2,
      value: 100,
    };

    const orderProperties = {
      id: 1,
      items: eachLike(itemProperties),
    };

    describe("when a call to the API is made", () => {
      before(() => {
        provider
          .given("there are orders")
          .uponReceiving("a request for orders")
          .withRequest({
            method: "GET",
            path: "/orders",
          })
          .willRespondWith({
            body: eachLike(orderProperties),
            status: 200,
            headers: {
              "Content-Type": "application/json; charset=utf-8",
            },
          });
      });

      it("will receive the list of current orders", () => {
        return provider.executeTest((mockserver) => {
          // The mock server is started on a randomly available port,
          // so we set the API mock service port so HTTP clients
          // can dynamically find the endpoint
          process.env.API_PORT = mockserver.port;
          return expect(fetchOrders()).to.eventually.have.deep.members([
            new Order(orderProperties.id, [itemProperties]),
          ]);
        });
      });
    });
  });
});