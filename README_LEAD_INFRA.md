# Test Technique Lead Infrastructure & DevOps - AEIG

## 📌 Vue d'ensemble

Ce dossier contient le test technique complet pour le poste de **Lead Infrastructure & DevOps** chez AEIG (African Excellence Institute Group).

Le test évalue les compétences nécessaires pour concevoir, déployer et maintenir une infrastructure robuste, sécurisée et scalable pour un environnement multi-campus (Cotonou, Abidjan, et futurs sites).

---

## 📂 Structure du Dossier

```
devops/
├── test_devops.md                    # Test DevOps original (junior/confirmé)
├── test_lead_infrastructure.md       # ⭐ Test Lead Infrastructure (sénior)
├── INSTALLATION_GUIDE.md             # Guide d'installation environnement
├── EVALUATION_GUIDE.md               # Guide d'évaluation pour recruteurs
├── verify-setup.ps1                  # Script de vérification Windows
└── starter/                          # Application de base pour le test
    ├── api/                          # API Node.js
    ├── nginx/                        # Configuration Nginx
    └── docker-compose.yml            # Compose de base
```

---

## 🎯 Pour les Recruteurs / Organisateurs

### Étape 1 : Préparer l'Environnement
1. **Matériel requis par candidat :**
   - PC Windows (16 GB RAM minimum, 32 GB recommandé)
   - Connexion Internet stable (50 Mbps recommandé)
   - Écran externe (optionnel mais confortable)

2. **Installation logiciels :**
   - Suivre le guide : [`INSTALLATION_GUIDE.md`](./INSTALLATION_GUIDE.md)
   - Installer : WSL2, Docker Desktop, Terraform, Git, VS Code, Helm, Trivy
   - Temps d'installation : 1-2 heures

3. **Vérification environnement :**
   ```powershell
   # Exécuter le script de vérification
   powershell -ExecutionPolicy Bypass -File verify-setup.ps1
   ```
   - Le script génère un rapport : `verification-report.txt`
   - S'assurer que tous les tests passent ✅

### Étape 2 : Briefing Candidat
1. **Présenter le contexte :**
   - Poste : Lead Infrastructure & DevOps
   - Environnement : Multi-campus (Cotonou, Abidjan)
   - Missions : Infrastructure, DevOps, Sécurité, Monitoring

2. **Remettre les documents :**
   - Test : [`test_lead_infrastructure.md`](./test_lead_infrastructure.md)
   - Durée : 16-20 heures (3-4 jours)
   - Starter code : `starter/`

3. **Instructions Git :**
   ```bash
   # Fork le repository
   # Créer une branche
   git checkout -b lead-infra/<prenom-nom>
   
   # Travailler et commiter régulièrement
   git add .
   git commit -m "feat: terraform modules"
   
   # Pousser et créer une Pull Request
   git push origin lead-infra/<prenom-nom>
   ```

### Étape 3 : Évaluation
1. **Utiliser le guide :** [`EVALUATION_GUIDE.md`](./EVALUATION_GUIDE.md)
2. **Grille de notation :**
   - Partie 1 (IaC) : 35 points
   - Partie 2 (Kubernetes) : 30 points
   - Partie 3 (Multi-Campus) : 20 points
   - Partie 4 (Monitoring) : 15 points
   - Partie 5 (Questions) : +10 bonus
   - **Total : 100 points (+10 bonus)**

3. **Seuils de décision :**
   - ✅ **90-110** : Excellent (Recommandé fortement)
   - ✅ **75-89** : Très bon (Recommandé)
   - ⚠️ **60-74** : Bon (À discuter)
   - ❌ **< 60** : Insuffisant pour Lead

---

## 👨‍💻 Pour les Candidats

### Avant de Commencer
1. **Vérifier l'environnement :**
   ```powershell
   powershell -ExecutionPolicy Bypass -File verify-setup.ps1
   ```
   - Tous les outils doivent être ✅

2. **Lire le test complet :**
   - [`test_lead_infrastructure.md`](./test_lead_infrastructure.md)
   - Comprendre les 5 parties
   - Estimer le temps par exercice

3. **Cloner et créer une branche :**
   ```bash
   git clone <votre-fork>
   cd technical-test-fullstacks-devops
   git checkout -b lead-infra/<votre-nom>
   ```

### Pendant le Test
1. **Organiser votre temps :**
   - Jour 1 (5h) : Partie 1 - Terraform
   - Jour 2 (5h) : Partie 2 - Kubernetes
   - Jour 3 (4h) : Partie 3 - Multi-Campus
   - Jour 4 (4h) : Partie 4 - Monitoring/Sécurité
   - Jour 4 (2h) : Partie 5 - Questions

2. **Commiter régulièrement :**
   ```bash
   git add .
   git commit -m "feat: add terraform modules"
   git push origin lead-infra/<votre-nom>
   ```

