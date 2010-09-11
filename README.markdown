## GLGestureRecognizer

GLGestureRecognizer is an Objective-C implementation of the [$1 Unistroke Recognizer](http://depts.washington.edu/aimgroup/proj/dollar/), a simple gesture recognition algorithm (see Credits below). It is made available here in the form of an iPhone application project. It was implemented over the course of a couple evenings in late April 2009 by Adam Preble.


## Prerequisites

GLGestureRecognizer itself has no real prerequisites, but if you want to load your templates from JSON using the included JSONTemplates category you will need TouchJSON from the excellent [TouchCode](http://touchcode.com/) Project.  Because the example uses JSON you will need TouchJSON to compile the example.  Place it in Classes/TouchJSON:

	cd Classes
	svn checkout http://touchcode.googlecode.com/svn/trunk/TouchJSON/Source/ TouchJSON


## Using GLGestureRecognizer In Your Application

Simply copy GLGestureRecognizer.h and GLGestureRecognizer.m into your project and add them to your app target.  If you wish to load template information (gesture descriptions) from JSON, you will also need GLGestureRecognizer+JSONTemplates.h and .m, which require TouchJSON (see Prerequisites).


## Demo Project

A demo iPhone project (Gestures.xcodeproj) is provided; a UIView subclass (GestureView) receives touch events and sends them to the GLGestureRecognizer class while drawing the touched path in white. Once the gesture is completed, the resampled gesture is shown in green, its center at the red dot, along with the name of the best match, score (lower is better), and gesture orientation. A sample size of 16 points is used in the example, which seems to be adequate for very basic shapes.


## Adding Gestures

Gestures are added to GLGestureRecognizer using the templates property; see JSONTemplates category method -loadTemplatesFromJsonData: implementation for an example of how that is done.

You can add more gestures to the demo application by drawing the new gesture in the demo application itself.  The demo application will print the points to the console in JSON format, which you can then add to the Gestures.json file to expand the supported set of gestures.  You will want to use a similar approach to add more gestures if you choose to use a different serialization method.


## License

GLGestureRecognizer is available as open source, with the only requirement of using it being that you e-mail me and let me know what you're using it in.


## Credits

$1 Unistroke Recognizer: Jacob O. Wobbrock, Andrew D. Wilson, Yang Li [http://depts.washington.edu/aimgroup/proj/dollar/]()

Implemented in Objective-C with iPhone demo project by Adam Preble of Giraffe Lab [http://giraffelab.com/code/GLGestureRecognizer]()

Made available on GitHub: [http://github.com/preble/GLGestureRecognizer/tree/master]()
