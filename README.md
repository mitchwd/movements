#Movements

## Start server
`rails s`

## SIGN IN cURL Samples:

Response | cURL
---------|--------------
201: Success (Record Created) | `curl -s -o /dev/null -w "%{http_code}" -H "Content-Type: application/json" -d '{"movement": {"location_id": "1", "identifier_code": "234"}}' http://localhost:3000/sign_in.json`
404: Not Found (Invalid IDs) | ```curl -s -o /dev/null -w "%{http_code}" -H "Content-Type: application/json" -d '{"movement": {"location_id": "0", "identifier_code": "000"}}' http://localhost:3000/sign_in.json```
