# Grille d'Évaluation - Test Lead Infrastructure 5h

## 📊 Barème Simplifié (100 points)

---

## ✅ EXERCICE 1 : Infrastructure as Code (35 points)

### 1.1 Terraform Local (25 points)

| Critère | Points | Évaluation |
|---------|--------|------------|
| **Fonctionnalité** | | |
| `terraform apply` fonctionne sans erreur | 10 | ☐ Oui (10) ☐ Avec erreurs mineures (5) ☐ Non (0) |
| Réseau Docker créé | 2 | ☐ Oui (2) ☐ Non (0) |
| PostgreSQL avec volume persistant | 4 | ☐ Oui (4) ☐ Sans volume (2) ☐ Non (0) |
| 2 conteneurs applicatifs | 2 | ☐ Oui (2) ☐ 1 seul (1) ☐ Non (0) |
| **Variables & Outputs** | | |
| Variables paramétrables (pas de valeurs en dur) | 5 | ☐ Oui (5) ☐ Partiel (3) ☐ Non (0) |
| Outputs utiles (IPs, ports) | 3 | ☐ Oui (3) ☐ Partiel (1) ☐ Non (0) |
| **Documentation** | | |
| README avec commandes terraform | 3 | ☐ Complet (3) ☐ Partiel (1) ☐ Absent (0) |
| **SOUS-TOTAL 1.1** | **/25** | |

---

### 1.2 Architecture AWS (10 points)

| Critère | Points | Évaluation |
|---------|--------|------------|
| **Diagramme** | | |
| Diagramme présent et lisible | 2 | ☐ Oui (2) ☐ Non (0) |
| VPC + Subnets (publics/privés) | 1 | ☐ Oui (1) ☐ Non (0) |
| ALB + EC2 + RDS | 1 | ☐ Oui (1) ☐ Non (0) |
| VPN Site-to-Site | 1 | ☐ Oui (1) ☐ Non (0) |
| **Documentation** | | |
| Justifications techniques pertinentes | 3 | ☐ Excellentes (3) ☐ Bonnes (2) ☐ Basiques (1) ☐ Absentes (0) |
| Estimation coûts mensuelle | 2 | ☐ Oui (2) ☐ Approximative (1) ☐ Non (0) |
| **SOUS-TOTAL 1.2** | **/10** | |

**TOTAL EXERCICE 1 : _____ / 35**

---

## ✅ EXERCICE 2 : Kubernetes & Monitoring (40 points)

### 2.1 Déploiement Kubernetes (25 points)

| Critère | Points | Évaluation |
|---------|--------|------------|
| **Manifestes** | | |
| Namespace créé | 1 | ☐ Oui (1) ☐ Non (0) |
| Deployment valide (kubectl apply fonctionne) | 5 | ☐ Oui (5) ☐ Avec erreurs (2) ☐ Non (0) |
| 3 replicas configurées | 1 | ☐ Oui (1) ☐ Non (0) |
| Labels corrects | 1 | ☐ Oui (1) ☐ Non (0) |
| Service ClusterIP | 2 | ☐ Oui (2) ☐ Non (0) |
| ConfigMap avec variables | 2 | ☐ Oui (2) ☐ Non (0) |
| **Probes** | | |
| Liveness probe configurée | 2 | ☐ Oui (2) ☐ Non (0) |
| Readiness probe configurée | 2 | ☐ Oui (2) ☐ Non (0) |
| Probes fonctionnelles (testées) | 1 | ☐ Oui (1) ☐ Non (0) |
| **Resources & HPA** | | |
| Resource limits (CPU/Memory) | 2 | ☐ Oui (2) ☐ Non (0) |
| HPA configuré (min/max/target) | 3 | ☐ Oui (3) ☐ Non (0) |
| HPA fonctionnel | 2 | ☐ Oui (2) ☐ Non (0) |
| **Application** | | |
| Application accessible (kubectl port-forward) | 3 | ☐ Oui (3) ☐ Non (0) |
| **Documentation** | | |
| README avec commandes kubectl | 2 | ☐ Complet (2) ☐ Partiel (1) ☐ Absent (0) |
| **SOUS-TOTAL 2.1** | **/25** | |

---

### 2.2 Monitoring Stack (15 points)

