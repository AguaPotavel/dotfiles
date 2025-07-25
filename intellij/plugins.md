# Plugins Recomendados para IntelliJ IDEA

Para usar todos os keybindings adaptados do NvChad no IntelliJ, instale estes plugins:

## Essenciais
- **IdeaVim** - Plugin oficial do Vim para IntelliJ
- **AceJump** - Equivalente ao Leap motion (`s` para pular rapidamente)
- **String Manipulation** - Manipulação avançada de strings

## Git e Controle de Versão
- **GitToolBox** - Melhorias no Git integrado
- **Git Flow Integration** - Suporte ao Git Flow
- Os recursos de Git Blame e histórico já estão incluídos no IntelliJ

## Produtividade
- **Key Promoter X** - Mostra shortcuts quando você usa o mouse
- **Rainbow Brackets** - Coloriza parênteses e chaves
- **Atom Material Icons** - Ícones bonitos para arquivos
- **One Dark Theme** - Tema similar ao usado no NvChad

## Terminal e Sistema
- **Terminal** (built-in) - Terminal integrado já incluído
- **Database Tools** (built-in) - Para trabalhar com bancos de dados

## Desenvolvimento Web
- **Prettier** - Formatação de código JavaScript/TypeScript
- **ESLint** - Linting para JavaScript/TypeScript
- **Tailwind CSS** - Suporte ao Tailwind CSS (se usar)

## Instalação via IDE
1. `Ctrl+Alt+S` → Plugins
2. Procure pelos plugins na aba "Marketplace"
3. Instale e reinicie o IntelliJ

## Instalação via JetBrains Toolbox
```bash
# Se estiver usando JetBrains Toolbox, pode instalar plugins via linha de comando
# Exemplo para IdeaVim:
toolbox install plugin IdeaVim
```

## Configuração dos Arquivos

### 1. .ideavimrc
- Copie o arquivo `.ideavimrc` para `~/.ideavimrc`
- Ou cole o conteúdo em: `File → Settings → Editor → Vim Emulation`

### 2. Keymap XML (Opcional)
- Vá em `File → Settings → Keymap`
- Clique em "Import Keymap" e importe o arquivo `keymap.xml`
- Ou configure manualmente usando a interface gráfica

## Principais Keybindings Disponíveis

### Navegação
- `space gg` - Git changes (Vcs.Show.Local.Changes)
- `space gb` - Git blame toggle
- `space pa/h/n/p` - Bookmarks (Harpoon-like)
- `space O` - Project tool window
- `space ff` - Find in files
- `space fb` - Recent files

### Debug
- `space db` - Toggle breakpoint
- `space dc` - Continue/Resume
- `space di/o/O` - Step into/out/over
- `space dr` - Start debug
- `space dt` - Stop debug

### Terminal
- `space tf` - Activate terminal
- `space th` - Open in terminal
- `space tv` - Split terminal vertically

### LSP (Built-in)
- `gd` - Go to declaration
- `gi` - Go to implementation
- `gr` - Find usages
- `K` - Quick documentation
- `space rn` - Rename element
- `space ca` - Show intentions/actions

### Outros
- `;` - Command palette (GotoAction)
- `space lb/lw` - Problems view
- `space fT` - TODO tool window
- `space fR` - Replace in files

## Notas
- O IntelliJ já tem muitas funcionalidades equivalentes aos plugins do NvChad built-in
- A configuração do `.ideavimrc` é mais simples que keybindings separados
- Alguns plugins como "Leap" requerem o AceJump para funcionar corretamente
- O terminal integrado do IntelliJ é equivalente ao ToggleTerm do NvChad