# Test Lead Infrastructure & DevOps - Version 5 Heures

## 🎯 Vue d'ensemble

Test technique condensé pour évaluer rapidement les compétences essentielles d'un **Lead Infrastructure & DevOps** en **5 heures maximum**.

---

## 📂 Contenu du Dossier

```
test-5h/
├── TEST_LEAD_5H.md              # ⭐ Test technique (candidat)
├── GRILLE_EVALUATION_5H.md      # Grille de notation (évaluateur)
└── README.md                    # Ce fichier
```

---

## 🎯 Pour les Recruteurs

### Pourquoi ce test ?

**Avantages du format 5h :**
- ✅ Réalisable en **1 journée** (pas besoin de 3-4 jours)
- ✅ Évalue les **compétences essentielles** pour le poste
- ✅ Teste la **capacité à prioriser** sous contrainte de temps
- ✅ Plus facile à **organiser** (1 session de test)
- ✅ **Évaluation rapide** (45-60 min par candidat)

**Ce qui est évalué :**
- Infrastructure as Code (Terraform)
- Orchestration Kubernetes
- Monitoring (Prometheus/Grafana)
- Architecture multi-campus
- Vision stratégique

---

### Organisation du Test

#### 1. Préparation (1-2h avant le test)

**Environnement requis par candidat :**
- PC Windows (16 GB RAM minimum)
- Docker Desktop + Kubernetes activé
- Terraform installé
- Git + VS Code
- Connexion Internet stable

**Vérification :**
```powershell
# Utiliser le script de vérification du dossier parent
cd ..
powershell -ExecutionPolicy Bypass -File verify-setup.ps1
```

#### 2. Briefing Candidat (10 min)

**À remettre :**
- Document : `TEST_LEAD_5H.md`
- Accès au repository Git
- Credentials si nécessaire

**À expliquer :**
- Durée : **5 heures maximum**
- 3 exercices + 5 questions
- Prioriser si manque de temps
- Commits réguliers attendus
- Pull Request à la fin

**Instructions Git :**
```bash
# Fork le repository
git clone <votre-fork>
cd technical-test-fullstacks-devops

# Créer une branche
git checkout -b lead-infra-5h/<prenom-nom>

# Travailler...
git add .
git commit -m "feat: terraform infrastructure"
git push origin lead-infra-5h/<prenom-nom>

# Créer une Pull Request à la fin
```

#### 3. Pendant le Test (5h)

**Rôle du superviseur :**
- Disponible pour questions techniques (installation, bugs)
- Ne pas aider sur les exercices
- Noter l'heure de début et de fin réelle
- Observer l'approche du candidat (optionnel)

**Timing recommandé au candidat :**
- 0h00-0h10 : Lecture + Setup
- 0h10-1h40 : Exercice 1 (Terraform + AWS)
- 1h40-3h40 : Exercice 2 (Kubernetes + Monitoring)
- 3h40-4h40 : Exercice 3 (Multi-Campus)
- 4h40-5h00 : Questions + Relecture

#### 4. Évaluation (45-60 min)

**Utiliser :** `GRILLE_EVALUATION_5H.md`

**Processus :**
1. Cloner le fork du candidat
2. Tester chaque exercice (commandes dans la grille)
3. Noter selon le barème (100 points)
4. Remplir la fiche d'évaluation
5. Décision finale

**Seuils de décision :**
- **85-100** : ✅ Recommandé fortement (Excellent)
- **70-84** : ✅ Recommandé (Très bon)
- **55-69** : ⚠️ À discuter (Bon mais peut-être sous-dimensionné)
- **< 55** : ❌ Insuffisant pour Lead

---

## 👨💻 Pour les Candidats

### Avant de Commencer

1. **Vérifier l'environnement :**
   - Docker Desktop lancé et Kubernetes activé
   - Terraform installé (`terraform --version`)
   - Git configuré
   - Connexion Internet stable

