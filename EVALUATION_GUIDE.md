# Guide d'Évaluation - Test Lead Infrastructure & DevOps

## 🎯 Objectif de ce Document
Fournir une grille d'évaluation objective et détaillée pour noter les candidats au poste de Lead Infrastructure & DevOps.

---

## 📊 Barème Global (100 points)

| Partie | Points | Temps estimé |
|--------|--------|--------------|
| Partie 1 : Infrastructure as Code | 35 | 5h |
| Partie 2 : Orchestration Kubernetes | 30 | 5h |
| Partie 3 : Architecture Multi-Campus | 20 | 4h |
| Partie 4 : Monitoring & Sécurité | 15 | 4h |
| Partie 5 : Questions Stratégiques | Bonus +10 | 2h |

---

## 📋 PARTIE 1 : Infrastructure as Code (35 points)

### Exercice 1.1 — Terraform Local (20 points)

#### Code Terraform (12 points)
- [ ] **Modules créés** (4 pts)
  - 4 pts : 3 modules (network, database, application) fonctionnels
  - 2 pts : 2 modules fonctionnels
  - 0 pt : Pas de modularisation

- [ ] **Variables et outputs** (3 pts)
  - 3 pts : Variables paramétrables, outputs utiles, tfvars.example
  - 2 pts : Variables présentes mais incomplètes
  - 1 pt : Valeurs en dur

- [ ] **Workspaces** (3 pts)
  - 3 pts : 3 workspaces (dev, staging, prod) avec configurations différentes
  - 2 pts : 2 workspaces
  - 1 pt : 1 workspace ou pas de différenciation

- [ ] **Fonctionnalité** (2 pts)
  - 2 pts : `terraform apply` fonctionne sans erreur
  - 1 pt : Fonctionne avec corrections mineures
  - 0 pt : Ne fonctionne pas

#### Documentation (4 points)
- [ ] **README complet** (2 pts)
  - Instructions d'utilisation claires
  - Commandes terraform documentées
  - Prérequis listés

- [ ] **Commentaires code** (2 pts)
  - Code auto-documenté
  - Commentaires pertinents

#### Bonnes pratiques (4 points)
- [ ] **Structure projet** (2 pts)
  - Organisation logique des fichiers
  - Séparation des responsabilités

- [ ] **Sécurité** (2 pts)
  - Pas de secrets en clair
  - .gitignore configuré
  - Utilisation de variables sensibles

---

### Exercice 1.2 — Architecture AWS (15 points)

#### Diagramme d'architecture (6 points)
- [ ] **Complétude** (3 pts)
  - 3 pts : Tous les composants présents (VPC, subnets, ALB, RDS, S3, VPN)
  - 2 pts : Composants principaux présents
  - 1 pt : Diagramme incomplet

- [ ] **Clarté** (2 pts)
  - Légendes, flux de données, zones de disponibilité

- [ ] **Haute disponibilité** (1 pt)
  - Multi-AZ, redondance

#### Code Terraform VPC (6 points)
- [ ] **VPC et Subnets** (3 pts)
  - VPC avec CIDR correct
  - 4 subnets (2 publics, 2 privés)
  - Tags appropriés

- [ ] **Routing** (2 pts)
  - Internet Gateway
  - NAT Gateway
  - Route tables configurées

- [ ] **Syntaxe** (1 pt)
  - Code valide (terraform validate)

#### Documentation technique (3 points)
- [ ] **Justification des choix** (2 pts)
  - Pourquoi cette architecture ?
  - Avantages/inconvénients

- [ ] **Estimation coûts** (1 pt)
  - Coût mensuel estimé
  - Optimisations possibles

---

## 📋 PARTIE 2 : Orchestration Kubernetes (30 points)

### Exercice 2.1 — Manifestes K8s (18 points)

#### Manifestes de base (8 points)
- [ ] **Deployment** (2 pts)
  - 3 replicas
  - Image définie
  - Labels corrects

- [ ] **Service** (1 pt)
  - Type ClusterIP
  - Selector correct

- [ ] **Ingress** (2 pts)
  - Règles de routing
  - Annotations nginx

- [ ] **ConfigMap & Secret** (2 pts)
  - Variables d'environnement
  - Secret base64

- [ ] **PVC** (1 pt)
  - Stockage persistant

#### Probes et Resources (6 points)
- [ ] **Health checks** (3 pts)
  - Liveness probe configurée
  - Readiness probe configurée
  - Endpoints corrects

- [ ] **Resource limits** (2 pts)
  - CPU et Memory limits
  - Requests définis

- [ ] **HPA** (1 pt)
  - Autoscaling configuré
  - Métriques pertinentes

#### Fonctionnalité (4 points)
- [ ] **Déploiement réussi** (2 pts)
  - `kubectl apply` sans erreur
  - Pods en état Running