3. **Documenter votre travail :**
   - README.md dans chaque dossier
   - Commentaires dans le code
   - Instructions d'utilisation

### Soumission
1. **Vérifier la checklist :**
   - [ ] Tous les exercices complétés (ou tentés)
   - [ ] Code testé et fonctionnel
   - [ ] Documentation complète
   - [ ] Pas de secrets commitées
   - [ ] answers-lead.md rempli

2. **Créer la Pull Request :**
   - Titre : `[Lead Infra] Prénom NOM`
   - Description : Résumé des choix techniques
   - Mentionner les difficultés rencontrées

---

## 📊 Comparaison des Tests

| Critère | test_devops.md | test_lead_infrastructure.md |
|---------|----------------|----------------------------|
| **Niveau** | Junior/Confirmé | Sénior |
| **Durée** | 10-12h | 16-20h |
| **Focus** | CI/CD, Docker | IaC, K8s, Architecture |
| **Terraform** | ❌ | ✅ Obligatoire |
| **Kubernetes** | ❌ | ✅ Obligatoire |
| **Multi-Campus** | ❌ | ✅ Obligatoire |
| **Questions stratégiques** | 5 questions | 10 questions |
| **Barème** | 100 points | 100 points + 10 bonus |

---

## 🛠️ Environnement Technique

### Logiciels Requis
- **WSL2** : Sous-système Linux pour Windows
- **Docker Desktop** : Conteneurisation + Kubernetes
- **Terraform** : Infrastructure as Code
- **Git** : Versioning
- **VS Code** : Éditeur (recommandé)
- **Helm** : Package manager Kubernetes (optionnel)
- **Trivy** : Scanner de vulnérabilités (optionnel)

### Ressources Système
| Composant | Minimum | Recommandé |
|-----------|---------|------------|
| RAM | 16 GB | 32 GB |
| CPU | 4 cores | 8 cores |
| Disque | 100 GB | 200 GB |
| Internet | 10 Mbps | 50 Mbps |

---

## 🎓 Compétences Évaluées

### Techniques
- ✅ Infrastructure as Code (Terraform)
- ✅ Orchestration de conteneurs (Kubernetes, Helm)
- ✅ CI/CD (GitHub Actions)
- ✅ Monitoring & Observabilité (Prometheus, Grafana, Loki)
- ✅ Sécurité (Hardening, Secrets, Scanning)
- ✅ Réseaux (VPN, Segmentation, Firewall)
- ✅ Bases de données (Réplication, Haute disponibilité)

### Stratégiques
- ✅ Architecture multi-sites
- ✅ Disaster Recovery
- ✅ Optimisation des coûts cloud
- ✅ Scalabilité
- ✅ Leadership technique
- ✅ Documentation & Knowledge Transfer

---

## 📞 Support

### Pour les Candidats
- En cas de problème technique : Documenter dans `ISSUES.md`
- Proposer une solution alternative
- Continuer sur les autres exercices

### Pour les Recruteurs
- Questions sur l'évaluation : Consulter `EVALUATION_GUIDE.md`
- Problèmes d'installation : Consulter `INSTALLATION_GUIDE.md`
- Script de vérification : `verify-setup.ps1`

---

## 📝 Changelog

### Version 2.0 (Lead Infrastructure)
- ✅ Ajout test Lead Infrastructure (sénior)
- ✅ Exercices Terraform obligatoires
- ✅ Exercices Kubernetes/Helm
- ✅ Architecture multi-campus
- ✅ Monitoring production-grade
- ✅ Questions stratégiques (10)
- ✅ Guide d'installation Windows
- ✅ Script de vérification automatique
- ✅ Guide d'évaluation détaillé

### Version 1.0 (DevOps Original)
- ✅ Test DevOps junior/confirmé
- ✅ CI/CD GitHub Actions
- ✅ Docker & Docker Compose
- ✅ Observabilité basique

---

## 📄 Licence

Ce projet est sous licence MIT.

---

## 👥 Auteurs

- **Test Original** : [Djamal GANI](https://github.com/yowedjamal)
- **Extension Lead Infrastructure** : Adaptation pour AEIG

---

## 🚀 Quick Start

### Pour Recruteurs
```powershell
# 1. Installer l'environnement (voir INSTALLATION_GUIDE.md)
# 2. Vérifier l'installation
powershell -ExecutionPolicy Bypass -File verify-setup.ps1

# 3. Remettre le test au candidat
# test_lead_infrastructure.md

# 4. Évaluer avec
# EVALUATION_GUIDE.md
```

### Pour Candidats
```bash
# 1. Vérifier l'environnement
powershell -ExecutionPolicy Bypass -File verify-setup.ps1

# 2. Lire le test
cat test_lead_infrastructure.md

# 3. Créer une branche
git checkout -b lead-infra/<votre-nom>

# 4. Commencer le test !
```

---

**Bonne chance ! 🎯**
