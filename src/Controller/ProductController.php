<?php
 
namespace App\Controller;
 
use App\Classe\Search;
use App\Entity\Auction;
use App\Entity\Product;
use App\Form\SearchType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Core\User\User;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
 
class ProductController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager){
        $this->entityManager = $entityManager;
 
    }

    /**
     * @Route("/nos-produits", name="products")
     */
    public function index(Request $request): Response
    {
        $search = new Search();
        $products = $this->entityManager->getRepository(Product::class)->findAll();

        $search = new Search();
        $form = $this ->createForm(SearchType::class, $search);

        $form ->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){
            $products = $this->entityManager->getRepository(Product::class)->findWithsearch($search);
        
        }else{
            $products = $this->entityManager->getRepository(Product::class)->findAll();

        }
        return $this->render('product/index.html.twig',[
            'products' => $products,
            'form' => $form->createView()
        ]);

       
    }
    /**
     * @Route("/produit/{slug}", name="product")
     */
    public function show($slug): Response
    {
        $product = $this->entityManager->getRepository(Product::class)->findOneBySlug($slug);
        $auctions = $this->entityManager->getRepository(Auction::class)->findBy(array('slug' => $slug));
        $products = $this->entityManager->getRepository(Product::class)->findByIsBest(1);
        //dd($auctions);

 
        if(!$product){
            return $this->redirectToRoute('products');
        }

        if ($this->getUser()) {
            $user = $this->getUser()->getEmail();
        } else {
            $user = '';
            return $this->redirectToRoute('account');
        }
        /*if($this->getUser()->getEmail() == null ){
            return $this->redirectToRoute('account_address');
        } */


        return $this->render('product/show.html.twig',[
            'product' => $product,
            'auctions' => $auctions,
            'products' => $products,
            'user'  =>$user,
            
        ]);
        //$user = new User();
 
       
    }

    



}