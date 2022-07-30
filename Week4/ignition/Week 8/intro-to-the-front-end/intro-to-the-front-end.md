### Learning Goals

- Become familiar with the meaning of 'client side' and how our browser compiles our front-end
- Understand the roles of HTML, CSS, and JavaScript in the appearance of our webpage

### Why This Matters

As we begin to build webpages for display in our browser, it is important to understand the roles of our main three technologies that play into the appearance and functionality of our webpage -- HTML, CSS, and JavaScript -- and how our browser compiles and presents them.

### Getting to Know the Front-End

Our webpages have come so far over time! At the beginning of the internet, there were webpages that looked more like essays. We started with big blocks of text on our page, with little differentiating one part of the page from another. However, as time went on, we wanted to add formatting (such as headers, paragraph tags, and links) and styling (such as borders, colors, and fonts). Then, we started getting _really_ fancy: we wanted to respond to user interaction with the page, perhaps by allowing the click of a button to change something else on the page.

#### Front-End Engineering, in a Nutshell

The need for these different functionalities brought us to the three-tiered technology "stack" that we use for most webpages today: HTML, CSS, and JavaScript. Each of these technologies has its own purpose:

- HyperText Markup Language (HTML) drives the structure of a web page (sections, headers, paragraphs, links, etc.)
- Cascading Stylesheets drive the aesthetic of a web page (styling)
- JavaScript drives the functionality of a web page (user interaction)

We will be learning more about each of these technologies soon. But there's one other key player in this game: the browser!

#### The Role of the Browser

Your web browser, whether it's Chrome, Firefox, Vivaldi, or Microsoft Edge, is an application that is locally installed on your machine. It's primarily designed to connect to the Internet and download web pages. Once everything is successfully downloaded, the browser software then works to interpret the downloaded HTML, CSS, and JavaScript to render a user-friendly web page for you to interact with. We call these three technologies "client side" or "front-end" because they are processed on the web **client**, or browser. The browser itself is programmed to read in the HTML and CSS to show a web page, and it also includes a JavaScript interpreter to run any JavaScript you have included with the page (this is why you are able to run JavaScript in your browser's console!).

Because JavaScript runs locally inside of the web browser, it performs operations quickly. If we use it properly, we don't have to reload our web pages or contact the distant server again to make changes to the structure and styling of the rendered document. So, we can use it to provide users with responsive user experiences. For the purposes of web development, we frequently use JavaScript to manipulate the HTML and styling of our web page through an abstraction called the Document Object Model (or DOM, for short).

#### A Word on Browser Caching

Our browsers have powerful features like _caching_, which will allow a web site to keep a version of its static assets, such as a stylesheet, images, or JavaScript code, with the local browser after a user visits the page. We call these files "static assets" because the server does not change them - they are the same regardless of any "state" held by our application. The next time the user visits the page, the browser will use the local version of the static assets. This prevents an unnecessary request to our server(called an HTTP call) and improves user performance, because there is less information to obtain and load each time the page changes.

When our browser first reaches out with a request for a webpage, it has to obtain _all_ information from the remote server in order to load the page: the HTML document, any related stylesheets and images, and the JavaScript code. This can take quite a while! Caching allows our browser to hold on to the static assets, which it doesn't expect to change that often, so that it doesn't have to re-load them every time.

> A good example of this that you may have seen is a webpage with a massive background image. On a slow internet connection, you may see that image slowly load its way down the page. However, the next time you visit the page, it can pop up right away!

What gets cached, and for how long, can vary from website to website. The problem with caching is that as we develop our code, we want to make sure we're always seeing the most recent changes when testing things in our browser. In order to skip the cache and reload _everything_, we need to remember to **hard-refresh** our page.

If you make a change to your code, press `Command + Shift + R` to "hard refresh" the page, that is, to make sure the browser loads the file from the disk. This way, it will skip the files saved in the browser's caching system, and reload everything! You can also use `Ctrl + Shift + r` on a Windows machine.

### In Summary

Our webpages use the trifecta of HTML, CSS, and JavaScript to display a styled and interactive page in our browsers. These three technologies are a part of our front-end stack, and are often referred to as the code in our applications that is "client side". This is in comparison to any "back-end" or "server side" code that we may choose to include in the future. We will take a deeper dive into each of these technologies as we move forward!
