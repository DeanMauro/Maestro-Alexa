# Maestro-Alexa
Endpoint for UiPath Orchestrator Alexa Skills

To use:

1a) Run ngrok to set up a secure tunnel to your local server.
   - Linux: `./ngrok http 4567`
   - WSL:   `./ngrok http 4567 --log "stdout" --log-level "debug"`
   
1b) Grab the URL that ngrok spits back, prefix it with "https://", and add it to your Alexa Dev Console configuration.

2) Run `bundle` and start the local server with `ruby orchestraServer.rb`.

3) Make some calls
