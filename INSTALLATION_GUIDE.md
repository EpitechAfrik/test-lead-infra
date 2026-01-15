# Guide d'Installation - Environnement de Test Lead Infrastructure

## 🎯 Objectif
Préparer un PC Windows pour le test technique Lead Infrastructure & DevOps.

---

## 📋 Checklist Logiciels à Installer

### 1. WSL2 (Windows Subsystem for Linux)
**Pourquoi :** Nécessaire pour Docker Desktop et outils Linux.

**Installation :**
```powershell
# Ouvrir PowerShell en Administrateur
wsl --install
wsl --set-default-version 2
```

**Vérification :**
```powershell
wsl --list --verbose
```

---

### 2. Docker Desktop
**Pourquoi :** Conteneurisation, Kubernetes local, orchestration.

**Installation :**
1. Télécharger : https://www.docker.com/products/docker-desktop/
2. Installer avec options :
   - ✅ Use WSL 2 instead of Hyper-V
   - ✅ Add shortcut to desktop
3. Redémarrer le PC
4. Lancer Docker Desktop
5. Activer Kubernetes :
   - Settings → Kubernetes → Enable Kubernetes → Apply & Restart

**Vérification :**
```powershell
docker --version
docker-compose --version
kubectl version --client
```

**Configuration recommandée :**
- Resources → Memory : 8 GB minimum
- Resources → CPUs : 4 minimum
- Resources → Disk : 60 GB

---

### 3. Terraform
**Pourquoi :** Infrastructure as Code.

**Installation :**
```powershell
# Option 1 : Chocolatey (recommandé)
choco install terraform

# Option 2 : Téléchargement manuel
# 1. Télécharger depuis https://www.terraform.io/downloads
# 2. Extraire terraform.exe dans C:\terraform\
# 3. Ajouter C:\terraform\ au PATH système
```

**Vérification :**
```powershell
terraform --version
```

---

### 4. Git
**Pourquoi :** Versioning, collaboration.

**Installation :**
```powershell
# Option 1 : Chocolatey
choco install git

# Option 2 : Téléchargement manuel
# https://git-scm.com/download/win
```

**Configuration initiale :**
```bash
git config --global user.name "Prénom Nom"
git config --global user.email "email@example.com"
```

**Vérification :**
```powershell
git --version
```

---

### 5. VS Code (Éditeur recommandé)
**Pourquoi :** IDE avec extensions pour Docker, Terraform, Kubernetes.

**Installation :**
1. Télécharger : https://code.visualstudio.com/
2. Installer les extensions :
   - Docker
   - Terraform
   - Kubernetes
   - YAML
   - GitLens
   - Remote - WSL

**Vérification :**
```powershell
code --version
```

---

### 6. Helm (Optionnel mais recommandé)
**Pourquoi :** Package manager pour Kubernetes.

**Installation :**
```powershell
# Chocolatey
choco install kubernetes-helm

# Ou téléchargement manuel
# https://github.com/helm/helm/releases
```

**Vérification :**
```powershell
helm version
```

---

### 7. Trivy (Scanner de vulnérabilités)
**Pourquoi :** Sécurité des images Docker.

**Installation :**
```powershell
# Télécharger depuis https://github.com/aquasecurity/trivy/releases
# Extraire trivy.exe dans C:\trivy\
# Ajouter au PATH
```

**Vérification :**
```powershell
trivy --version
```

---

### 8. Chocolatey (Gestionnaire de paquets Windows)
**Pourquoi :** Facilite l'installation des outils.

**Installation :**
```powershell
# PowerShell en Administrateur
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

**Vérification :**
```powershell
choco --version
```

---

## 🔧 Configuration Post-Installation

### 1. Tester Docker
```powershell
# Test basique
docker run hello-world

# Test avec compose
docker-compose --version
```

### 2. Tester Kubernetes
```powershell
# Vérifier les nodes
kubectl get nodes

