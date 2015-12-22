class PagesController < ApplicationController

  def home
    @titre = "Accueil"
  end

  def contact
    @titre = "Contact"
  end

  def about
    @titre = "À Propos"
  end
  
  def help
    @titre = "Aide"
  end

  def signin
    @titre = "Connexion"
  end

  def signout
    @titre = "Déconnexion"
  end

  def inscription
    @titre = "Inscription"
  end
end
