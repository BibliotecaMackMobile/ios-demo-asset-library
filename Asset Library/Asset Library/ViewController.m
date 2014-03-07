//
//  ViewController.m
//  Asset Library
//
//  Created by Lucas on 07/03/14.
//  Copyright (c) 2014 Mackenzie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Actions

- (IBAction)takePhoto:(id)sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (IBAction)savePhoto:(id)sender
{
    //verifica se alguma foto já foi tirada. Se não mostra um alerta e para a execução do método
    if (!_imageView.image) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erro" message:@"Tire uma foto antes!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
        return;
    }

    //instancia usada para acessar o album de fotos
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    UIImage *image = _imageView.image;
    
    [_activityIndicator startAnimating];
    //método para salvar a imagem no álbum de fotos
    [library writeImageToSavedPhotosAlbum:[image CGImage] orientation:(ALAssetOrientation)[image imageOrientation] completionBlock:^(NSURL *assetURL, NSError *error) {
        if (error) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erro ao salvar" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
        } else {
            [_activityIndicator stopAnimating];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Imagem salva!" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
        }
    }];
}

#pragma mark - Image Picker Delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    _imageView.image = image;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


@end
