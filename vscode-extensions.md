# Extensões Recomendadas para VSCode

Para usar todos os keybindings adaptados do seu NvChad, instale estas extensões:

## Essenciais
- **Vim** (`vscodevim.vim`) - Para emular o comportamento do Vim
- **GitLens** (`eamodio.gitlens`) - Para funcionalidades do LazyGit e Git Blame
- **GitHub Copilot** (`GitHub.copilot`) - Equivalente ao Codeium

## Navegação e Produtividade
- **Bookmarks** (`alefragnani.Bookmarks`) - Equivalente ao Harpoon
- **Todo Tree** (`Gruntfuggly.todo-tree`) - Para destacar comentários TODO
- **Error Lens** (`usernamehw.errorlens`) - Melhor visualização de erros (complementa o Trouble)

## Desenvolvimento
- **Thunder Client** (`rangav.vscode-thunder-client`) - Para testes de API
- **Auto Rename Tag** (`formulahendry.auto-rename-tag`) - Renomeia tags HTML automaticamente
- **Bracket Pair Colorizer 2** (`CoenraadS.bracket-pair-colorizer-2`) - Coloriza parênteses
- **Indent Rainbow** (`oderwat.indent-rainbow`) - Visualiza indentação

## Terminal e Git
- **Terminal** (built-in) - O terminal integrado do VSCode equivale ao ToggleTerm
- **Git Graph** (`mhutchie.git-graph`) - Visualização gráfica do Git

## Comandos de Instalação
```bash
# Instalar todas de uma vez
code --install-extension vscodevim.vim
code --install-extension eamodio.gitlens
code --install-extension GitHub.copilot
code --install-extension alefragnani.Bookmarks
code --install-extension Gruntfuggly.todo-tree
code --install-extension usernamehw.errorlens
code --install-extension formulahendry.auto-rename-tag
code --install-extension mhutchie.git-graph
```

## Mapeamentos Principais
- `space g g` - Git commands (GitLens)
- `space g b` - Toggle Git Blame
- `space p a` - Add bookmark (Harpoon-like)
- `space p h` - Show bookmarks list
- `space f R` - Find and replace in files
- `space f T` - Show TODO tree
- `space d *` - Debug controls
- `space O` - Toggle sidebar (file explorer)
- `space t *` - Terminal controls