#!/bin/bash

eval $(gp env -e) 
mix ecto.migrate
iex -S mix phx.server