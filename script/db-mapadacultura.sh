#!/bin/bash

service postgresql restart

rake db:drop
rake db:create
rake db:migrate
rake db:seed --trace