- [ ] **Tests** (2 pts)
  - Application accessible
  - Probes fonctionnelles

---

### Exercice 2.2 — Helm Chart (12 points)

#### Structure Helm (6 points)
- [ ] **Chart.yaml** (1 pt)
  - Métadonnées complètes

- [ ] **Templates** (3 pts)
  - Tous les manifestes templatisés
  - Variables paramétrables

- [ ] **Helpers** (2 pts)
  - _helpers.tpl avec fonctions réutilisables
  - Labels communs

#### Values multi-environnements (4 points)
- [ ] **3 fichiers values** (3 pts)
  - dev, staging, prod
  - Différenciation pertinente

- [ ] **Paramétrage** (1 pt)
  - Variables bien organisées

#### Installation (2 points)
- [ ] **Helm install fonctionne** (2 pts)
  - Installation sans erreur
  - Application déployée

---

## 📋 PARTIE 3 : Architecture Multi-Campus (20 points)

### Exercice 3.1 — Réplication DB (10 points)

#### Architecture (4 points)
- [ ] **Document architecture** (2 pts)
  - Schéma Master-Slave ou Master-Master
  - Flux de données

- [ ] **Stratégie conflits** (2 pts)
  - Résolution de conflits documentée
  - Cas d'usage

#### Implémentation (4 points)
- [ ] **Docker Compose** (2 pts)
  - 2 conteneurs PostgreSQL
  - Configuration réplication

- [ ] **Scripts** (2 pts)
  - setup-replication.sh fonctionnel
  - test-failover.sh présent

#### Disaster Recovery (2 points)
- [ ] **Plan DR** (2 pts)
  - RPO/RTO définis
  - Procédure de failover

---

### Exercice 3.2 — Réseau VPN (10 points)

#### Architecture réseau (5 points)
- [ ] **Plan d'adressage** (2 pts)
  - CIDR pour chaque campus
  - Pas de chevauchement

- [ ] **Segmentation VLAN** (2 pts)
  - 4 VLANs (Admin, Étudiants, Serveurs, IoT)
  - Justification

- [ ] **Firewall rules** (1 pt)
  - Règles documentées

#### Simulation VPN (3 points)
- [ ] **Docker networks** (2 pts)
  - 2 réseaux isolés
  - Gateway VPN

- [ ] **WireGuard** (1 pt)
  - Configuration présente

#### Documentation (2 points)
- [ ] **Architecture documentée** (2 pts)
  - Diagramme réseau
  - Explications claires

---

## 📋 PARTIE 4 : Monitoring & Sécurité (15 points)

### Exercice 4.1 — Observabilité (9 points)

#### Stack monitoring (5 points)
- [ ] **Docker Compose** (2 pts)
  - Prometheus, Grafana, Alertmanager, Loki
  - Services démarrés

- [ ] **Configuration Prometheus** (2 pts)
  - Scrape configs
  - Règles d'alerte

- [ ] **Loki + Promtail** (1 pt)
  - Logs centralisés

#### Dashboard Grafana (2 points)
- [ ] **Dashboard fonctionnel** (2 pts)
  - 4+ métriques (CPU, Memory, HTTP, DB)
  - Visualisations pertinentes

#### Runbooks (2 points)
- [ ] **3 runbooks** (2 pts)
  - High CPU, Service Down, Database Slow
  - Procédures détaillées

---

### Exercice 4.2 — Sécurité (6 points)

#### Scan vulnérabilités (2 points)
- [ ] **Trivy scan** (1 pt)
  - Rapport généré

- [ ] **Correctifs proposés** (1 pt)
  - Solutions documentées

#### Hardening (3 points)
- [ ] **Dockerfile sécurisé** (2 pts)
  - Multi-stage
  - User non-root
  - Image minimale

- [ ] **Secrets management** (1 pt)
  - Docker secrets ou variables sécurisées

#### Politique sécurité (1 point)
- [ ] **Document complet** (1 pt)
  - Gestion secrets, backup, rotation

---

## 📋 PARTIE 5 : Questions Stratégiques (Bonus +10 points)

### Qualité des réponses (10 points)

#### Infrastructure (3 points)
- [ ] **Q1 : Multi-campus scalability** (1 pt)
  - Vision claire, considérations coûts/latence

- [ ] **Q2 : Disaster Recovery** (1 pt)
  - RPO/RTO réalistes, stratégie complète

- [ ] **Q3 : Optimisation coûts** (1 pt)
  - Stratégies concrètes

#### DevOps (2 points)
- [ ] **Q4 : CI/CD sans interruption** (1 pt)
  - Blue-green, canary, rolling update

- [ ] **Q5 : Terraform vs Ansible** (1 pt)
  - Compréhension des différences

