# GLGestureRecognizer #

GLGestureRecognizer is an Objective-C implementation of the $1 Unistroke Recognizer, a simple gesture recognition algorithm (see Credits below). It is made available here in the form of an iPhone application project. It was implemented over the course of a couple evenings in late April 2009 by Adam Preble.

A demo iPhone project (Gestures.xcodeproj) is provided; a UIView subclass receives touch events and sends them to the GLGestureRecognizer class while drawing the touched path in white. Once the gesture is completed, the resampled gesture is shown in green, its center at the red dot, along with the name of the best match, score (lower is better), and gesture orientation. A sample size of 16 points is used in the example, which seems to be adequate for very basic shapes.


# Prerequisites #

You will need TouchJSON from the excellent TouchCode Project to compile the example, but the dependency is only required if you wish to load gesture descriptions from JSON.  Place it in Classes/TouchJSON:
	cd Classes
	svn checkout http://touchcode.googlecode.com/svn/trunk/TouchJSON/Source/ TouchJSON

See also:
	http://touchcode.com/ 


# License #

I am making GLGestureRecognizer available as open source, with the only requirement of using it being that you e-mail me and let me know what you're using it in.  TouchJSON is presently under the MIT license.


# Credits #

$1 Unistroke Recognizer: Jacob O. Wobbrock, Andrew D. Wilson, Yang Li
	http://depts.washington.edu/aimgroup/proj/dollar/

Implemented in Objective-C with iPhone demo project by Adam Preble of Giraffe Lab
 	http://giraffelab.com/code/GLGestureRecognizer

Made available on GitHub: http://github.com/preble/GLGestureRecognizer/tree/master
