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

  def connexion
    @titre = "Connexion"
  end

  def inscription
    @titre = "Inscription"
  end
end
