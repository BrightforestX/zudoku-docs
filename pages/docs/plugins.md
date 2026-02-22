---
title: Zudoku Plugins
---

Zudoku can be extended using plugins. The framework uses a modular plugin architecture where each
plugin implements one or more plugin interfaces.

## Built-in Plugins

Zudoku includes several built-in plugins:

- **OpenAPI** - API reference and catalog from OpenAPI specifications
- **Markdown** - MDX documentation pages
- **API Keys** - API key management and identity
- **Search** - Full-text search (Pagefind)

## Custom Plugins

For creating custom plugins, see the [Custom Plugins](./custom-plugins.md) guide. Plugin types
include:

- **CommonPlugin** - Initialization, head elements, MDX components
- **ProfileMenuPlugin** - Custom profile menu items
- **NavigationPlugin** - Custom routes and sidebar
- **ApiIdentityPlugin** - API identities for testing
- **SearchProviderPlugin** - Custom search
- **EventConsumerPlugin** - Event handling
- **AuthenticationPlugin** - Auth providers
