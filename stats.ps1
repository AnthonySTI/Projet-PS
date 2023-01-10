# Demande à l'utilisateur le chemin du dossier à analyser
$path = Read-Host "Entre le chemin complet du dossier que tu souhaites analyser "

# Options du menu
$options = @(
    "Afficher les éléments du dossier",
    "Afficher le nombre d'éléments présents dans le dossier",
    "Afficher la taille du dossier en octets",
    "Quitter"
)

# Affiche le menu
Write-Host "Que souhaites-tu afficher ?"
for ($i = 0; $i -lt $options.Count; $i++) {
    Write-Host "  $($i + 1). $($options[$i])"
}

# Demande à l'utilisateur d'entrer son choix
$choix = Read-Host "Entre ton choix (1 - $($options.Count))"

# Exécute l'option choisie
switch ($choix) {
    # Option 1
    1 {
        # Appelle la commande associée à ce choix
        Get-ChildItem -Path $path
    }
    # Option 2
    2 {
        # Appelle la commande associée à ce choix
        (Get-ChildItem -Path $path).Count
    }
    # Option 3
    3 {
        # Appelle la commande associée à ce choix
        $tailleEnOctets = (Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum).Sum
        $tailleEnGigaOctets = [math]::Round($tailleEnOctets / 1000000000, 2)
        Write-Host $tailleEnGigaOctets "Go"

    }
    # Quitter
    4 {
        if ($choix -eq 4) {
            Write-Host "Le programme a été fermé."
            Exit
        }
    }
    # Choix Incorrect
    default {
        Write-Host "Votre choix est incorrect. Veuillez réessayer."
    }
}
