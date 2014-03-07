//
//  ViewController.h
//  Asset Library
//
//  Created by Lucas on 07/03/14.
//  Copyright (c) 2014 Mackenzie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

- (IBAction)takePhoto:(id)sender;
- (IBAction)savePhoto:(id)sender;

@end
