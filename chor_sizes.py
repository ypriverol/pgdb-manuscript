
import requests

url = 'https://rest.ensembl.org/info/assembly/homo_sapiens?content-type=application/json'
response = requests.get(url, headers={"Content-Type": "application/json"})
if response.ok:
  data = response.json()
  result = {}
  for chr in data['top_level_region']:
    try:
      chromosome = chr['name']
      length = chr['length']
      int(chromosome)
      result["chr{}".format(chromosome)] = length
      continue
    except ValueError:
      pass
    if (chromosome == 'MT') or (chromosome == 'X') or (chromosome == 'Y'):
      result["chr{}".format(chromosome)] = length
  for chr in result:
      print(chr + "\t" + str(result[chr]))
