Best practices to model Page Object
The main points to be observed are:
* When writing tests the code inside should be implemented to do not change; only the code within the page object needs to change
* A clean separation between test code and page specific code such as locators and layout must be maintained.
* The API of the page object must be formulated in terms of the logical structure of the UI and not in terms of the details of the HTML. 
Basically, the language of the tests and the one in the Page Object's API should be the same
Over this it is possible to define some few best practices in using page objects:
* A page object should not have any assertions
* A page should be verified whether is ready before interacting with it. 
* Allow read-only accessors to get the information shown by the HTML rendered by the widget. These accessors should not receive any parameters, and they should return a value containing the value shown, not a WebElement. The accessor should be named after the information we are looking for. For example, orderView.totalPrice() would return a value with a string with the price shown.
* As an alternative to several read-only accessors, use a single one that will return a value of an object with a field for each information. For example, orderView.info() would return a value of an object with the totalPrice, items, and other such fields.
* Create read/write accessors for the input fields. The read accessor will return a value with the current value of the input. The write accessor receives the new value and returns an empty value that will be fulfilled when the input field's value has been modified. Controls such as checkboxes should model the value as boolean. Multiple choice elements should simply return the values that are selected. Text inputs should be able to receive not only text, but also keys. For example, quantity() would return a value with the value of the quantity field, and quantity('22') should send the corresponding text to the input and return an empty value.
* Create action methods for buttons, links, and others, named after the action the control represents, that will trigger the action. For example, we can have a orderView.addBeverage().addToOrder()method that will issue a click event in the addToOrder button of the form. If we need extra control of the interactivity, we can create, as we did earlier, a small page object for the control, instead of a simple action method. Add methods such as click(), pressEnter(), and isEnabled() to it in order to be able to issue events and inspect the control.
* Model each form as a small nested page object. For example, orderView.addBeverageForm() should return a page object for that form.
As you can see, there are two kinds of methods in a page object: query methods, which return the information shown on a page, and action methods, which interact with the page by sending events and filling inputs.
In general, a page object's query method should return the following:
* Another page object, if there is a composition relationship between both or, in other words, if a widget is inside another widget. If necessary, we can consider forms, and even controls, as small page objects. This is the case when we need to interact with them using different gestures, or we are interested in a lot of information, not only in the value of the inputs.
* A value for a primitive that represents the information shown to the user, or the value of an input.
Action methods are simpler; they simply return a value that will be fulfilled when the action is complete. If necessary, they can take parameters.