| Critère | Points | Évaluation |
|---------|--------|------------|
| **Docker Compose** | | |
| docker-compose.yml présent | 1 | ☐ Oui (1) ☐ Non (0) |
| Stack démarre (docker-compose up) | 4 | ☐ Oui (4) ☐ Avec erreurs (2) ☐ Non (0) |
| Prometheus + Grafana + Node Exporter | 2 | ☐ 3 services (2) ☐ 2 services (1) ☐ < 2 (0) |
| **Configuration Prometheus** | | |
| prometheus.yml présent | 1 | ☐ Oui (1) ☐ Non (0) |
| Scrape Node Exporter configuré | 3 | ☐ Oui (3) ☐ Non (0) |
| Règle d'alerte CPU > 80% | 2 | ☐ Oui (2) ☐ Non (0) |
| **Grafana** | | |
| Grafana accessible (http://localhost:3000) | 2 | ☐ Oui (2) ☐ Non (0) |
| Dashboard importé ou configuré | 2 | ☐ Oui (2) ☐ Non (0) |
| Documentation accès (URL, credentials) | 1 | ☐ Oui (1) ☐ Non (0) |
| **SOUS-TOTAL 2.2** | **/15** | |

**TOTAL EXERCICE 2 : _____ / 40**

---

## ✅ EXERCICE 3 : Architecture Multi-Campus (15 points)

### 3.1 Plan Réseau (8 points)

| Critère | Points | Évaluation |
|---------|--------|------------|
| **Plan d'adressage IP** | | |
| CIDR Cotonou (10.1.0.0/16) | 1 | ☐ Oui (1) ☐ Non (0) |
| CIDR Abidjan (10.2.0.0/16) | 1 | ☐ Oui (1) ☐ Non (0) |
| Pas de chevauchement | 1 | ☐ Oui (1) ☐ Non (0) |
| **Segmentation VLAN** | | |
| 4 VLANs définis (Admin, Étudiants, Serveurs, IoT) | 1 | ☐ Oui (1) ☐ Non (0) |
| Justification de la segmentation | 1 | ☐ Oui (1) ☐ Non (0) |
| **Architecture VPN** | | |
| Type VPN choisi (IPsec/WireGuard) | 1 | ☐ Oui (1) ☐ Non (0) |
| Schéma de connexion site-to-site | 1 | ☐ Oui (1) ☐ Non (0) |
| Firewall rules principales | 1 | ☐ Oui (1) ☐ Non (0) |
| **SOUS-TOTAL 3.1** | **/8** | |

---

### 3.2 Réplication Base de Données (7 points)

| Critère | Points | Évaluation |
|---------|--------|------------|
| **Stratégie de réplication** | | |
| Choix Master-Slave ou Master-Master | 1 | ☐ Oui (1) ☐ Non (0) |
| Justification du choix | 1 | ☐ Pertinente (1) ☐ Non (0) |
| Schéma de flux de données | 1 | ☐ Oui (1) ☐ Non (0) |
| **Plan Disaster Recovery** | | |
| RPO < 1h défini | 1 | ☐ Oui (1) ☐ Non (0) |
| RTO < 4h défini | 1 | ☐ Oui (1) ☐ Non (0) |
| Procédure de failover (étapes) | 1 | ☐ Oui (1) ☐ Non (0) |
| **Backup Strategy** | | |
| Fréquence + Rétention + Stockage | 1 | ☐ Complet (1) ☐ Partiel (0.5) ☐ Non (0) |
| **SOUS-TOTAL 3.2** | **/7** | |

**TOTAL EXERCICE 3 : _____ / 15**

---

## ✅ QUESTIONS STRATÉGIQUES (10 points)

| Question | Points | Évaluation |
|----------|--------|------------|
| Q1 : Scalabilité Multi-Campus | 2 | ☐ Excellente (2) ☐ Bonne (1) ☐ Faible (0) |
| Q2 : CI/CD Sans Interruption | 2 | ☐ Excellente (2) ☐ Bonne (1) ☐ Faible (0) |
| Q3 : Optimisation Coûts Cloud | 2 | ☐ Excellente (2) ☐ Bonne (1) ☐ Faible (0) |
| Q4 : Incident Management DDoS | 2 | ☐ Excellente (2) ☐ Bonne (1) ☐ Faible (0) |
| Q5 : Organisation Équipe | 2 | ☐ Excellente (2) ☐ Bonne (1) ☐ Faible (0) |

**Critères de notation :**
- **Excellente** : Réponse complète, concrète, avec exemples
- **Bonne** : Réponse correcte mais superficielle
- **Faible** : Réponse vague ou hors sujet

**TOTAL QUESTIONS : _____ / 10**

---

## 📊 SCORE FINAL

| Partie | Score | Maximum |
|--------|-------|---------|
| Exercice 1 : IaC | _____ | 35 |
| Exercice 2 : K8s & Monitoring | _____ | 40 |
| Exercice 3 : Multi-Campus | _____ | 15 |
| Questions Stratégiques | _____ | 10 |
| **TOTAL** | **_____** | **100** |

---

## 🎯 Interprétation du Score

| Score | Niveau | Décision |
|-------|--------|----------|
| **85-100** | Excellent (Sénior confirmé) | ✅ **Recommandé fortement** |
| **70-84** | Très bon (Sénior) | ✅ **Recommandé** |
| **55-69** | Bon (Confirmé) | ⚠️ **À discuter** (peut-être sous-dimensionné pour Lead) |
| **40-54** | Moyen | ❌ **Insuffisant pour Lead** |
| **< 40** | Faible | ❌ **Non recommandé** |

---

## 📝 Critères Qualitatifs

### Code Quality
- [ ] Commits Git clairs et réguliers
- [ ] Code propre et lisible
- [ ] Documentation présente
- [ ] Pas de secrets commitées ⚠️

### Approche
- [ ] Priorisation intelligente
- [ ] Gestion du temps efficace
- [ ] Solutions pragmatiques

### Communication
- [ ] README clairs
- [ ] Explications techniques pertinentes
- [ ] Réponses structurées

---

## 🚨 Red Flags (Éliminatoires)

- ❌ **Secrets/credentials commitées** dans Git
- ❌ **Plagiat évident** (copier-coller sans adaptation)
- ❌ **Score < 30** (aucun exercice complété correctement)

---

## 📋 Fiche d'Évaluation Candidat

```
===========================================
FICHE D'EVALUATION - LEAD INFRASTRUCTURE 5H
===========================================

Candidat : _______________________________
Date : ___________________________________
Évaluateur : _____________________________
Temps réel passé : _______ heures

SCORES:
- Exercice 1 (IaC)         : _____ / 35
- Exercice 2 (K8s/Monitor) : _____ / 40
- Exercice 3 (Multi-Campus): _____ / 15
- Questions                : _____ / 10
-------------------------------------------
TOTAL                      : _____ / 100

NIVEAU : 
[ ] Excellent (85-100)
[ ] Très bon (70-84)
[ ] Bon (55-69)
[ ] Moyen (40-54)
[ ] Faible (< 40)

POINTS FORTS:
- _______________________________________
- _______________________________________

POINTS D'AMÉLIORATION:
- _______________________________________
- _______________________________________

RED FLAGS:
[ ] Aucun
[ ] Secrets commitées
[ ] Plagiat
[ ] Autre : _____________________________

RECOMMANDATION:
[ ] ✅ Recommandé fortement
[ ] ✅ Recommandé
[ ] ⚠️  À discuter
[ ] ❌ Non recommandé

COMMENTAIRES:
_________________________________________
_________________________________________

Signature : _____________________________
===========================================
```

---

## 💡 Conseils pour l'Évaluateur

### Avant l'évaluation
1. Cloner le fork du candidat
2. Vérifier que l'environnement de test était fonctionnel
3. Noter le temps réel passé (indiqué dans la PR)

### Pendant l'évaluation
1. Tester dans l'ordre : Exercice 1 → 2 → 3 → Questions
2. Noter immédiatement les points
3. Capturer les erreurs rencontrées
4. Vérifier les commits Git (qualité, fréquence)

### Tests à effectuer

**Exercice 1 :**
```bash
cd terraform/
terraform init
terraform plan
terraform apply
# Vérifier : docker ps (conteneurs créés)
terraform destroy
```

**Exercice 2.1 :**
```bash
cd kubernetes/
kubectl apply -f .
kubectl get pods -n aeig-prod
kubectl get hpa -n aeig-prod
# Tester l'accès
kubectl port-forward -n aeig-prod svc/aeig-web 8080:80
curl http://localhost:8080
```

**Exercice 2.2 :**
```bash
cd monitoring/
docker-compose up -d
# Vérifier Prometheus : http://localhost:9090
# Vérifier Grafana : http://localhost:3000
docker-compose down
```

### Après l'évaluation
1. Calculer le score total
2. Remplir la fiche d'évaluation
3. Préparer un feedback constructif
4. Décision finale

---

## ⏱️ Temps d'Évaluation

**Estimé : 45-60 minutes par candidat**

- Tests techniques : 30-40 min
- Lecture documentation : 10 min
- Notation : 10 min

---

*Cette grille garantit une évaluation rapide, objective et équitable.*
