require_relative 'features/support/api_helper'
require 'json'

# from console
job_name = ARGV[0]
job_number = ARGV[1]

# picture
thumbnail = {'url' => 'https://www.highmowingseeds.com/pub/media/catalog/product/cache/image/675x675/e9c3970ab036de70892d86c6d221abfe/2/4/2419.jpg'}


fields = []
fields.push( {'name' => 'Autors', 'value' => 'Beatrise Plesniece'})
fields.push( {'name' => 'Merkis', 'value' => 'REST kursi'})
fields.push('name' => 'Job', 'value' => job_name)
fields.push('name' => 'Build number', 'value' => job_number)

embed = []
embed.push( 'title'=> 'Test title',
            'colour' => 25000,
            'thumbnail' => thumbnail,
             'fields' => fields)


payload = { 'content' => 'Beatrise Plesniece',
            'embeds' => embed

}.to_json

API.post('https://discordapp.com/api/webhooks/459005793627406359/-6FGK6la-XlTO_UZ2G62Cx-TZ0AwmMqIPd3rBkusV1nwPQo1RlmhAp3Kaxn_gHS85Aqs',
         headers: {'Content-Type' => 'application/json'},
         cookies:{},
         payload: payload
)
