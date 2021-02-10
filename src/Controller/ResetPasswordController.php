<?php
 
namespace App\Controller;
 
use App\Classe\Mail;
use App\Entity\User;
use App\Entity\ResetPassword;
use App\Form\ResetPasswordType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Validator\Constraints\DateTime;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
 
class ResetPasswordController extends AbstractController
{
    private $entityManager;
    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }
    /**
     * @Route("/mot-de-passe-oublie", name="reset_password")
     */
    public function index(Request $request): Response
 
    {
        if ($this->getUser()) {
            return $this->redirectToRoute('home');
        }
        if ($request->get('email')) {
            $user = $this->entityManager->getRepository(User::class)->findOneByEmail($request->get('email'));
            if ($user){
                //1: Enregistrer en base la demande de reset_password avec user, token, createdAd.
                $reset_password = new ResetPassword();
                $reset_password->setUser($user);
                $reset_password->setToken(uniqid());
                $reset_password->setCreatedAt(new \DateTime());
                $this->entityManager->persist($reset_password);
                $this->entityManager->flush();
 
                // 2: Envoyer un email à l'utilisitateur avec un lien lui permettant de mettre à jour son mot de passe.
                $url =$this->generateUrl('update_password',[
                    'token' =>$reset_password->getToken()
                ]);
                $content = "Bonjour ".$user->getFirstname()."<br/>vous avez demandé à rénitialiser votre mot de passe sur le site E_chry.<br/><br/>";
                $content ="Merci de bien vouloir cliquer sur le lien suivant pour <a href='".$url."'>mettre votre mot de passe</a>.";
                $mail = new Mail();
                $mail->send($user->getEmail(), $user->getLastname(), 'Rénitialiser votre mot de passe sur E_chry', $content);
                $this->addFlash('notice','Vous allez recevoir dans quelques secondes un mail avec la procédure pour réinitialiser votre mot de passe');
 
            }else{
                $this->addFlash('notice','Cette adresse email est inconnue');

            }
        }
        return $this->render('reset_password/index.html.twig');
    }
 
    /**
     * @Route("/modifier-mon-mot-de-passe/{token}", name="update_password")
     */
    public function update(Request $request, $token, UserPasswordEncoderInterface $encoder)
    {
        $reset_password = $this->entityManager->getRepository(ResetPassword::class)->findOneByToken($token);

        if(! $reset_password){
            return $this->redirectToRoute('reset_password');
        }

        //verifier si le createdAt = now-3h
        $now = new \DateTime();
        if($now > $reset_password->getCreatedAt()->modify('+ 3 hour')){
            //modifier mon mot de passe
            $this->addFlash('notice','Votre demande de mot de passe a expiré.Merci de la renouveller');
            return $this->redirectToRoute('reset_password');

        }
        //rendre une vue avec mot de passe et confirmez votre mot de passe
        $form = $this->createForm(ResetPasswordType::class);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){
            $new_pwd = $form->get('new_password')->getData();
             //Encodage des mot de passe
             $password = $encoder->encodePassword($reset_password->getUser(), $new_pwd);
             $reset_password->getUser()->setPassword($password);
             //Flush en BD
            $this->entityManager->flush();
             
             //Redirection de user vers la page de connexion  
             $this->addFlash('notice', 'Votre mot de passe à bien été mis à jour');
             return $this->redirectToRoute('app_login');

        }
        return $this->render('reset_password/update.html.twig',[
            'form' => $form->createView()
        ]);

              
        
    }
}