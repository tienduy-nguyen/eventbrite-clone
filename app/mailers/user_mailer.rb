class UserMailer < ApplicationMailer
  default from: 'no-reply@adev42.com'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    # @url  = 'https://eventlove.herokuapp.com/users/sign_in' 
    @url  = 'http://localhost:3000/users/sign_in' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

end
