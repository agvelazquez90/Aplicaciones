get_parameter <- function(url)
library(urltools)

#url = url_decode("https://indicadores.estadisticas.pr/api/action/datastore_search?resource_id=3b4ed7e5-ca2c-44c1-9e09-053a2cdb531d&yNSA=Puerto Rico NSA&SA=Puerto Rico SA")
#url
#parse = url_parse("url")
#parse

test = param_get(urls = "url" ,parameter_names = colnames())
test
