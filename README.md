# SpotifyPlaylistManager

## App structure
```
SpotifyApp/
├── Models/
│   ├── Playlist.swift
│   ├── Song.swift
│   └── User.swift
├── ViewModels/
│   ├── PlaylistViewModel.swift
│   ├── SongsViewModel.swift
│   └── UserViewModel.swift
├── Views/
│   ├── ConnectWithSptView.swift
│   ├── SptPlaylistView.swift
│   ├── SptSongsView.swift
│   └── PlaybackView.swift
├── Services/
│   └── SpotifyService.swift
├── Extensions/
│   └── View+Extensions.swift
└── SpotifyAppApp.swift
```
Purpose:
1. Models: For defining data structures.
1. ViewModels: For managing the data logic.
1. Views: For UI components.
1. Services: For network calls to the Spotify API.
1. Extensions: For utility extensions.
