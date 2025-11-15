# restful_api.cr
Web-API for [restful-api.dev](https://restful-api.dev/) which can be used for your demo projects, testing, learning or even educating someone else

## Example
```cr
require "./restful_api"

restful_api = RestfulApi.new
objects = restful_api.get_objects()
puts objects
```
