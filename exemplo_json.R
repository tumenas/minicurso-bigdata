
#install.packages('spotifyr')
#devtools::install_github('charlie86/spotifyr')

library(devtools)

library(spotifyr)

Sys.setenv(SPOTIFY_CLIENT_ID = 'xxxxxxxxxxxxxxxxxxx')
Sys.setenv(SPOTIFY_CLIENT_SECRET = 'xxxxxxxxxxxxxxxxxxxxxxxx')

access_token <- get_spotify_access_token()

iron_maiden <- get_artist_audio_features('iron maiden')

iron_maiden_TopTracks <- get_artist_top_tracks('6mdiAmATAx73kdxrNrnlao', market = "BR",
                      authorization = get_spotify_access_token(),
                      include_meta_info = FALSE)


########## JSON #############
library(httr)
library(jsonlite)

astros = GET("http://api.open-notify.org/astros.json")

res = GET("http://api.open-notify.org/iss-pass.json",
    query = list(lat = -13.009565000112607, lon = -38.53302776815651))



