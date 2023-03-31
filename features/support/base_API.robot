*** Settings ***
Documentation     API: https://rapidapi.com/iddogino1/api/my-store2
Variables       ../support/data/headers.yaml
Variables       ../support/data/product.yaml

*** Variable ***
${Base_URL}          https://my-store2.p.rapidapi.com
${Unauthorized_message}    Invalid API key. Go to https://docs.rapidapi.com/docs/keys for more info.
${Limit}    3
${Skip}    1
${non_existent_id}    892135
${product_not_found_message}    Product with ID ${non_existent_id} not found