2. **Lire le test complet :**
   - `TEST_LEAD_5H.md`
   - Comprendre les 3 exercices + questions
   - Identifier les priorités

3. **Créer votre branche Git :**
   ```bash
   git checkout -b lead-infra-5h/<votre-nom>
   ```

---

### Pendant le Test (5h)

#### ⏱️ Gestion du Temps

**CRITIQUE : Priorisez intelligemment !**

Si vous manquez de temps, suivez cet ordre :
1. **Exercice 1.1** (Terraform local) - 25 pts - ESSENTIEL
2. **Exercice 2.1** (Kubernetes) - 25 pts - ESSENTIEL
3. **Questions** - 10 pts - RAPIDE (30 min)
4. **Exercice 2.2** (Monitoring) - 15 pts - IMPORTANT
5. **Exercice 3** (Architecture) - 15 pts - CONCEPTUEL
6. **Exercice 1.2** (AWS) - 10 pts - BONUS

**Avec cette stratégie, vous pouvez obtenir 60+ points en 3h30.**

#### 📝 Commits Réguliers

```bash
# Après chaque exercice complété
git add .
git commit -m "feat: terraform infrastructure complete"
git push origin lead-infra-5h/<votre-nom>
```

**Exemples de messages de commit :**
- `feat: add terraform docker infrastructure`
- `feat: kubernetes deployment with HPA`
- `feat: monitoring stack with prometheus and grafana`
- `docs: add network architecture documentation`
- `docs: answer strategic questions`

#### 🧪 Tester au Fur et à Mesure

**Ne pas attendre la fin pour tester !**

**Exercice 1 :**
```bash
cd terraform/
terraform init
terraform plan
terraform apply
docker ps  # Vérifier les conteneurs
```

**Exercice 2.1 :**
```bash
cd kubernetes/
kubectl apply -f .
kubectl get pods -n aeig-prod
kubectl get hpa -n aeig-prod
```

**Exercice 2.2 :**
```bash
cd monitoring/
docker-compose up -d
# Ouvrir http://localhost:9090 (Prometheus)
# Ouvrir http://localhost:3000 (Grafana)
```

---

### Structure de Rendu Attendue

```
technical-test-lead-infra-5h/
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── terraform.tfvars.example
│   └── README.md
├── architecture/
│   ├── aws-architecture.png (ou .drawio)
│   └── architecture.md
├── kubernetes/
│   ├── namespace.yaml
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── configmap.yaml
│   ├── hpa.yaml
│   └── README.md
├── monitoring/
│   ├── docker-compose.yml
│   ├── prometheus/
│   │   └── prometheus.yml
│   └── README.md
├── multi-campus/
│   ├── network-plan.md
│   └── database-replication.md
├── answers.md
└── README.md
```

---

### Soumission Finale

1. **Vérifier la checklist :**
   - [ ] Code testé et fonctionnel
   - [ ] README.md avec instructions
   - [ ] Pas de secrets commitées
   - [ ] answers.md complété
   - [ ] Commits réguliers

2. **Créer la Pull Request :**
   - Titre : `[Lead Infra 5h] Prénom NOM`
   - Description :
     ```
     ## Temps passé
     X heures Y minutes
     
     ## Exercices complétés
     - [x] Exercice 1.1 : Terraform
     - [x] Exercice 1.2 : Architecture AWS
     - [x] Exercice 2.1 : Kubernetes
     - [ ] Exercice 2.2 : Monitoring (partiel)
     - [x] Exercice 3 : Multi-Campus
     - [x] Questions
     
     ## Difficultés rencontrées
     - ...
     
     ## Améliorations avec plus de temps
     - ...
     ```

---

## 📊 Comparaison des Versions

