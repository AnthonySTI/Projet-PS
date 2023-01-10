# Différents choix du menu
$options = @(
    "Trier les éléments de votre bureau en dossiers en fonction des extensions",
    "Créer une statistique d'un dossier",
    "Quitter"
)

    # Afficher le menu
    Write-Host "Choisissez une option :" 
    for ($i = 0; $i -lt $options.Count; $i++) {
        Write-Host "  $($i + 1). $($options[$i])"
    }

    # Demander à l'utilisateur de choisir une option
    $choix = Read-Host "Entrez votre choix (1 - $($options.Count))"

    # Exécuter l'option choisie
    switch ($choix) {
        # choix 1
        1 {
            # Appeler le fichier associé à ce choix
            .\sorting-desktop-v2.ps1
        }
        # choix 2
        2 {
            # Appeler le fichier associé à ce choix
            .\stats-v2.ps1
        }
        # Quitter
        3 {
            if ($choix -eq 3) {
                Write-Host "Le programme a été fermé."
                Exit
            }
        }
        # Choix incorrect
        default {
            Write-Host "Votre choix est incorrect. Veuillez réessayer."
        }
    }

    