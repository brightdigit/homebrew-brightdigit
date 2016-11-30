#!/bin/bash
curl -L -s https://github.com/brightdigit/speculid/archive/$1.gz | shasum -a 256 | cut -c-64