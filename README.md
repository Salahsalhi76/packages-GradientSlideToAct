## About the creator
This package was created by SALAH EDDINE SALHI in 12-23-2022

## Gradient Slide To Act
slide to act button with simple animations and gradient background
![img.png](img.png)
## Getting started
```yaml
dependencies:
gradient_slide_to_act: any # or the latest version on Pub
```


## Usage


```dart
 GradientSlideToActSalah(
 width: 400,
 textStyle: TextStyle(color: Colors.white),
 backgroundColor: Colors.blue,
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

## Additional information

You can see more examples on pub.dev 
