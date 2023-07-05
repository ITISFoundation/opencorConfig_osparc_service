import json
import sys

config = {
  "simulation": {
    "Starting point": 60,
    "Ending point": 180,
    "Point interval": 1
  },
  "parameters": {
    "neural_input/x_i": sys.argv[1],
    "neural_input/x_e": sys.argv[2]
  },
  "output": [
    "active_tension/T",
  ]
}

with open('config.json', 'w') as outfile:
    json.dump(config, outfile)