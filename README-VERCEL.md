# 🚀 Deploy do Ateliê da Lelê no Vercel

Guia completo para fazer o deploy do site no Vercel.

## 📋 Pré-requisitos

- Conta no [GitHub](https://github.com) (gratuita)
- Conta no [Vercel](https://vercel.com) (gratuita)

## 🎯 Passo a Passo

### 1. Preparar os Arquivos

Todos os arquivos já estão prontos:
- ✅ `index.html` - Página principal
- ✅ `loja.html` - Loja virtual
- ✅ `sobre.html` - Sobre nós
- ✅ `portfolio.html` - Portfólio
- ✅ `contato.html` - Contato
- ✅ `vercel.json` - Configuração do Vercel
- ✅ `styles.css` - Estilos personalizados

### 2. Criar Repositório no GitHub

1. **Acesse** [github.com](https://github.com)
2. **Clique** em "New repository"
3. **Nome:** `atelie-da-lele-site`
4. **Descrição:** "Site profissional do Ateliê da Lelê - Scrapbook Artesanal"
5. **Público** (gratuito)
6. **Clique** em "Create repository"

### 3. Fazer Upload dos Arquivos

**Opção A - Via GitHub Web:**
1. **Arraste** todos os arquivos para o repositório
2. **Commit** com mensagem: "Initial commit - Site Ateliê da Lelê"

**Opção B - Via Git (recomendado):**
```bash
git init
git add .
git commit -m "Initial commit - Site Ateliê da Lelê"
git branch -M main
git remote add origin https://github.com/SEU_USUARIO/atelie-da-lele-site.git
git push -u origin main
```

### 4. Deploy no Vercel

1. **Acesse** [vercel.com](https://vercel.com)
2. **Faça login** com sua conta GitHub
3. **Clique** em "New Project"
4. **Selecione** o repositório `atelie-da-lele-site`
5. **Clique** em "Deploy"

### 5. Configurações do Projeto

O Vercel vai detectar automaticamente que é um site estático. As configurações no `vercel.json` já estão otimizadas:

- ✅ **Build automático** dos arquivos HTML
- ✅ **Rotas configuradas** para todas as páginas
- ✅ **Headers de segurança** configurados
- ✅ **HTTPS automático**

## 🌐 URLs Geradas

Após o deploy, você terá:
- **URL principal:** `https://atelie-da-lele-site.vercel.app`
- **URL personalizada:** Pode configurar domínio próprio depois

## 🔧 Personalizações

### 1. Configurar Domínio Próprio

1. **No Vercel:** Settings → Domains
2. **Adicione** seu domínio (ex: `ateliedalelê.com.br`)
3. **Configure** DNS conforme instruções

### 2. Configurar Google Analytics

1. **Edite** o arquivo `index.html`
2. **Substitua** `GA_MEASUREMENT_ID` pelo seu ID real
3. **Commit** e push - deploy automático!

### 3. Atualizar Links das Redes Sociais

1. **Edite** os arquivos HTML
2. **Substitua** os links das redes sociais
3. **Commit** e push - deploy automático!

## 📱 Funcionalidades do Deploy

### ✅ Automático
- **Deploy automático** a cada push no GitHub
- **Previews** para cada branch/PR
- **Rollback** fácil para versões anteriores

### ✅ Performance
- **CDN global** (site rápido no mundo todo)
- **Cache otimizado** para imagens e CSS
- **Compressão automática** de arquivos

### ✅ Segurança
- **HTTPS automático**
- **Headers de segurança** configurados
- **Proteção contra ataques** básicos

## 🎯 Próximos Passos

1. **Teste** o site no Vercel
2. **Configure** domínio próprio (opcional)
3. **Adicione** Google Analytics real
4. **Personalize** links das redes sociais
5. **Adicione** fotos reais dos produtos

## 🆘 Suporte

- **Vercel Docs:** [vercel.com/docs](https://vercel.com/docs)
- **GitHub:** Para questões de código
- **PIT:** Para dúvidas sobre o site

---

**🎉 Parabéns! Seu site está no ar e funcionando perfeitamente!** ✨ 