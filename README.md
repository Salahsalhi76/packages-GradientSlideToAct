## About the creator
This package was created by SALAH EDDINE SALHI 

## Gradient Slide To Act
slide to act button with simple animations and gradient background

![img.png](img.png)
![gif](https://user-images.githubusercontent.com/89273323/209432773-f9caffec-b393-407b-b91a-2ee1b8b5169c.gif)
![gif-2](https://user-images.githubusercontent.com/89273323/209432776-455b9c70-d4ab-46c9-a7da-42e7c9df3065.gif)
![gif-3](https://user-images.githubusercontent.com/89273323/209432779-316286b1-273b-497e-b9c9-9eb353fed886.gif)


 
## Usage

![gif](https://user-images.githubusercontent.com/89273323/209432773-f9caffec-b393-407b-b91a-2ee1b8b5169c.gif)

```dart
 GradientSlideToAct(
 width: 400,
 textStyle: TextStyle(color: Colors.white,fontSize: 15),
 backgroundColor: Color(0Xff172663),
 onSubmit: (){
  debugPrint("Submitted!");
 },
 gradient: const LinearGradient(
 begin: Alignment.topLeft,
 end: Alignment.bottomRight,
  colors: [
     Color(0xff0da6c2),
     Color(0xff0E39C6),
   ]
  ),
)
```

![gif-2](https://user-images.githubusercontent.com/89273323/209432776-455b9c70-d4ab-46c9-a7da-42e7c9df3065.gif)

![](../../../Downloads/gif-2.gif)
```dart
     GradientSlideToAct(
       width: 400,
      dragableIcon: Icons.arrow_forward,
       textStyle: mediumStyle(fontSize: 15),
       backgroundColor: Colors.purple,
       onSubmit:  (){},
       gradient:   LinearGradient(
           begin: Alignment.centerLeft,
           colors: [
             Colors.red,
             Colors.purple
           ]
       ),
     )
```

![gif-3](https://user-images.githubusercontent.com/89273323/209432779-316286b1-273b-497e-b9c9-9eb353fed886.gif)

```dart
        GradientSlideToAct(
          width: 400,
          dragableIconBackgroundColor: Colors.greenAccent,
          textStyle: mediumStyle(fontSize: 15),
          backgroundColor: ColorManager.primary_dark_Color2,
          onSubmit: (){},
          gradient:  const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
               Color(0Xff11998E ), 
                Color(0Xff38EF7D), 
              ]
          ),
        )
```


## Additional information

You can view more examples on [pub.dev](https://pub.dev/packages/gradient_slide_to_act)
