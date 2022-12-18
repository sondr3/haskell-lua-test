local system = require("system")
local path = require("path")
local heime = require("heime")

print(system.os)
print(system.getenv("USER"))

print(system.getwd())

print(path.directory(path.directory(system.getwd())))

print(heime.factorial(10))
print(heime.utils.test)