#### Sécurité (2 points)
- [ ] **Q6 : Zero Trust** (1 pt)
  - Architecture moderne

- [ ] **Q7 : Gestion incidents DDoS** (1 pt)
  - Processus structuré

#### Leadership (3 points)
- [ ] **Q8 : Organisation équipe** (1 pt)
  - Structure claire, rôles définis

- [ ] **Q9 : Documentation** (1 pt)
  - Stratégie de knowledge transfer

- [ ] **Q10 : Labs spécialisés** (1 pt)
  - Innovation, isolation

---

## 🎯 Grille de Notation Finale

### Calcul du score

```
Score Total = Partie1 + Partie2 + Partie3 + Partie4 + Bonus
Maximum = 100 points + 10 bonus = 110 points
```

### Interprétation

| Score | Niveau | Décision |
|-------|--------|----------|
| 90-110 | **Excellent (Sénior confirmé)** | ✅ Recommandé fortement |
| 75-89 | **Très bon (Sénior)** | ✅ Recommandé |
| 60-74 | **Bon (Confirmé)** | ⚠️ À discuter (peut-être sous-dimensionné) |
| 45-59 | **Moyen (Junior/Confirmé)** | ❌ Insuffisant pour Lead |
| < 45 | **Insuffisant** | ❌ Non recommandé |

---

## 📝 Critères Qualitatifs Additionnels

### Code Quality (Observation transversale)
- [ ] **Commits Git** : Messages clairs, commits atomiques
- [ ] **Structure projet** : Organisation logique
- [ ] **Documentation** : README complets, commentaires pertinents
- [ ] **Bonnes pratiques** : DRY, KISS, conventions

### Soft Skills (Évaluation via questions)
- [ ] **Vision stratégique** : Capacité à penser long terme
- [ ] **Leadership** : Organisation d'équipe, délégation
- [ ] **Communication** : Clarté des explications
- [ ] **Problem solving** : Approche méthodique

---

## 🚨 Red Flags (Éliminatoires)

- ❌ **Secrets commitées** dans Git (credentials, tokens)
- ❌ **Plagiat** évident (copier-coller sans compréhension)
- ❌ **Aucun exercice complété** (< 30 points)
- ❌ **Code non fonctionnel** sur tous les exercices
- ❌ **Absence totale de documentation**

---

## 📊 Fiche d'Évaluation Candidat

```
===========================================
FICHE D'EVALUATION - LEAD INFRASTRUCTURE
===========================================

Candidat : _______________________________
Date : ___________________________________
Évaluateur : _____________________________

SCORES PAR PARTIE:
- Partie 1 (IaC)           : _____ / 35
- Partie 2 (Kubernetes)    : _____ / 30
- Partie 3 (Multi-Campus)  : _____ / 20
- Partie 4 (Monitoring)    : _____ / 15
- Partie 5 (Questions)     : _____ / 10 (bonus)

SCORE TOTAL                : _____ / 100 (+bonus)

NIVEAU ÉVALUÉ : 
[ ] Excellent (90-110)
[ ] Très bon (75-89)
[ ] Bon (60-74)
[ ] Moyen (45-59)
[ ] Insuffisant (< 45)

POINTS FORTS:
- _______________________________________
- _______________________________________
- _______________________________________

POINTS D'AMÉLIORATION:
- _______________________________________
- _______________________________________
- _______________________________________

RED FLAGS:
[ ] Aucun
[ ] Secrets commitées
[ ] Plagiat
[ ] Code non fonctionnel
[ ] Autre : _____________________________

RECOMMANDATION FINALE:
[ ] ✅ Recommandé fortement
[ ] ✅ Recommandé
[ ] ⚠️  À discuter
[ ] ❌ Non recommandé

COMMENTAIRES:
_________________________________________
_________________________________________
_________________________________________

Signature : _____________________________
===========================================
```

---

## 💡 Conseils pour l'Évaluation

### Avant l'évaluation
1. Vérifier que l'environnement candidat était fonctionnel
2. Noter le temps réel passé par le candidat
3. Cloner le fork du candidat

### Pendant l'évaluation
1. Tester chaque exercice dans l'ordre
2. Noter les points au fur et à mesure
3. Capturer les erreurs rencontrées
4. Vérifier les commits Git

### Après l'évaluation
1. Calculer le score total
2. Remplir la fiche d'évaluation
3. Préparer un feedback constructif
4. Décision finale avec l'équipe

---

## 📞 Support Évaluateur

En cas de doute sur la notation :
- Consulter les solutions de référence (si disponibles)
- Discuter avec un autre évaluateur
- Privilégier l'approche fonctionnelle vs perfection syntaxique

**Temps d'évaluation estimé : 3-4 heures**

---

*Ce guide garantit une évaluation objective et équitable de tous les candidats.*
