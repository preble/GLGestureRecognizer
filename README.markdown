## GLGestureRecognizer

GLGestureRecognizer is an Objective-C implementation of the [$1 Unistroke Recognizer](http://depts.washington.edu/aimgroup/proj/dollar/), a simple gesture recognition algorithm (see Credits below). It is made available here in the form of an Objective-C class and iPhone demo application. It was implemented over the course of a couple evenings in late April 2009 by Adam Preble.


## Using GLGestureRecognizer In Your Application

Simply copy `GLGestureRecognizer.h` and `GLGestureRecognizer.m` into your project and add them to your app target.  If you wish to load template information (gesture descriptions) from JSON, you will also need `GLGestureRecognizer+JSONTemplates.h` and `.m`.


## Demo Project

A demo iPhone project (`GesturesDemo.xcodeproj`) is provided; a UIView subclass (`GestureView`) receives touch events and sends them to the `GLGestureRecognizer` class while drawing the touched path in white. Once the gesture is completed, the resampled gesture is shown in green, its center at the red dot, along with the name of the best match, score (lower is better), and gesture orientation. A sample size of 16 points is used in the example, which seems to be adequate for very basic shapes.


## Adding Gestures

Gestures are added to `GLGestureRecognizer` using the templates property; see JSONTemplates category method `-loadTemplatesFromJsonData:` implementation for an example of how that is done.

You can add more gestures to the demo application by drawing the new gesture in the demo application itself.  The demo application will print the points to the console in JSON format, which you can then add to the `Gestures.json` file to expand the supported set of gestures.  You will want to use a similar approach to add more gestures if you choose to use a different serialization method.


## License

GLGestureRecognizer is available as open source, with the only requirement of using it being that you e-mail me and let me know what you're using it in.


## Credits

The $1 Unistroke Recognizer algorithm used in GLGestureRecognizer is based on the JavaScript implementation at [http://depts.washington.edu/aimgroup/proj/dollar/](), which is described in the following UIST 2007 paper:

> Wobbrock, J.O., Wilson, A.D. and Li, Y. (2007). Gestures without libraries, toolkits or training: A $1 recognizer for user interface prototypes. _Proceedings of the ACM Symposium on User Interface Software and Technology (UIST '07)_. Newport, Rhode Island (October 7-10, 2007). New York: ACM Press, 159-168.

Implemented in Objective-C with iPhone demo project by Adam Preble of Giraffe Lab [http://giraffelab.com/code/GLGestureRecognizer]()

Made available on GitHub: [http://github.com/preble/GLGestureRecognizer/tree/master]()
