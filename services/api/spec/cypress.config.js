const { defineConfig } = require('cypress')

module.exports = defineConfig({
  e2e: {
    baseUrl: "http://localhost:new_project_test_app_port",
    defaultCommandTimeout: 10000,
    supportFile: "cypress/support/index.js",
  }
})