| Critère | Version 20h | Version 5h |
|---------|-------------|------------|
| **Durée** | 16-20h (3-4 jours) | 5h (1 journée) |
| **Exercices** | 10 exercices | 3 exercices |
| **Questions** | 10 questions | 5 questions |
| **Terraform** | Modules + AWS complet | Local + Architecture AWS |
| **Kubernetes** | Manifestes + Helm Chart | Manifestes uniquement |
| **Monitoring** | Stack complète + Runbooks | Stack basique |
| **Multi-Campus** | Réplication + VPN simulé | Architecture conceptuelle |
| **Points** | 100 + 10 bonus | 100 |
| **Évaluation** | 3-4h | 45-60 min |

**Recommandation :**
- **Version 5h** : Pour sélection rapide, évaluation initiale
- **Version 20h** : Pour évaluation approfondie, candidats finalistes

---

## 🎯 Compétences Évaluées (Version 5h)

### Techniques (80%)
- ✅ Infrastructure as Code (Terraform)
- ✅ Orchestration Kubernetes
- ✅ Monitoring (Prometheus/Grafana)
- ✅ Architecture réseau
- ✅ Réplication base de données
- ✅ Disaster Recovery

### Stratégiques (20%)
- ✅ Scalabilité multi-campus
- ✅ CI/CD sans interruption
- ✅ Optimisation coûts cloud
- ✅ Gestion d'incidents
- ✅ Organisation d'équipe

---

## 💡 Conseils pour Réussir

### Pour les Candidats

1. **Lisez tout le test avant de commencer** (10 min)
2. **Priorisez les exercices essentiels** (Terraform + Kubernetes = 50 pts)
3. **Testez au fur et à mesure** (ne pas tout faire puis tester)
4. **Documentez en commentant le code** (gagne du temps)
5. **Si bloqué, passez au suivant** (ne perdez pas 1h sur un problème)
6. **Gardez 30 min pour les questions** (facile et valorisant)

### Pour les Évaluateurs

1. **Vérifiez l'environnement avant le test** (éviter les pertes de temps)
2. **Soyez disponible pour support technique** (pas pour les exercices)
3. **Notez l'approche du candidat** (priorisation, méthodologie)
4. **Utilisez la grille strictement** (objectivité)
5. **Donnez un feedback constructif** (même si refusé)

---

## 🚨 Red Flags

**Éliminatoires :**
- ❌ Secrets/credentials commitées dans Git
- ❌ Plagiat évident (copier-coller sans compréhension)
- ❌ Score < 30 (aucun exercice complété)

**Alertes :**
- ⚠️ Pas de commits réguliers (1 seul commit final)
- ⚠️ Documentation absente
- ⚠️ Code non testé (erreurs évidentes)

---

## 📞 Support

### Questions Fréquentes

**Q : Puis-je utiliser des ressources en ligne ?**
R : Oui, documentation officielle, Stack Overflow, etc. Documentez vos sources.

**Q : Que faire si Docker ne démarre pas ?**
R : Documentez le problème, proposez une solution alternative, continuez sur les exercices conceptuels.

**Q : Puis-je utiliser des templates existants ?**
R : Oui, mais adaptez-les et documentez la source. Nous évaluons votre compréhension.

**Q : Que faire si je n'ai pas le temps de tout finir ?**
R : Normal ! Priorisez les exercices essentiels. Expliquez dans la PR ce que vous auriez fait avec plus de temps.

---

## 📄 Licence

Ce projet est sous licence MIT.

---

## 🚀 Quick Start

### Recruteurs
```powershell
# 1. Vérifier environnement candidat
cd ..
powershell -ExecutionPolicy Bypass -File verify-setup.ps1

# 2. Remettre le test
# TEST_LEAD_5H.md

# 3. Après 5h, évaluer avec
# GRILLE_EVALUATION_5H.md
```

### Candidats
```bash
# 1. Lire le test
cat TEST_LEAD_5H.md

# 2. Créer une branche
git checkout -b lead-infra-5h/<votre-nom>

# 3. Commencer !
# Prioriser : Terraform → Kubernetes → Questions
```

---

**Bonne chance ! 🎯**

*Version condensée pour une évaluation rapide et efficace des compétences Lead Infrastructure.*
