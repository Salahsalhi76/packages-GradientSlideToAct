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
width: lay.maxWidth,
draggableWidget: const _circle(),
textStyle: mediumStyle(fontSize: 15),
backgroundColor: ColorManager.primary_dark_Color2,
onSubmit: onSubmit,
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

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