# Devrait afficher : docker-desktop   Ready    control-plane   ...
```

### 3. Tester Terraform
```powershell
# Créer un fichier test
mkdir C:\terraform-test
cd C:\terraform-test

# Créer main.tf
@"
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}
"@ | Out-File -FilePath main.tf -Encoding UTF8

# Initialiser et tester
terraform init
terraform plan
```

---

## 📦 Préparer le Repository de Test

### 1. Cloner le repository
```powershell
cd C:\Users\<USERNAME>\Documents
git clone https://github.com/eliptikcorp/technical-test-fullstacks-devops.git
cd technical-test-fullstacks-devops
```

### 2. Créer la structure pour le candidat
```powershell
# Le candidat travaillera dans son fork
# Lui fournir les instructions de fork
```

---

## 🧪 Script de Vérification Automatique

Créer un fichier `verify-setup.ps1` :

```powershell
# verify-setup.ps1
Write-Host "=== Vérification de l'environnement ===" -ForegroundColor Green

$tools = @{
    "WSL2" = "wsl --list --verbose"
    "Docker" = "docker --version"
    "Docker Compose" = "docker-compose --version"
    "Kubernetes" = "kubectl version --client"
    "Terraform" = "terraform --version"
    "Git" = "git --version"
    "Helm" = "helm version"
    "Trivy" = "trivy --version"
}

foreach ($tool in $tools.GetEnumerator()) {
    Write-Host "`n[$($tool.Key)]" -ForegroundColor Yellow
    try {
        Invoke-Expression $tool.Value
        Write-Host "✅ OK" -ForegroundColor Green
    } catch {
        Write-Host "❌ ERREUR : $($tool.Key) non installé" -ForegroundColor Red
    }
}

Write-Host "`n=== Test Docker ===" -ForegroundColor Green
docker run --rm hello-world

Write-Host "`n=== Test Kubernetes ===" -ForegroundColor Green
kubectl get nodes

Write-Host "`n=== Vérification terminée ===" -ForegroundColor Green
```

**Exécution :**
```powershell
powershell -ExecutionPolicy Bypass -File verify-setup.ps1
```

---

## 📊 Ressources Système Recommandées

| Composant | Minimum | Recommandé |
|-----------|---------|------------|
| RAM | 16 GB | 32 GB |
| CPU | 4 cores | 8 cores |
| Disque | 100 GB libre | 200 GB libre |
| Connexion | 10 Mbps | 50 Mbps |

---

## 🚨 Troubleshooting Commun

### Problème : Docker Desktop ne démarre pas
**Solution :**
```powershell
# Vérifier WSL2
wsl --update
wsl --set-default-version 2

# Redémarrer le service
net stop com.docker.service
net start com.docker.service
```

### Problème : Kubernetes n'est pas disponible
**Solution :**
1. Docker Desktop → Settings → Kubernetes
2. Reset Kubernetes Cluster
3. Enable Kubernetes
4. Apply & Restart

### Problème : Terraform ne trouve pas Docker provider
**Solution :**
```powershell
# Vérifier que Docker Desktop est lancé
docker ps

# Réinitialiser Terraform
terraform init -upgrade
```

---

## ✅ Checklist Finale Avant le Test

- [ ] WSL2 installé et fonctionnel
- [ ] Docker Desktop lancé et opérationnel
- [ ] Kubernetes activé dans Docker Desktop
- [ ] Terraform installé et testé
- [ ] Git configuré avec nom/email
- [ ] VS Code avec extensions installées
- [ ] Helm installé
- [ ] Trivy installé
- [ ] Repository cloné
- [ ] Script de vérification exécuté avec succès
- [ ] Connexion Internet stable

---

## 📞 Support

En cas de problème d'installation :
1. Documenter l'erreur (screenshot)
2. Vérifier les logs Docker Desktop
3. Consulter la documentation officielle
4. Contacter l'administrateur du test

---

**Temps d'installation estimé : 1-2 heures**

*Une fois l'environnement prêt, le candidat peut commencer le test technique.*
