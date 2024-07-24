# SpotifyPlaylistManager

## App structure
```
SpotifyApp/
├── Models/
│   ├── Playlist.swift
│   ├── Song.swift
│   └── User.swift
├── ViewModels/
│   ├── ConnectWithSptViewModel.swift
│   ├── SptPlaylistViewModel.swift
│   ├── SptSongsViewModel.swift
│   ├── PlaybackViewModel.swift
│   └── FilterViewModel.swift
├── Views/
│   ├── ConnectWithSptView.swift
│   ├── SptPlaylistView.swift
│   ├── SptSongsView.swift
│   ├── PlaybackView.swift
│   └── FilterView.swift
├── Services/
│   └── SpotifyService.swift
└── Utilities/
    └── Extensions.swift
```
Purpose:
1. Models: For defining data structures.
1. ViewModels: For managing the data logic.
1. Views: For UI components.
1. Services: For network calls to the Spotify API.
1. Utilities: For utility extensions.
