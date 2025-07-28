# 📦 Guia para Adicionar Produtos com Imagens

## Estrutura do Produto

Cada produto deve seguir esta estrutura JSON:

```javascript
{
    name: 'Nome do Produto',
    description: 'Descrição detalhada do produto',
    price: '89.90',
    category: 'albuns', // ou 'kits', 'acessorios'
    shopeeLink: 'https://shopee.com.br/ateliedalelê',
    icon: 'fas fa-heart', // ícone FontAwesome
    gradient: 'from-rose-light to-rose-medium', // gradiente de fallback
    images: [
        { src: 'images/produtos/nome-da-imagem.jpg' }
    ]
}
```

## Como Adicionar Imagens

### 1. Coloque as imagens na pasta `images/produtos/`

### 2. Formatos suportados:
- `.jpg` / `.jpeg`
- `.png`
- `.webp` (recomendado para melhor performance)

### 3. Tamanhos recomendados:
- **Largura**: 400-800px
- **Altura**: 400-600px
- **Proporção**: 4:3 ou 3:4
- **Tamanho do arquivo**: máximo 500KB

## Exemplo de Produto Completo

```javascript
{
    name: 'Álbum de Casamento Premium',
    description: 'Álbum de casamento com acabamento premium, detalhes em renda e flores secas. Inclui 20 páginas decoradas.',
    price: '129.90',
    category: 'albuns',
    shopeeLink: 'https://shopee.com.br/ateliedalelê',
    icon: 'fas fa-heart',
    gradient: 'from-rose-light to-rose-medium',
    images: [
        { src: 'images/produtos/album-casamento-1.jpg' },
        { src: 'images/produtos/album-casamento-2.jpg' }
    ]
}
```

## Funcionalidades Implementadas

### ✅ Elemento `<img>` dinâmico
- Carrega imagens automaticamente
- Suporte a múltiplas imagens por produto

### ✅ Fallback robusto
- Imagem padrão: `images/produtos/26f5.png`
- Fallback secundário: `images/produtos/download.jpg`
- Gradiente com ícone como último recurso

### ✅ CSS otimizado
- `object-fit: cover` para manter proporções
- Altura fixa de 280px (responsiva)
- Efeitos de hover suaves

### ✅ Layout responsivo
- Desktop: 280px de altura
- Tablet: 200px de altura
- Mobile: 180px de altura

### ✅ Indicador de carregamento
- Spinner animado durante carregamento
- Esconde automaticamente quando imagem carrega

## Como Testar

1. Abra `loja.html` no navegador
2. Verifique se as imagens carregam corretamente
3. Teste o fallback removendo uma imagem
4. Verifique a responsividade em diferentes tamanhos de tela

## Dicas de Performance

1. **Otimize as imagens** antes de adicionar
2. **Use WebP** quando possível
3. **Mantenha tamanhos consistentes**
4. **Não exceda 500KB** por imagem 