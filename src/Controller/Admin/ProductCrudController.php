<?php
 
namespace App\Controller\Admin;
 
use App\Entity\User;
use App\Entity\Product;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Field\SlugField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\HiddenField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
 
class ProductCrudController extends AbstractCrudController
{
   
    public static function getEntityFqcn(): string
    {
        return Product::class;
    }
 
    public function configureFields(string $pageName): iterable
    {
        if ($this->getUser() == true) {
            return [
                TextField::new('name'),
                SlugField::new('slug')->setTargetFieldName('name'),
                ImageField::new('illustration')
                    ->setBasePath('uploads/')
                    ->setUploadDir('/public/uploads')
                    ->setFormTypeOptions(['required' => false])
                    ->setUploadedFileNamePattern('[contenthash].[extension]'),
                TextField::new('subtitle'),
                TextareaField::new('description'),
                HiddenField::new('isBest')->setFormTypeOptions(['data' => 0]),
                //BooleanField::new('isBest')->setFormTypeOptions([])
                MoneyField::new('price')->setCurrency('TND'),
                AssociationField::new('category'),
                HiddenField::new('owner')->setFormTypeOptions(['data' => $this->getUser()->getEmail()])
            ];
        } 
       
        else {
            return [
                TextField::new('name'),
                SlugField::new('slug')->setTargetFieldName('name'),
                ImageField::new('illustration')
                    ->setBasePath('uploads/')
                    ->setUploadDir('/public/uploads')
                    ->setFormTypeOptions(['required' => false])
                    ->setUploadedFileNamePattern('[contenthash].[extension]'),
                TextField::new('subtitle'),
                TextareaField::new('description'),
                BooleanField::new('isBest'),
                MoneyField::new('price')->setCurrency('TND'),
                AssociationField::new('category'),
                HiddenField::new('owner')->setFormTypeOptions(['data' => 'admin'])
            ];
        }
    }

    /*public function statistic(Request $request, UserRepository $userRepository){
        $id = $request->query->get('id');
        $user = $userRepository->find($id);
        dd($user);
    }*/



/*public function configureActions(Actions $actions): Actions
{
    $product= new Product();
    $user = new User();

     //if ($product.owner == user)  {
    if($user->getEmail() == $product->getOwner()) {
    
        return $actions
    
        ->remove(Crud::PAGE_INDEX, Action::EDIT)
        ->remove(Crud::PAGE_INDEX, Action::DELETE)
    ;
        
    }
}*/


    /*public function configureActions(Actions $actions): Actions
    {
        $product= new Product();
        $user = new User();
        
        if (  ! $user->getEmail() == $product->getOwner()) {
            //dump($this->getUser()->getEmail());
    
            return $actions
        
            ->remove(Crud::PAGE_INDEX, Action::EDIT)
            ->remove(Crud::PAGE_INDEX, Action::DELETE)
            
        ;
            
        }
    }*/


/*public function configureActions(Actions $actions): Actions
{
     /*$viewInvoice = Action::new('View Invoice', 'fas fa-file-invoice')
        ->displayIf(static function ($entity) {
            return $entity->isPaid();
        });*/

    /*return $actions
        // ...
        ->add(Crud::PAGE_INDEX, $viewInvoice);
}*/
}