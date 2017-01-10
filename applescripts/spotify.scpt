if application "Spotify" is running then
  tell application "spotify"
    set currentArtist to artist of current track as string
    set currentTrack to name of current track as string
    return "♫ " & currentArtist & " - " & currentTrack
  end tell
end if
